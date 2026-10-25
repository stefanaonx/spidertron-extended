--control.lua
-- All state that has to survive saving/loading (and stay in sync in multiplayer) lives in `storage`:
--   storage.cooldowns[player_index] = tick at which that player's active ability is ready again
--   storage.fire_waves              = list of {vehicle = LuaEntity, stage = 1..7} for running immolator waves
--   storage.weavers[reg_number]     = {entity, repair_target?, next_search, enemy?, next_enemy_search,
--                                       beam?, beam_kind?, beam_expires, aim? = MapPosition}
--   storage.majors[reg_number]      = {entity, in_combat, next_spawn, drones = {{entity = LuaEntity, born = tick}}}
-- MK3 self-repair is done by the prototype (healing_per_tick), so no entity tracking is needed anymore.

local DEFAULT_SPIDER_COLOR = {r = 1, g = 0.5, b = 0, a = 0.5}

-- colour given on placement when the spidertron still has the default colour
-- (the long names are the AAI programmable vehicles variants)
local placement_colors = {
    ["spidertronmk2"]                                       = {1.0, 0, 0, 0.5},
    ["spidertronmk2-spidertronmk2-rocket-launcher-1"]       = {1.0, 0, 0, 0.5},
    ["spidertronmk3"]                                       = {0.5, 0, 0.5, 0.5},
    ["spidertronmk3-spidertronmk3-rocket-launcher-1"]       = {0.5, 0, 0.5, 0.5},
    ["spidertron-builder"]                                  = {1, 1, 1, 0.5},
    ["immolator"]                                           = {0.17647, 0.56863, 0.86275, 0.5},
    ["immolator-spidertron-immolator-flamethrower"]         = {0.17647, 0.56863, 0.86275, 0.5},
    ["major-spidertron"]                                    = {0.2941, 0.3255, 0.1255, 0.5},
}

-- Ghost Weaver built-in beams (no guns, ammo or energy cell items involved)
local WEAVER_IDLE_SEARCH = 60       -- ticks between repair target searches when nothing needed repair
local WEAVER_ENEMY_SEARCH = 10      -- ticks between enemy searches (the current target is hit every tick)
local WEAVER_RANGE = 24             -- tiles
local WEAVER_BEAM_OFFSET = {0, -0.9}
local WEAVER_BEAM_LIFETIME = 600    -- ticks; the beam entity is renewed before it runs out
-- the beam end moves towards its target by this fraction of the remaining distance each tick,
-- but at least WEAVER_AIM_MIN_STEP tiles, so it sweeps smoothly from target to target
local WEAVER_AIM_EASE = 0.25
local WEAVER_AIM_MIN_STEP = 0.35
-- damage / repair per tick, by Ghost Weaver quality
local WEAVER_POWER_BY_QUALITY = {normal = 1, uncommon = 2, rare = 3, epic = 4, legendary = 5}
-- Weaving Beam strength relative to the Reaping Beam (setting, 10 = same as the Reaping Beam)
local WEAVER_REPAIR_FACTOR = settings.startup["spidertron-builder-healing-beam-ammount"].value / 10
local WEAVER_REAPER_ENABLED = not settings.startup["disable-spidertron-builder-reaper-beam"].value

-- the Ghost Weaver and any variants other mods generate from it (e.g. AAI programmable vehicles)
local weaver_names = {}
for name in pairs(prototypes.get_entity_filtered{{filter = "type", type = "spider-vehicle"}}) do
    if name == "spidertron-builder" or name:find("^spidertron%-builder%-") then
        weaver_names[name] = true
    end
end

-- Major Spidertron Bubblegum escort
local MAJOR_NAME = "major-spidertron"
local BUBBLEGUM_NAME = "major-spidertron-bubblegum"
local BUBBLEGUM_COMBAT_RANGE = 30       -- tiles; an enemy this close means the Major Spidertron is in combat
local BUBBLEGUM_COMBAT_CHECK = 30       -- ticks between combat checks
local BUBBLEGUM_SPAWN_INTERVAL = 5 * 60 -- ticks between spawns while in combat
local BUBBLEGUM_ORBIT_RADIUS = 4        -- tiles
local BUBBLEGUM_ORBIT_PERIOD = 4 * 60   -- ticks for one full orbit
local BUBBLEGUM_LAUNCH_TICKS = 40       -- ticks a new Bubblegum takes to fly from the head to its orbit slot
-- height of the Major Spidertron's head above its ground position (its prototype `height`)
local MAJOR_HEAD_HEIGHT = settings.startup["vanilla-spidertron-size"].value and 1.5 or 1.75
-- Major Spidertron guns
local MAJOR_ENEMY_SEARCH = 100          -- tiles; one nearest-enemy search per check covers combat and gun choice
local ARTILLERY_GUN = "artillery-wagon-cannon" -- vanilla gun, the game handles the Artillery Targeting Remote for it
-- maximum number of Bubblegums per Major Spidertron, by quality
local BUBBLEGUM_MAX_BY_QUALITY = {normal = 3, uncommon = 4, rare = 5, epic = 6, legendary = 7}

local IMMOLATOR_COOLDOWN = 3 * 60 -- ticks
local BUBBLEGUM_COOLDOWN = 10 * 60 -- ticks
local FIRE_WAVE_STAGES = 7 -- wave radius goes 3, 5, 7 ... 15, one ring every 6 ticks

---------------------------------------------------------------------------------------------------
-- storage setup / migration
---------------------------------------------------------------------------------------------------

local function register_weaver(entity)
    if not (entity and entity.valid and weaver_names[entity.name]) then return end
    local id = script.register_on_object_destroyed(entity)
    storage.weavers[id] = storage.weavers[id] or {entity = entity, next_search = 0, next_enemy_search = 0, beam_expires = 0}
end

local function register_major(entity)
    if not (entity and entity.valid and entity.name == MAJOR_NAME) then return end
    local id = script.register_on_object_destroyed(entity)
    storage.majors[id] = storage.majors[id] or {entity = entity, in_combat = false, next_spawn = 0, drones = {}}
end

local function register_spider(entity)
    register_weaver(entity)
    register_major(entity)
end

local function init_storage()
    storage.cooldowns = storage.cooldowns or {}
    storage.fire_waves = storage.fire_waves or {}
    -- (re)find every Ghost Weaver and Major Spidertron, also picks up the ones built before this version
    -- (existing Bubblegum escorts are kept)
    local old_majors = storage.majors or {}
    storage.weavers = {}
    storage.majors = {}
    local names = {}
    for name in pairs(weaver_names) do table.insert(names, name) end
    if prototypes.entity[MAJOR_NAME] then table.insert(names, MAJOR_NAME) end
    if #names > 0 then
        for _, surface in pairs(game.surfaces) do
            for _, entity in pairs(surface.find_entities_filtered{name = names}) do
                register_spider(entity)
            end
        end
    end
    for id, data in pairs(storage.majors) do
        local old = old_majors[id]
        if old then
            -- 0.4.7 kept plain drone entities, newer versions keep {entity, born}
            for i, drone in pairs(old.drones) do
                if type(drone) == "userdata" then old.drones[i] = {entity = drone, born = 0} end
            end
            storage.majors[id] = old
        end
    end
    -- entity lists used by versions <= 0.4.4, no longer needed
    storage.spidertronmk2 = nil
    storage.spidertronmk3 = nil
    storage.spidertron_builder = nil
    storage.immolator = nil
    storage.major_spidertron = nil
end

script.on_init(init_storage)
script.on_configuration_changed(init_storage)

---------------------------------------------------------------------------------------------------
-- helpers
---------------------------------------------------------------------------------------------------

local function has_default_color(color)
    if not color then return true end
    local function close(a, b) return math.abs(a - b) < 0.001 end
    return close(color.r, DEFAULT_SPIDER_COLOR.r) and close(color.g, DEFAULT_SPIDER_COLOR.g)
        and close(color.b, DEFAULT_SPIDER_COLOR.b) and close(color.a, DEFAULT_SPIDER_COLOR.a)
end

local function is_on_cooldown(player_index)
    local ready_at = storage.cooldowns[player_index]
    return ready_at ~= nil and game.tick < ready_at
end

local function start_cooldown(player_index, ticks)
    storage.cooldowns[player_index] = game.tick + ticks
end

-- returns the player's vehicle if it is the given spidertron, nil otherwise
local function get_player_spider(player_index, name)
    local player = game.get_player(player_index)
    if not (player and player.valid) then return nil, nil end
    local vehicle = player.vehicle
    if vehicle and vehicle.valid and vehicle.name == name then
        return vehicle, player
    end
    return nil, player
end

---------------------------------------------------------------------------------------------------
-- placement / removal
---------------------------------------------------------------------------------------------------

local function on_spider_built(event)
    local entity = event.entity
    if not (entity and entity.valid) then return end

    local color = placement_colors[entity.name] or (weaver_names[entity.name] and placement_colors["spidertron-builder"])
    if color and has_default_color(entity.color) then
        entity.color = color
    end

    register_spider(entity)
end

-- event filters only for entities that exist (the AAI variants are only there with AAI installed)
local function name_filters(names)
    local filters = {}
    local seen = {}
    for _, list in pairs(names) do
        for name in pairs(list) do
            if prototypes.entity[name] and not seen[name] then
                seen[name] = true
                table.insert(filters, {filter = "name", name = name})
            end
        end
    end
    return filters
end
local built_filters = name_filters{placement_colors, weaver_names, {[MAJOR_NAME] = true}}

script.on_event(defines.events.on_built_entity, on_spider_built, built_filters)
script.on_event(defines.events.on_robot_built_entity, on_spider_built, built_filters)
script.on_event(defines.events.script_raised_built, on_spider_built, built_filters)
script.on_event(defines.events.script_raised_revive, on_spider_built, built_filters)
script.on_event(defines.events.on_entity_cloned, function(event) register_spider(event.destination) end)

script.on_event(defines.events.on_object_destroyed, function(event)
    local weaver = storage.weavers[event.registration_number]
    if weaver and weaver.beam and weaver.beam.valid then weaver.beam.destroy() end
    storage.weavers[event.registration_number] = nil
    storage.majors[event.registration_number] = nil
end)

---------------------------------------------------------------------------------------------------
-- Ghost Weaver: Weaving Beam (repair) and Reaping Beam (attack)
-- Always active, whether the Ghost Weaver is driven, remote controlled or parked.
---------------------------------------------------------------------------------------------------

local function needs_repair(weaver, target)
    return target and target.valid and target ~= weaver and target.surface == weaver.surface
        and target.health and target.health < target.max_health
        and target.type ~= "spider-leg"
        and (target.position.x - weaver.position.x) ^ 2 + (target.position.y - weaver.position.y) ^ 2 <= WEAVER_RANGE ^ 2
end

local function find_repair_target(weaver)
    local best, best_ratio
    for _, entity in pairs(weaver.surface.find_entities_filtered{
        position = weaver.position, radius = WEAVER_RANGE, force = weaver.force
    }) do
        if needs_repair(weaver, entity) then
            local ratio = entity.health / entity.max_health
            if not best_ratio or ratio < best_ratio then
                best, best_ratio = entity, ratio
            end
        end
    end
    return best
end

local function quality_power(entity)
    local quality = entity.quality
    if not quality then return 1 end
    -- modded qualities fall back to their level (normal = 0 -> 1, capped at 5)
    return WEAVER_POWER_BY_QUALITY[quality.name] or math.min(5, 1 + quality.level)
end

local function in_range(weaver, target)
    local dx, dy = target.position.x - weaver.position.x, target.position.y - weaver.position.y
    return dx * dx + dy * dy <= WEAVER_RANGE * WEAVER_RANGE
end

local function stop_beam(data)
    if data.beam and data.beam.valid then data.beam.destroy() end
    data.beam, data.beam_kind, data.aim = nil, nil, nil
end

-- makes sure a beam of the right kind exists, starting at the current aim point
local function ensure_beam(data, kind, tick)
    local beam = data.beam
    if beam and beam.valid and data.beam_kind == kind and tick < data.beam_expires then return end
    if beam and beam.valid then beam.destroy() end
    local weaver = data.entity
    -- a fresh beam starts right at the Ghost Weaver and sweeps out to its target
    data.aim = data.aim or {x = weaver.position.x, y = weaver.position.y + WEAVER_BEAM_OFFSET[2]}
    data.beam = weaver.surface.create_entity{
        name = kind,
        position = weaver.position,
        source = weaver,
        source_offset = WEAVER_BEAM_OFFSET,
        target_position = data.aim,
        duration = WEAVER_BEAM_LIFETIME,
        max_length = WEAVER_RANGE + 2
    }
    data.beam_kind = kind
    data.beam_expires = tick + WEAVER_BEAM_LIFETIME - 1
end

-- moves the beam end towards the target, returns true once it is on the target
local function sweep_beam(data, target)
    local aim, goal = data.aim, target.position
    local dx, dy = goal.x - aim.x, goal.y - aim.y
    local dist = math.sqrt(dx * dx + dy * dy)
    local step = math.max(WEAVER_AIM_MIN_STEP, dist * WEAVER_AIM_EASE)
    local arrived = dist <= step
    if arrived then
        aim.x, aim.y = goal.x, goal.y
    else
        aim.x, aim.y = aim.x + dx / dist * step, aim.y + dy / dist * step
    end
    if data.beam and data.beam.valid then data.beam.set_beam_target(aim) end
    return arrived
end

local function find_enemy(data, tick)
    local weaver = data.entity
    local enemy = data.enemy
    if enemy and enemy.valid and enemy.health and in_range(weaver, enemy) and tick < data.next_enemy_search then
        return enemy
    end
    data.next_enemy_search = tick + WEAVER_ENEMY_SEARCH
    enemy = weaver.surface.find_nearest_enemy{position = weaver.position, max_distance = WEAVER_RANGE, force = weaver.force}
    if not (enemy and enemy.valid and enemy.health) then enemy = nil end
    data.enemy = enemy
    return enemy
end

local function find_repair(data, tick)
    local weaver = data.entity
    if needs_repair(weaver, data.repair_target) then return data.repair_target end
    data.repair_target = nil
    if tick >= data.next_search then
        data.repair_target = find_repair_target(weaver)
        if not data.repair_target then
            data.next_search = tick + WEAVER_IDLE_SEARCH
        end
    end
    return data.repair_target
end

-- one beam at a time, every tick; offense first
local function weaver_tick(data, tick)
    local weaver = data.entity
    local enemy = WEAVER_REAPER_ENABLED and find_enemy(data, tick) or nil
    local target = enemy or find_repair(data, tick)
    if not target then
        stop_beam(data)
        return
    end
    ensure_beam(data, enemy and "weaver-reaper-beam" or "weaver-repair-beam", tick)
    if not sweep_beam(data, target) then return end -- still sweeping towards the target
    local power = quality_power(weaver)
    if enemy then
        enemy.damage(power, weaver.force, "laser", weaver, weaver)
    else
        target.health = math.min(target.max_health, target.health + power * WEAVER_REPAIR_FACTOR)
    end
end

---------------------------------------------------------------------------------------------------
-- immolator active ability: fire wave
---------------------------------------------------------------------------------------------------

local function fire_ring(vehicle, size)
    local surface = vehicle.surface
    local center = vehicle.position
    local dots_per_circle = 30
    for i = 1, 360 do
        local angle = i * math.pi / dots_per_circle
        surface.create_entity{
            name = "purifier-flame",
            position = {x = center.x + math.cos(angle) * size, y = center.y + math.sin(angle) * size},
            force = "neutral"
        }
    end
end

script.on_event("immolator-active1", function(event)
    local vehicle = get_player_spider(event.player_index, "immolator")
    if not vehicle or is_on_cooldown(event.player_index) then return end
    start_cooldown(event.player_index, IMMOLATOR_COOLDOWN)
    table.insert(storage.fire_waves, {vehicle = vehicle, stage = 1})
end)

script.on_nth_tick(6, function()
    local waves = storage.fire_waves
    for i = #waves, 1, -1 do
        local wave = waves[i]
        if wave.vehicle.valid then
            fire_ring(wave.vehicle, 1 + 2 * wave.stage)
        end
        wave.stage = wave.stage + 1
        if wave.stage > FIRE_WAVE_STAGES or not wave.vehicle.valid then
            table.remove(waves, i)
        end
    end
end)

-- immolator passive ability (SHIFT + G) is not implemented yet; the custom input is kept for it

---------------------------------------------------------------------------------------------------
-- Major Spidertron: Bubblegum escort
-- A Bubblegum is spawned when the Major Spidertron enters combat (an enemy within
-- BUBBLEGUM_COMBAT_RANGE) and every 5 seconds while it stays in combat, up to a maximum that
-- depends on the Major Spidertron's quality. Bubblegums orbit the Major Spidertron until they
-- expire or are destroyed. Works whether the Major Spidertron is driven, remote controlled or parked.
---------------------------------------------------------------------------------------------------

local function bubblegum_max(major)
    local quality = major.quality
    if not quality then return BUBBLEGUM_MAX_BY_QUALITY.normal end
    -- modded qualities fall back to their level (normal = 0 -> 3, capped at 7)
    return BUBBLEGUM_MAX_BY_QUALITY[quality.name] or math.min(7, 3 + quality.level)
end

local function prune_drones(data)
    local drones = data.drones
    for i = #drones, 1, -1 do
        local drone = drones[i].entity
        if not (drone.valid and drone.surface == data.entity.surface) then
            table.remove(drones, i)
        end
    end
end

local function orbit_position(major, index, count, tick)
    local angle = 2 * math.pi * (tick / BUBBLEGUM_ORBIT_PERIOD + (index - 1) / count)
    local center = major.position
    return {x = center.x + math.cos(angle) * BUBBLEGUM_ORBIT_RADIUS,
            y = center.y + math.sin(angle) * BUBBLEGUM_ORBIT_RADIUS}
end

local function head_position(major)
    return {x = major.position.x, y = major.position.y - MAJOR_HEAD_HEIGHT}
end

-- spawns one Bubblegum from the Major Spidertron's head if below the quality limit, returns true on success
local function spawn_bubblegum(data, tick)
    local major = data.entity
    prune_drones(data)
    if #data.drones >= bubblegum_max(major) then return false end
    local drone = major.surface.create_entity{
        name = BUBBLEGUM_NAME,
        position = head_position(major),
        force = major.force
    }
    if not drone then return false end
    table.insert(data.drones, {entity = drone, born = tick})
    return true
end

local function smoothstep(t) return t * t * (3 - 2 * t) end

-- new drones fly out from the head to their orbit slot, then keep orbiting the body
local function bubblegum_tick(data, tick)
    local drones = data.drones
    if #drones == 0 then return end
    prune_drones(data)
    local major = data.entity
    local count = #drones
    local head
    for i = 1, count do
        local drone = drones[i]
        local goal = orbit_position(major, i, count, tick)
        local age = tick - drone.born
        if age < BUBBLEGUM_LAUNCH_TICKS then
            head = head or head_position(major)
            local t = smoothstep(age / BUBBLEGUM_LAUNCH_TICKS)
            goal = {x = head.x + (goal.x - head.x) * t, y = head.y + (goal.y - head.y) * t}
        end
        drone.entity.teleport(goal)
    end
end

---------------------------------------------------------------------------------------------------
-- Major Spidertron: gun rotation
-- Engine weapon cycling is off (it stops the Artillery Targeting Remote from working), so the combat
-- check (every 30 ticks, reusing its one nearest-enemy search) rotates the selected gun instead:
--  * enemies within 100 tiles: move on to the next gun that has ammo and the nearest enemy in range
--    (machine gun 0-30, cannon 5-100, artillery from 32), so every usable gun gets turns while walking
--  * no enemy within 100 tiles: select the artillery (if loaded), ready for far targets and the remote
---------------------------------------------------------------------------------------------------

-- {name, range, min_range} for each gun slot of the Major Spidertron, read from the prototypes
local major_guns = {}
if prototypes.entity[MAJOR_NAME] then
    for i, gun in pairs(prototypes.entity[MAJOR_NAME].indexed_guns or {}) do
        local attack = gun.attack_parameters or {}
        major_guns[i] = {name = gun.name, range = attack.range or 0, min_range = attack.min_range or 0}
    end
end
local artillery_slot
for i, gun in pairs(major_guns) do
    if gun.name == ARTILLERY_GUN then artillery_slot = i end
end

local function gun_usable(major, ammo, slot, distance)
    local stack = ammo[slot]
    if not (stack and stack.valid_for_read) then return false end
    local gun = major_guns[slot]
    if slot == artillery_slot then
        -- artillery targets are usually far away: usable unless the nearest enemy is inside its minimum range
        return distance == nil or distance >= gun.min_range
    end
    return distance ~= nil and distance >= gun.min_range and distance <= gun.range
end

local function choose_gun(major, distance)
    local count = #major_guns
    if count == 0 then return end
    local current = major.selected_gun_index
    local ammo = major.get_inventory(defines.inventory.spider_ammo)
    if not (current and ammo) then return end
    if distance == nil then
        -- nothing nearby: keep the artillery selected for far targets and the Artillery Targeting Remote
        if artillery_slot and current ~= artillery_slot and gun_usable(major, ammo, artillery_slot, nil) then
            major.selected_gun_index = artillery_slot
        end
        return
    end
    -- enemies nearby: next usable gun after the current one (the current one again if it is the only one)
    for step = 1, count do
        local slot = (current - 1 + step) % count + 1
        if gun_usable(major, ammo, slot, distance) then
            if slot ~= current then major.selected_gun_index = slot end
            return
        end
    end
end

script.on_nth_tick(BUBBLEGUM_COMBAT_CHECK, function(event)
    for id, data in pairs(storage.majors) do
        local major = data.entity
        if not major.valid then
            storage.majors[id] = nil
        else
            local enemy = major.surface.find_nearest_enemy{
                position = major.position, max_distance = MAJOR_ENEMY_SEARCH, force = major.force
            }
            local distance
            if enemy then
                local dx, dy = enemy.position.x - major.position.x, enemy.position.y - major.position.y
                distance = math.sqrt(dx * dx + dy * dy)
            end
            choose_gun(major, distance)
            if distance and distance <= BUBBLEGUM_COMBAT_RANGE then
                if not data.in_combat then
                    -- entering combat: spawn right away
                    data.in_combat = true
                    spawn_bubblegum(data, event.tick)
                    data.next_spawn = event.tick + BUBBLEGUM_SPAWN_INTERVAL
                elseif event.tick >= data.next_spawn then
                    spawn_bubblegum(data, event.tick)
                    data.next_spawn = event.tick + BUBBLEGUM_SPAWN_INTERVAL
                end
            else
                data.in_combat = false
            end
        end
    end
end)

-- every tick: Ghost Weaver beams and the Bubblegum escort movement
script.on_event(defines.events.on_tick, function(event)
    local tick = event.tick
    for id, data in pairs(storage.weavers) do
        if data.entity.valid then
            weaver_tick(data, tick)
        else
            stop_beam(data)
            storage.weavers[id] = nil
        end
    end
    for _, data in pairs(storage.majors) do
        if data.entity.valid then
            bubblegum_tick(data, tick)
        end
    end
end)

-- SHIFT + F while driving: spawn one extra Bubblegum right away (still limited by quality, 10 s cooldown)
script.on_event("major-spidertron-active1", function(event)
    local vehicle = get_player_spider(event.player_index, MAJOR_NAME)
    if not vehicle or is_on_cooldown(event.player_index) then return end
    register_major(vehicle)
    local data = storage.majors[script.register_on_object_destroyed(vehicle)]
    if data and spawn_bubblegum(data, event.tick) then
        start_cooldown(event.player_index, BUBBLEGUM_COOLDOWN)
    end
end)

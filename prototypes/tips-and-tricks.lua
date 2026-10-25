-- Tips and tricks for Spidertron Extended: one overview plus one simulation per spidertron.
-- Simulations run in their own sandbox without this mod's control.lua, so the scripted abilities
-- (Ghost Weaver beams, Immolator fire wave, Major Spidertron gun rotation and Bubblegum escort)
-- are reproduced inside each simulation with the same rules and numbers as control.lua.

-- shared helpers, put in front of every simulation script
local prelude = [=[
  surface = game.surfaces[1]
  surface.build_checkerboard{{-28, -14}, {28, 14}}
  game.simulation.camera_position = {0, 0}
  game.simulation.camera_zoom = 0.9

  colors =
  {
    ["spidertronmk2"] = {1.0, 0, 0, 0.5},
    ["spidertronmk3"] = {0.5, 0, 0.5, 0.5},
    ["spidertron-builder"] = {1, 1, 1, 0.5},
    ["immolator"] = {0.17647, 0.56863, 0.86275, 0.5},
    ["major-spidertron"] = {0.2941, 0.3255, 0.1255, 0.5}
  }

  -- creates a spidertron with its colour and fills its ammo slots ({item stack per gun slot})
  function make_spider(name, position, ammo)
    local spider = surface.create_entity{name = name, position = position, force = "player"}
    spider.color = colors[name]
    local inventory = spider.get_inventory(defines.inventory.spider_ammo)
    for slot, stack in pairs(ammo or {}) do
      if inventory and inventory[slot] then inventory[slot].set_stack(stack) end
    end
    return spider
  end

  -- a small group of biters coming in from the right and attacking the target
  function send_biters(names, x, target)
    for i, name in pairs(names) do
      local biter = surface.create_entity{name = name, position = {x + (i % 2) * 2, -5 + i * 2}, force = "enemy"}
      if biter and target.valid then
        biter.commandable.set_command{type = defines.command.attack, target = target, distraction = defines.distraction.by_enemy}
      end
    end
  end

  function distance(a, b)
    local dx, dy = a.x - b.x, a.y - b.y
    return math.sqrt(dx * dx + dy * dy)
  end
]=]

local function simulation(script_body)
  return {init = prelude .. script_body}
end

-- Overview: the five spidertrons side by side, walking up and down (the Immolator stays put so its
-- burning footsteps don't cover the scene)
local spidertron_extended = simulation([=[
  game.simulation.camera_zoom = 0.75
  local walkers =
  {
    make_spider("spidertronmk2", {-20, -3}),
    make_spider("spidertronmk3", {-10, 3}),
    make_spider("spidertron-builder", {0, -3}),
    make_spider("major-spidertron", {20, 3})
  }
  make_spider("immolator", {10, 0})
  script.on_nth_tick(240, function()
    for _, spider in pairs(walkers) do
      if spider.valid then
        spider.autopilot_destination = {spider.position.x, spider.position.y < 0 and 3 or -3}
      end
    end
  end)
]=])

-- Spidertron MK2: longer-range rocket launchers pick off biters long before they arrive
local spidertron_extended_mk2 = simulation([=[
  local rockets = {name = "rocket", count = 100}
  spider = make_spider("spidertronmk2", {-16, 0}, {rockets, rockets, rockets, rockets})
  send_biters({"small-biter", "medium-biter", "small-biter", "small-biter"}, 22, spider)
  script.on_nth_tick(360, function()
    if spider.valid then
      send_biters({"small-biter", "medium-biter", "small-biter", "medium-biter"}, 22, spider)
    end
  end)
]=])

-- Spidertron MK3: tougher enemies, and the MK3 repairs itself (15 HP per second) between waves
local spidertron_extended_mk3 = simulation([=[
  local rockets = {name = "rocket", count = 100}
  spider = make_spider("spidertronmk3", {-16, 0}, {rockets, rockets, rockets, rockets})
  spider.health = spider.max_health * 0.35
  send_biters({"big-biter", "medium-biter", "big-biter"}, 22, spider)
  script.on_nth_tick(720, function()
    if not spider.valid then return end
    if spider.health > spider.max_health * 0.9 then
      spider.health = spider.max_health * 0.35 -- start the repair demonstration again
    end
    send_biters({"big-biter", "medium-biter", "big-biter", "medium-biter"}, 22, spider)
  end)
]=])

-- Ghost Weaver: one beam at a time, attack first. The Weaving Beam repairs damaged walls and turrets,
-- the Reaping Beam takes over whenever a biter comes within 24 tiles. Same rules as control.lua.
local spidertron_extended_builder = simulation([=[
  weaver = make_spider("spidertron-builder", {-12, 0})
  structures = {}
  for y = -4, 4, 2 do
    table.insert(structures, surface.create_entity{name = "stone-wall", position = {0, y}, force = "player"})
  end
  table.insert(structures, surface.create_entity{name = "gun-turret", position = {-3, -5}, force = "player"})
  table.insert(structures, surface.create_entity{name = "gun-turret", position = {-3, 5}, force = "player"})

  function damage_structures()
    for _, structure in pairs(structures) do
      if structure.valid then structure.health = structure.max_health * 0.3 end
    end
  end
  damage_structures()

  local RANGE, POWER, OFFSET, LIFETIME = 24, 1, {0, -0.9}, 600
  local beam, beam_kind, beam_expires, aim

  local function stop_beam()
    if beam and beam.valid then beam.destroy() end
    beam, beam_kind, aim = nil, nil, nil
  end

  local function most_damaged()
    local best, best_ratio
    for _, structure in pairs(structures) do
      if structure.valid and structure.health < structure.max_health
        and distance(structure.position, weaver.position) <= RANGE then
        local ratio = structure.health / structure.max_health
        if not best_ratio or ratio < best_ratio then best, best_ratio = structure, ratio end
      end
    end
    return best
  end

  script.on_nth_tick(1, function(event)
    if not weaver.valid then return end
    local enemy = surface.find_nearest_enemy{position = weaver.position, max_distance = RANGE, force = weaver.force}
    if enemy and not enemy.health then enemy = nil end
    local target = enemy or most_damaged()
    if not target then stop_beam() return end

    local kind = enemy and "weaver-reaper-beam" or "weaver-repair-beam"
    if not (beam and beam.valid) or beam_kind ~= kind or event.tick >= beam_expires then
      if beam and beam.valid then beam.destroy() end
      aim = aim or {x = weaver.position.x, y = weaver.position.y + OFFSET[2]}
      beam = surface.create_entity{name = kind, position = weaver.position, source = weaver, source_offset = OFFSET,
        target_position = aim, duration = LIFETIME, max_length = RANGE + 2}
      beam_kind, beam_expires = kind, event.tick + LIFETIME - 1
    end

    -- sweep the beam end towards the target, hit once it is there
    local goal = target.position
    local dist = distance(goal, aim)
    local step = math.max(0.35, dist * 0.25)
    if dist > step then
      aim = {x = aim.x + (goal.x - aim.x) / dist * step, y = aim.y + (goal.y - aim.y) / dist * step}
      if beam and beam.valid then beam.set_beam_target(aim) end
      return
    end
    aim = {x = goal.x, y = goal.y}
    if beam and beam.valid then beam.set_beam_target(aim) end
    if enemy then
      enemy.damage(POWER, weaver.force, "laser", weaver, weaver)
    else
      target.health = math.min(target.max_health, target.health + POWER)
    end
  end)

  script.on_nth_tick(900, function()
    damage_structures()
    send_biters({"medium-biter"}, 20, weaver)
  end)
]=])

-- Immolator: walks around leaving burning footsteps, flamethrowers at close range, and the fire wave
-- (rings of fire 3 to 15 tiles out, one every 6 ticks) when biters get close. Same rules as control.lua.
local spidertron_extended_immolator = simulation([=[
  local fuel = {name = "flamethrower-ammo", count = 100}
  immolator = make_spider("immolator", {-16, 0}, {fuel, fuel, fuel, fuel})
  local wave_stage, wave_ready = nil, 0

  -- fire walk flames are placed by control.lua, which doesn't run in simulations: same leg check here
  local feet = {}
  script.on_nth_tick(3, function()
    if not immolator.valid then return end
    for i, leg in pairs(immolator.get_spider_legs()) do
      local p, foot = leg.position, feet[i]
      if not foot then
        feet[i] = {prev = p, planted = p}
      else
        local rest = (p.x - foot.prev.x) ^ 2 + (p.y - foot.prev.y) ^ 2 < 0.0001
        local stepped = (p.x - foot.planted.x) ^ 2 + (p.y - foot.planted.y) ^ 2 > 0.25
        if rest and stepped then
          foot.planted = p
          immolator.surface.create_entity{name = "purifier-flame", position = p, force = "neutral"}
        end
        foot.prev = p
      end
    end
  end)

  script.on_nth_tick(300, function()
    if immolator.valid then
      immolator.autopilot_destination = {immolator.position.x < -10 and -6 or -16, 0}
    end
  end)

  script.on_nth_tick(600, function()
    if immolator.valid then
      send_biters({"medium-biter", "small-biter", "medium-biter", "small-biter", "medium-biter"}, 20, immolator)
    end
  end)

  script.on_nth_tick(6, function(event)
    if not immolator.valid then return end
    if not wave_stage then
      local enemy = surface.find_nearest_enemy{position = immolator.position, max_distance = 14, force = immolator.force}
      if enemy and event.tick >= wave_ready then
        wave_stage, wave_ready = 1, event.tick + 3 * 60
      end
      return
    end
    local size, center = 1 + 2 * wave_stage, immolator.position
    for i = 1, 60 do
      local angle = i * math.pi / 30
      surface.create_entity{name = "purifier-flame", force = "neutral",
        position = {x = center.x + math.cos(angle) * size, y = center.y + math.sin(angle) * size}}
    end
    wave_stage = wave_stage < 7 and wave_stage + 1 or nil
  end)
]=])

-- Major Spidertron: machine gun and cannon take turns, and Bubblegum drones launch from its head when
-- biters come within 30 tiles (one every 5 seconds, up to 3 at normal quality) and orbit it.
local spidertron_extended_major = simulation([=[
  major = make_spider("major-spidertron", {-14, 0}, {
    {name = "firearm-magazine", count = 200},
    {name = "cannon-shell", count = 100}
  })
  local HEAD, RADIUS, PERIOD, LAUNCH = 1.75, 4, 240, 40
  local drones, next_spawn = {}, 0

  local function orbit(index, count, tick)
    local angle = 2 * math.pi * (tick / PERIOD + (index - 1) / count)
    return {x = major.position.x + math.cos(angle) * RADIUS, y = major.position.y + math.sin(angle) * RADIUS}
  end

  script.on_nth_tick(1, function(event)
    if not major.valid then return end
    for i = #drones, 1, -1 do
      if not drones[i].entity.valid then table.remove(drones, i) end
    end
    local head = {x = major.position.x, y = major.position.y - HEAD}
    for i, drone in pairs(drones) do
      local goal = orbit(i, #drones, event.tick)
      local age = event.tick - drone.born
      if age < LAUNCH then
        local t = age / LAUNCH
        t = t * t * (3 - 2 * t)
        goal = {x = head.x + (goal.x - head.x) * t, y = head.y + (goal.y - head.y) * t}
      end
      drone.entity.teleport(goal)
    end
  end)

  script.on_nth_tick(30, function(event)
    if not major.valid then return end
    local enemy = surface.find_nearest_enemy{position = major.position, max_distance = 100, force = major.force}
    local d = enemy and distance(enemy.position, major.position)
    -- gun rotation: machine gun up to 30 tiles, cannon from 5 to 100 tiles
    if d then
      local machine_gun_ok, cannon_ok = d <= 30, d >= 5
      if major.selected_gun_index == 1 and cannon_ok then
        major.selected_gun_index = 2
      elseif machine_gun_ok then
        major.selected_gun_index = 1
      end
    end
    -- Bubblegum escort
    if d and d <= 30 and event.tick >= next_spawn and #drones < 3 then
      local drone = surface.create_entity{name = "major-spidertron-bubblegum", force = major.force,
        position = {x = major.position.x, y = major.position.y - HEAD}}
      if drone then table.insert(drones, {entity = drone, born = event.tick}) end
      next_spawn = event.tick + 5 * 60
    end
  end)

  send_biters({"medium-biter", "medium-biter", "big-biter", "medium-biter"}, 22, major)
  script.on_nth_tick(600, function()
    if major.valid then
      send_biters({"medium-biter", "big-biter", "medium-biter", "big-biter"}, 22, major)
    end
  end)
]=])


data:extend({
    {
        type = "tips-and-tricks-item-category",
        name = "spidertron-extended",
        order = "s-[spidertron]"
    },
    {
        type = "tips-and-tricks-item",
        name = "spidertron-extended",
        category = "spidertron-extended",
        order = "a",
        is_title = true,
        trigger =
        {
            type = "unlock-recipe",
            recipe = "spidertron"
        },
        skip_trigger =
        {
          type = "enter-vehicle",
          vehicle = "spidertron",
          match_type_only = true,
          count = 5
        },
        simulation = spidertron_extended
    },
    {
        type = "tips-and-tricks-item",
        name = "spidertronmk2",
        tag = "[entity=spidertronmk2]",
        category = "spidertron-extended",
        order = "b",
        indent = 1,
        trigger =
        {
            type = "unlock-recipe",
            recipe = "spidertronmk2"
        },
        skip_trigger =
        {
          type = "enter-vehicle",
          vehicle = "spidertronmk2",
          match_type_only = true,
          count = 5
        },
        simulation = spidertron_extended_mk2
    },
    {
        type = "tips-and-tricks-item",
        name = "spidertronmk3",
        tag = "[entity=spidertronmk3]",
        category = "spidertron-extended",
        order = "c",
        indent = 1,
        trigger =
        {
            type = "unlock-recipe",
            recipe = "spidertronmk3"
        },
        skip_trigger =
        {
          type = "enter-vehicle",
          vehicle = "spidertronmk3",
          match_type_only = true,
          count = 5
        },
        simulation = spidertron_extended_mk3
    },
    {
        type = "tips-and-tricks-item",
        name = "spidertron-builder",
        tag = "[entity=spidertron-builder]",
        category = "spidertron-extended",
        order = "d",
        indent = 1,
        trigger =
        {
            type = "unlock-recipe",
            recipe = "spidertron-builder"
        },
        skip_trigger =
        {
          type = "enter-vehicle",
          vehicle = "spidertron-builder",
          match_type_only = true,
          count = 5
        },
        simulation = spidertron_extended_builder
    },
    {
        type = "tips-and-tricks-item",
        name = "immolator",
        tag = "[entity=immolator]",
        category = "spidertron-extended",
        order = "e",
        indent = 1,
        trigger =
        {
            type = "unlock-recipe",
            recipe = "immolator"
        },
        skip_trigger =
        {
          type = "enter-vehicle",
          vehicle = "immolator",
          match_type_only = true,
          count = 5
        },
        simulation = spidertron_extended_immolator
    },
    {
        type = "tips-and-tricks-item",
        name = "major-spidertron",
        tag = "[entity=major-spidertron]",
        category = "spidertron-extended",
        order = "f",
        indent = 1,
        trigger =
        {
            type = "unlock-recipe",
            recipe = "major-spidertron"
        },
        skip_trigger =
        {
          type = "enter-vehicle",
          vehicle = "major-spidertron",
          match_type_only = true,
          count = 5
        },
        simulation = spidertron_extended_major
    }
})

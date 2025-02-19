--control.lua

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end


-- was looking to make a general function for comparison arrays
-- but was to lazy
-- function checks if colors given are default for spider
function check_spider_colors(colors)
    if colors.r == 1 and 
       colors.g == 0.5 and 
       colors.b == 0 and 
       colors.a == 0.5 then
        return true
    end
    return false
end


script.on_event(defines.events.on_entity_damaged,
function(event)
    if event.entity.name == "immolator" then
        if event.damage_type.name == "fire" then
            -- event.entity.health = event.entity.health + event.final_damage_amount
        end
    end
end)


-- script to modify the spidertronmk2 and spidertronmk3 color on placement
script.on_event(defines.events.on_built_entity,
function(event)
    local default_color = {
        ["r"] = 1,
        ["g"] = 0.5,
        ["b"] = 0,
        ["a"] = 0.5
    }
    if event.entity.name == "spidertronmk2" or
        event.entity.name == "spidertronmk2-spidertronmk2-rocket-launcher-1" then
        local spidertronmk2 = event.entity
        if check_spider_colors(spidertronmk2.color) then
            spidertronmk2.color = {1.0, 0, 0, 0.5}
        end
    elseif event.entity.name == "spidertronmk3" or
        event.entity.name == "spidertronmk3-spidertronmk3-rocket-launcher-1" then

        local new_spidertronmk3 = event.entity
        -- game.print(dump(spidertronmk3.color))
        if check_spider_colors(new_spidertronmk3.color) then
            new_spidertronmk3.color = {0.5, 0, 0.5, 0.5}
        end
        -- when spidertronmk3 is created add it to the table
        table.insert(spidertronmk3, new_spidertronmk3)
    elseif event.entity.name == "spidertron-builder" then
        local spidertron_builder = event.entity
        if check_spider_colors(spidertron_builder.color) then
            spidertron_builder.color = {1, 1, 1, 0.5}
        end
        -- game.print(spidertron_builder.get_inventory)
        -- adding the batteries automatically on placement
        -- TODO need to add higher quality batteries if higher quality spidertron is placed
        spidertron_builder.insert({name="retrofitted-battery"})
        spidertron_builder.insert({name="retrofitted-battery2"})
    elseif event.entity.name == "spidertron-builder-spidertron-experimental-laser" then
        local spidertron_builder = event.entity
        if check_spider_colors(spidertron_builder.color) then
            spidertron_builder.color = {1, 1, 1, 0.5}
        end
        -- game.print(spidertron_builder.get_inventory)
        -- adding the batteries automatically on placement
        spidertron_builder.insert({name="retrofitted-battery"})
    elseif event.entity.name == "spidertron-builder-spidertron-experimental-laser2" then
        local spidertron_builder = event.entity
        if check_spider_colors(spidertron_builder.color) then
            spidertron_builder.color = {1, 1, 1, 0.5}
        end
        -- game.print(spidertron_builder.get_inventory)
        -- adding the batteries automatically on placement
        spidertron_builder.insert({name="retrofitted-battery2"})
    elseif event.entity.name == "immolator" or
        event.entity.name == "immolator-spidertron-immolator-flamethrower" then
        if immolator == nil then
            immolator = {}
        end
        local new_immolator = event.entity
        if check_spider_colors(new_immolator.color) then
            new_immolator.color = {0.17647, 0.56863, 0.86275, 0.5}
        end
        table.insert(immolator, new_immolator)
        -- immolator.surface.create_entity{name="fire-flame", position=immolator.position, force="neutral"}
    elseif event.entity.name == "major-spidertron" then
        local new_major_spidertron = event.entity
        if check_spider_colors(new_major_spidertron.color) then
            new_major_spidertron.color = {0.2941, 0.3255, 0.1255, 0.5}
        end
        -- when major spidertron is created add it to the table
        table.insert(major_spidertron, new_major_spidertron)
    end
end)


script.on_event(defines.events.on_pre_player_mined_item,
function(event)
    if event.entity.name == "spidertron-builder" then
        local spidertron_builder = event.entity
        -- game.print(dump(spidertron_builder.get_inventory(defines.inventory.spider_ammo).get_contents()))
        spidertron_builder.remove_item({name="retrofitted-battery"})
        spidertron_builder.remove_item({name="retrofitted-battery2"})
    end
    if event.entity.name == "spidertron-builder-spidertron-experimental-laser" then
        local spidertron_builder = event.entity
        -- game.print(dump(spidertron_builder.get_inventory(defines.inventory.spider_ammo).get_contents()))
        spidertron_builder.remove_item({name="retrofitted-battery"})
    end
    if event.entity.name == "spidertron-builder-spidertron-experimental-laser2" then
        local spidertron_builder = event.entity
        -- game.print(dump(spidertron_builder.get_inventory(defines.inventory.spider_ammo).get_contents()))
        spidertron_builder.remove_item({name="retrofitted-battery2"})
    end
end)


-- this didn't work, i'll leave this code here for future reference
--[[
script.on_event(defines.events.on_player_mined_entity,
function(event)
    -- removing batteries when it's mined 
    if event.entity.name == "spidertron-builder" then
        --- i tried removing from buffer but in buffer is only the vehicle
        local inv_buff = event.buffer
        game.print(dump(inv_buff.get_contents()))
        -- inv_buff.remove({name="retrofitted-battery"})
        -- inv_buff.remove({name="retrofitted-battery2"})
        
        local spidertron_builder = event.entity
        -- game.print(dump(spidertron_builder.get_inventory(defines.inventory.spider_ammo)))
        -- game.print(dump(spidertron_builder.get_inventory(defines.inventory.editor_ammo).get_contents()))
        -- game.print(dump(spidertron_builder.get_inventory(defines.inventory.spider_ammo).get_contents()))
        -- game.print(dump(spidertron_builder.get_inventory(defines.inventory.spider_trash).get_contents()))
        game.print(dump(spidertron_builder.get_inventory(defines.inventory.spider_trunk).get_contents()))
        
        spidertron_builder.get_inventory(defines.inventory.editor_ammo).remove({name="retrofitted-battery"})
        spidertron_builder.get_inventory(defines.inventory.editor_ammo).remove({name="retrofitted-battery2"})
        -- inv_items = spidertron_builder.get_inventory()
        -- game.print(dump(spidertron_builder.get_contents()))
        -- spidertron_builder.remove_item({name="retrofitted-battery"})
        -- spidertron_builder.remove_item({name="retrofitted-battery2"})
        
        -- tried removing from player but if he has full inv it bugs out
        -- leaving this in case he still has it for some reason in his inventory
        
        --player_id = event.player_index
        --player = game.get_player(event.player_index)
        --player.remove_item({name="retrofitted-battery"})
        --player.remove_item({name="retrofitted-battery2"})
    end
end)
--]]

function player_cooldown(seconds, cid)
    if cooldown == nil then
        cooldown = {}
    end
    something = {
        cooldown = seconds,
        cid = cid
    }
    -- basic id to know who's cooldown is it
    table.insert(cooldown, something)
end


function fire_wave(vehicle_ent, size)
    if not vehicle_ent.valid then
        return
    end
    if size == nil then
        size = 15
    end
    local circle_size = 360 -- default 360, full circle
    local dots_per_circle = 30 -- default 180
    local x, y, r = 0, 0, 1
    for i = 1, circle_size do
        local angle = i * math.pi / dots_per_circle
        local ptx, pty = x + r * math.cos(angle), y + r * math.sin(angle)
        local newptx = ptx * size -- default 15
        local newpty = pty * size -- default 15
        vehicle_ent.surface.create_entity{
            name="purifier-flame", 
            position={
                x = newptx + vehicle_ent.position.x, 
                y = newpty + vehicle_ent.position.y
            }, 
            force="neutral"
        }
    end
end


function launch_bubblegum(player_ev)
    if not player.valid then
        return
    end
    drone_creation = player_ev.vehicle.surface.create_entity({
        name="major-spidertron-bubblegum-capsule",
        amount=1,
        -- forgot to set source, maybe this fixes owner
        source=player_ev.vehicle,
        -- yes the source fixed it
        position={player_ev.position.x,player_ev.position.y},
        target={player_ev.position.x+1,player_ev.position.y+1},
        -- this forces the bot to be friendly / allied with the player
        force=game.forces.player_ev,
        -- trying to make the player the owner of the drone
        player = player_ev,
        -- doesn't work
        render_player_index=player_ev
        -- doesn't work
    })
end


script.on_event("immolator-active1", function(event)
    player_id = event.player_index
    player = game.get_player(event.player_index)
    vehicle = player.vehicle
    --game.print(vehicle.name)
    --game.print(vehicle.name == "immolator")
    -- check if the trigger is for the immolator when same button combination is pressed
    if not (vehicle == nil) then
        if vehicle.name == "immolator" then
            --return -- i tried exiting the function here directly, but never works

            -- define a basic variable to append with all the data
            --cheap fix for the smart toggle, this will need refactoring later
            if smarttoggle == nil then
                smarttoggle = {}
            end
            if smarttoggle.data == nil then
                smarttoggle.data = {}
            end

            local is_it_pressed = false
            for x in pairs(smarttoggle.data) do
                if smarttoggle.data[x].player_id == player_id then
                    is_it_pressed = true
                end
            end

            if cooldown == nil then
                cooldown = {}
            end

            local cooldown_pl = false
            for x in pairs(cooldown) do
                if cooldown == {} then
                    cooldown_pl = false
                elseif cooldown[x].cid == player_id then
                    cooldown_pl = true
                end
            end

            -- is it pressed is that ppl don't spam it
            if (vehicle.name == "immolator") and (is_it_pressed == false) and
                (cooldown_pl == false) then
                local something = {}
                something.active_stage = 1
                something.vehicle = vehicle
                something.player_id = player_id

                -- add the cooldown
                player_cooldown(3, player_id)
                -- add the fire-wave starting
                table.insert(smarttoggle.data, something)
                -- game.print("added the table")
            end
        end
    end
end)


script.on_event("immolator-passive1", function(event)
    player_id = event.player_index
    player = game.get_player(event.player_index)
    vehicle = player.vehicle
    --game.print("activating or disabling passive")
    if not (vehicle == nil) then
        local spider_legs_copy = vehicle.get_spider_legs()
    end
    --game.print(dump(spider_legs_copy))
    --game.print(spider_legs_copy["type"])
    ---- spider leg does not help
    --game.print(dump(spider_legs_copy[1]))
    ---- need spider vehicle entity

end)


script.on_event("major-spidertron-active1", function(event)
    player_id = event.player_index
    player = game.get_player(event.player_index)
    vehicle = player.vehicle
    -- check if the trigger is for the immolator when same button combination is pressed
    --game.print(vehicle.name)
    --game.print(vehicle.name == "major-spidertron")
    -- i tried if return but it just doesn't work
    if not (vehicle == nil) then
        if vehicle.name == "major-spidertron" then
            --game.print("You are tring to spawn bubblegum but it didnt get implemented yet")
            -- creating cooldown if it doesn't exist
            if cooldown == nil then
                cooldown = {}
            end
            -- checking cooldown
            --game.print("added cooldown stage1")
            local cooldown_pl = false
            for x in pairs(cooldown) do
                if cooldown == {} then
                    cooldown_pl = false
                elseif cooldown[x].cid == player_id then
                    cooldown_pl = true
                end
            end
            --game.print("verified cooldown stage 2")
            if cooldown_pl == false then
                --game.print("STARTING")
                -- add the player cooldown
                player_cooldown(10, player_id)
                -- use the skill function
                launch_bubblegum(player)
            end
            --game.print("finished and exiting now")
        end
    end
end)


script.on_nth_tick(6, function(event)
    --cheap fix for the smart toggle, this will need refactoring later
    if smarttoggle == nil then
        smarttoggle = {}
    end
    if smarttoggle.data == nil then    
        smarttoggle.data = {}
    end
    -- script for fire_wave
    -- this might kill ups, also i have no idea how multiplayer will handle
    for x in pairs(smarttoggle.data) do
        -- writing whiles are so hard ... (sarcastic)
        if smarttoggle.data[x].active_stage == 1 then
            smarttoggle.data[x].active_stage = 2
            fire_wave(smarttoggle.data[x].vehicle, 3)
        elseif smarttoggle.data[x].active_stage == 2 then
            smarttoggle.data[x].active_stage = 3
            fire_wave(smarttoggle.data[x].vehicle, 5)
        elseif smarttoggle.data[x].active_stage == 3 then
            smarttoggle.data[x].active_stage = 4
            fire_wave(smarttoggle.data[x].vehicle, 7)
        elseif smarttoggle.data[x].active_stage == 4 then
            smarttoggle.data[x].active_stage = 5
            fire_wave(smarttoggle.data[x].vehicle, 9)
        elseif smarttoggle.data[x].active_stage == 5 then
            smarttoggle.data[x].active_stage = 6
            fire_wave(smarttoggle.data[x].vehicle, 11)
        elseif smarttoggle.data[x].active_stage == 6 then
            smarttoggle.data[x].active_stage = 7
            fire_wave(smarttoggle.data[x].vehicle, 13)
        elseif smarttoggle.data[x].active_stage == 7 then
            smarttoggle.data[x].active_stage = 99 --exit stage
            fire_wave(smarttoggle.data[x].vehicle, 15)
            -- remove the table here somehow
            table.remove(smarttoggle.data, x)
            -- for y in pairs(smarttoggle.data) do
                -- game.print(y)
            -- end
        end
    end
end)

--putting them outside any function to properly load each time
-- verify that all types of spidertrons arrays exists and if they do not, create them
if spidertronmk2 == nil then
    spidertronmk2 = {}
end
if spidertronmk3 == nil then
    spidertronmk3 = {}
end
if spidertron_builder == nil then
    spidertron_builder = {}
end
if immolator == nil then
    immolator = {}
end
if major_spidertron == nil then
    major_spidertron = {}
end

script.on_nth_tick(60, function(event)
    -- 60 ticks = 1 second
    -- compromising for version fixing
    -- i doubt this would have such a large impact on ups

    --if not spidertronmk2 == {} then -- comment later
    --    game.print(dump(spidertronmk2)) -- comment later
    --end
    --if not spidertronmk3 == {} then -- comment later
    --    game.print(dump(spidertronmk3)) -- comment later
    --end
    --if not spidertron_builder == {} then -- comment later
    --    game.print(dump(spidertron_builder)) -- comment later
    --end
    --if not immolator == {} then -- comment later
    --    game.print(dump(immolator)) -- comment later
    --end
    --if not major_spidertron == {} then -- comment later
    --    game.print(dump(major_spidertron)) -- comment later
    --end
    
    -- adding these lines for compatibility with older saves
    spidertronmk3_health_regen = 15
    if settings.startup["disable-health-regenmk3"].value then
        spidertronmk3_health_regen = 0
    end
    
    for key, spidertronmk3_ent in pairs(spidertronmk3) do
        if spidertronmk3_ent.valid then
            -- game.print(dump(spidertronmk3))
            -- i want to try add this in a setting
            spidertronmk3_ent.health = spidertronmk3_ent.health + spidertronmk3_health_regen
        else  --had an issue here but i think it got fixed
            table.remove(spidertronmk3, key)
        end
    end
    
    -- cooldown testing
    if not (cooldown == nil) then
        --game.print(dump(cooldown)) -- remove later
        for x in pairs(cooldown) do
            if cooldown[x].cooldown > 0 then
                cooldown[x].cooldown = cooldown[x].cooldown - 1
            else
                table.remove(cooldown, x)
            end
        end
    end
end)


script.on_init(function()
    -- declare global immolator on init
    cooldown = {}
    smarttoggle = {}
    smarttoggle.data = {}
    immolator = {}
    player = {}
    -- declare global spidertronmk3 on init
    spidertronmk3 = {}
    spidertronmk3_health_regen = 15
    if settings.startup["disable-health-regenmk3"].value then
        spidertronmk3_health_regen = 0
    end
    -- declare global major spidertron on init
    major_spidertron = {}
end)

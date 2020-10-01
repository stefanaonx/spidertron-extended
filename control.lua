--control.lua

-- script to modify the spidertronmk2 and spidertronmk3 color on placement
script.on_event(defines.events.on_built_entity,
function(event)
    if event.created_entity.name == "spidertronmk2" then
        local spidertronmk2 = event.created_entity
        spidertronmk2.color = {1.0, 0, 0, 0.5}
    elseif event.created_entity.name == "spidertronmk3" then
        local spidertronmk3 = event.created_entity
        spidertronmk3.color = {0.5, 0, 0.5, 0.5}
        -- when spidertronmk3 is created add it to the table
        table.insert(global.spidertronmk3, spidertronmk3)
    elseif event.created_entity.name == "spidertron-builder" then
        local spidertron_builder = event.created_entity
        spidertron_builder.color = {1, 1, 1, 0.5}
    elseif event.created_entity.name == "immolator" then
        if global.immolator == nil then
            global.immolator = {}
        end
        local immolator = event.created_entity
        immolator.color = {0.17647, 0.56863, 0.86275, 0.5}
        table.insert(global.immolator, immolator)
        -- immolator.surface.create_entity{name="fire-flame", position=immolator.position, force="neutral"}     
    end
end)


-- immolator fire trail // copied from the fire-armor

-- script.on_event(defines.event.on_built_entity, function(event)
    -- local immolator = event.created_entity.name
    -- if immolator.name == "immolator" then
        -- immolator.surface.create_entity{name="fire-flame", position=player.position, force="neutral"} 
    -- end
-- end)

-- script.on_event(defines.events.on_player_changed_position, function(event)
    -- local player = game.get_player(event.player_index) -- get the player that moved            
    -- -- if they're wearing our armor
    -- if player.character and player.get_inventory(defines.inventory.character_armor).get_item_count("fire-armor") >= 1 then
        -- -- create the fire where they're standing
        -- player.surface.create_entity{name="fire-flame", position=player.position, force="neutral"} 
    -- end
-- end)

-- script.on_event(defines.events.on_player_driving_changed_state, function(event)
    -- local player = game.get_player(event.player_index) -- get the player that entered / exited a vehicle
    -- game.print("exited or entered vehicle")
    -- if next(global.player) == nil then
        -- -- myTable is empty
        -- table.insert(global.player, player)
        -- game.print("global_variable is empty, adding new variable")
    -- else
        -- game.print("entered the first else")
        -- for key, player in pairs(global.player) do
            -- if player.valid then
                -- table.remove(global.player, key)
                -- game.print("exited vehicle")
            -- else
                -- table.insert(global.player, player)
                -- game.print("entered vehicle")
            -- end
        -- end
    -- end
-- end)


script.on_event("immolator-active1", function(event)
    player = game.get_player(event.player_index)
    vehicle = player.vehicle
    -- if global.immolator == nil then
        -- global.immolator = {}
    -- end
    -- for key, immolator in pairs(global.immolator) do
    if not (vehicle == nil) then
        if vehicle.name == "immolator" then
                -- local ceva = immolator.get_driver()
                -- if ceva == nil then
                    -- game.print("driver nil")
                -- else
                    -- game.print("driver is: ")
                    -- game.print(ceva.name)
                -- end
                -- local ceva2 = ceva.player
                -- if ceva2 == nil then
                    -- game.print("player doesn't work")
                -- else
                    -- game.print("driving player name is: ")
                    -- game.print(ceva2.name)
                -- end
            local x, y, r = 0, 0, 1
            for i = 1, 360 do
                local angle = i * math.pi / 180
                local ptx, pty = x + r * math.cos(angle), y + r * math.sin(angle)
                local newptx = ptx * 15
                local newpty = pty * 15
                vehicle.surface.create_entity{
                    name="purifier-flame", 
                    position={
                        x = newptx + vehicle.position.x, 
                        y = newpty + vehicle.position.y
                    }, 
                    force="neutral"
                }
            end
        end
    end
        
            -----------------------------------------------------this shit works
            -- i want to try add this in a setting
            -- local pathx = immolator.position.x - 50.0
            -- local pathy = immolator.position.y - 50.0
            -- for i=1,100 do 
                -- immolator.surface.create_entity{
                    -- name="fire-flame", 
                    -- position={
                        -- x=pathx,
                        -- y=immolator.position.y - 50.0
                    -- }, 
                    -- force="neutral"
                -- }
                -- pathx = immolator.position.x
                -- for q=1,100 do
                    -- immolator.surface.create_entity{
                        -- name="fire-flame", 
                        -- position={
                            -- x=pathx,
                            -- y=pathy
                        -- }, 
                        -- force="neutral"
                    -- }
                    -- pathx = pathx + 1.0
                -- end
                
                -- pathy = pathy + 1.0
            -- end
            --------------------------------------------------------
            -- immolator.surface.create_entity{name="fire-flame", position=immolator.position, force="neutral"}
            -- game.print(immolator.position)
            -- local leg_hit_the_ground_trigger = {
                -- {
                    -- offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
                    -- repeat_count = 4,
                    -- smoke_name = "smoke-building",
                    -- speed_from_center = 0.03,
                    -- starting_frame_deviation = 5,
                    -- starting_frame_speed_deviation = 5,
                    -- type = "create-trivial-smoke"
                -- }
            -- }
            -- immolator.spider_engine.legs[1].leg_hit_the_ground_trigger = leg_hit_the_ground_trigger
            -- immolator.spider_engine.legs[2].leg_hit_the_ground_trigger = leg_hit_the_ground_trigger
            -- immolator.spider_engine.legs[3].leg_hit_the_ground_trigger = leg_hit_the_ground_trigger
            -- immolator.spider_engine.legs[4].leg_hit_the_ground_trigger = leg_hit_the_ground_trigger
            -- immolator.spider_engine.legs[5].leg_hit_the_ground_trigger = leg_hit_the_ground_trigger
            -- immolator.spider_engine.legs[6].leg_hit_the_ground_trigger = leg_hit_the_ground_trigger
            -- immolator.spider_engine.legs[7].leg_hit_the_ground_trigger = leg_hit_the_ground_trigger
        -- else
            -- table.remove(global.immolator, key)
        -- end
end)


script.on_nth_tick(60, function(event)
    -- 60 ticks = 1 second
    -- compromising for version fixing
    -- i doubt this would have such a large impact on ups
    if global.spidertronmk3 == nil then
        global.spidertronmk3 = {}
    end
    
    -- adding these lines for compatibility with older saves
    global.spidertronmk3_health_regen = 15
    if settings.startup["disable-health-regenmk3"].value then
        global.spidertronmk3_health_regen = 0
    end
    
    for key, spidertronmk3 in pairs(global.spidertronmk3) do
        if spidertronmk3.valid then
            -- i want to try add this in a setting
            spidertronmk3.health = spidertronmk3.health + global.spidertronmk3_health_regen
        else
            table.remove(global.spidertronmk3, key)
        end
    end
    -- tried to use the leg entity but didn't quite work
    -- but this does work, keeping it for future reference
    -- going to create fire entity on leg_hit_the_ground_trigger
    -- for key, immolator in pairs(global.immolator) do
        -- if immolator.valid then
            -- -- i want to try add this in a setting
            -- immolator.surface.create_entity{name="fire-flame", position=immolator.position, force="neutral"} 
        -- else
            -- table.remove(global.spidertronmk3, key)
        -- end
    -- end
end)


script.on_init(function()
    -- declare global immolator on init
    global.smarttoggle = {}
    global.smarttoggle["immolator-active1"] = false
    global.smarttoggle["immolator-easter"] = 0
    global.immolator = {}
    global.player = {}
    -- declare global spidertronmk3 on init
    global.spidertronmk3 = {}
    global.spidertronmk3_health_regen = 15
    if settings.startup["disable-health-regenmk3"].value then
        global.spidertronmk3_health_regen = 0
    end
end)

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


function cooldown(seconds, cid)
    if global.cooldown == nil then
        global.cooldown = {}
    end
    something = {
        cooldown = seconds,
        cid = cid
    }
    -- basic id to know who's cooldown is it
    table.insert(global.cooldown, something)
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


script.on_event("immolator-active1", function(event)
    -- define a basic variable to append with all the data
--cheap fix for the smart toggle, this will need refactoring later
    if global.smarttoggle == nil then
        global.smarttoggle = {}
    end
    if global.smarttoggle.data == nil then    
        global.smarttoggle.data = {}
    end
    player_id = event.player_index
    player = game.get_player(event.player_index)
    vehicle = player.vehicle
    local is_it_pressed = false
    for x in pairs(global.smarttoggle.data) do
        if global.smarttoggle.data[x].player_id == player_id then
            is_it_pressed = true
        end
    end
    
    if global.cooldown == nil then
        global.cooldown = {}
    end
    
    local cooldown_pl = false
    for x in pairs(global.cooldown) do
        if global.cooldown == {} then
            cooldown_pl = false
        elseif global.cooldown[x].cid == player_id then
            cooldown_pl = true
        end
    end
    
    if not (vehicle == nil) then
        -- is it pressed is that ppl don't spam it
        if (vehicle.name == "immolator") and (is_it_pressed == false) and
            (cooldown_pl == false) then
            local something = {}
            something.active_stage = 1
            something.vehicle = vehicle
            something.player_id = player_id
            
            -- add the cooldown
            cooldown(3, player_id)
            -- add the fire-wave starting
            table.insert(global.smarttoggle.data, something)
            -- game.print("added the table")
        end
    end
end)


script.on_nth_tick(6, function(event)
    --cheap fix for the smart toggle, this will need refactoring later
    if global.smarttoggle == nil then
        global.smarttoggle = {}
    end
    if global.smarttoggle.data == nil then    
        global.smarttoggle.data = {}
    end
    -- script for fire_wave
    -- this might kill ups, also i have no idea how multiplayer will handle
    for x in pairs(global.smarttoggle.data) do
        if global.smarttoggle.data[x].active_stage == 1 then
            global.smarttoggle.data[x].active_stage = 2
            fire_wave(global.smarttoggle.data[x].vehicle, 3)
        elseif global.smarttoggle.data[x].active_stage == 2 then
            global.smarttoggle.data[x].active_stage = 3
            fire_wave(global.smarttoggle.data[x].vehicle, 5)
        elseif global.smarttoggle.data[x].active_stage == 3 then
            global.smarttoggle.data[x].active_stage = 4
            fire_wave(global.smarttoggle.data[x].vehicle, 7)
        elseif global.smarttoggle.data[x].active_stage == 4 then
            global.smarttoggle.data[x].active_stage = 5
            fire_wave(global.smarttoggle.data[x].vehicle, 9)
        elseif global.smarttoggle.data[x].active_stage == 5 then
            global.smarttoggle.data[x].active_stage = 6
            fire_wave(global.smarttoggle.data[x].vehicle, 11)
        elseif global.smarttoggle.data[x].active_stage == 6 then
            global.smarttoggle.data[x].active_stage = 7
            fire_wave(global.smarttoggle.data[x].vehicle, 13)
        elseif global.smarttoggle.data[x].active_stage == 7 then
            global.smarttoggle.data[x].active_stage = 99 --exit stage
            fire_wave(global.smarttoggle.data[x].vehicle, 15)
            -- remove the table here somehow
            table.remove(global.smarttoggle.data, x)
            -- for y in pairs(global.smarttoggle.data) do
                -- game.print(y)
            -- end
        end
    end
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
    
    -- cooldown testing
    if not (global.cooldown == nil) then
        -- game.print(dump(global.cooldown))
        for x in pairs(global.cooldown) do
            if global.cooldown[x].cooldown > 0 then
                global.cooldown[x].cooldown = global.cooldown[x].cooldown - 1
            else
                table.remove(global.cooldown, x)
            end
        end
    end
end)


script.on_init(function()
    -- declare global immolator on init
    global.cooldown = {}
    global.smarttoggle = {}
    global.smarttoggle.data = {}
    global.immolator = {}
    global.player = {}
    -- declare global spidertronmk3 on init
    global.spidertronmk3 = {}
    global.spidertronmk3_health_regen = 15
    if settings.startup["disable-health-regenmk3"].value then
        global.spidertronmk3_health_regen = 0
    end
end)

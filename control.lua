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
end)


script.on_init(function()
    -- declare global spidertronmk3 on init
    global.spidertronmk3 = {}
    global.spidertronmk3_health_regen = 15
    if settings.startup["disable-health-regenmk3"].value then
        global.spidertronmk3_health_regen = 0
    end
end)

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
        table.insert(global.spidertronmk3, spidertronmk3)
    end
end)


script.on_event(defines.events.on_tick, function(event)

    if global.spidertronmk3 == nil then
        global.spidertronmk3 = {}
    end
    -- 60 ticks = 1 second
    if (game.tick % 60) == 0 then
        for key,spidertronmk3 in pairs(global.spidertronmk3) do
            if spidertronmk3.valid then
                -- i want to try add this in a setting
                spidertronmk3.health = spidertronmk3.health + 15
            else
                table.remove(global.spidertronmk3, key)
            end
        end
	end
end)
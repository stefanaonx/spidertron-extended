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
    end
end)

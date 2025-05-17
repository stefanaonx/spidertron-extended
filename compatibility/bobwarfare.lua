-- checking if mod doesn't exists
if not mods["bobwarfare"] then
    return
end

require "util"

local table_deepcopy = util.table.deepcopy

-- recipe changes
if not settings.startup["disable-spidertronmk2"].value then
    data.raw["recipe"]["spidertronmk2"].ingredients = {
        {type = "item", name = "spidertron", amount = 1},
        {type = "item", name = "bob-mech-armor-plate", amount = 35},
        {type = "item", name = "fusion-reactor-equipment", amount = 2},
        {type = "item", name = "speed-module-3", amount = 5},
        {type = "item", name = "efficiency-module-3", amount = 5},
        {type = "item", name = "beacon", amount = 2}
    }
end

if not settings.startup["disable-immolator"].value then
    if data.raw["recipe"]["immolator"] then
        data.raw["recipe"]["immolator"].ingredients = {
            {type = "item", name = "bob-mech-armor-plate", amount = 50},
            {type = "item", name = "mech-frame", amount = 1},
            {type = "item", name = "mech-leg", amount = 8},
            {type = "item", name = "fusion-reactor-equipment", amount = 2},
            {type = "item", name = "refined-concrete", amount = 200},
            {type = "item", name = "storage-tank", amount = 1},
            {type = "item", name = "flamethrower", amount = 1}
        }
    end
end

if not settings.startup["disable-spidertronmk3"].value then
    data.raw["recipe"]["spidertronmk3"].category = "crafting-with-fluid"
    local ingr = {
        {type = "item", name = "spidertron", amount = 1},
        {type = "item", name = "bob-mech-armor-plate", amount = 50},
        {type = "item", name = "fusion-reactor-equipment", amount = 2},
        {type = "item", name = "satellite", amount = 1},
        {type = "item", name = "speed-module-3", amount = 10},
        {type = "item", name = "efficiency-module-3", amount = 10},
        {type = "item", name = "beacon", amount = 5}
    }
    -- if spidertronmk2 not disabled use this recipe
    if not settings.startup["disable-spidertronmk2"].value then
        ingr = {
            {type = "item", name = "spidertronmk2", amount = 1},
            {type = "item", name = "bob-mech-armor-plate", amount = 50},
            {type = "item", name = "fusion-reactor-equipment", amount = 2},
            {type = "item", name = "satellite", amount = 1},
            {type = "item", name = "speed-module-3", amount = 10},
            {type = "item", name = "efficiency-module-3", amount = 10},
            {type = "item", name = "beacon", amount = 5}
        }
    end
    data.raw["recipe"]["spidertronmk3"].ingredients = ingr
end

if not settings.startup["disable-spidertron-builder"].value then
    data.raw["recipe"]["spidertron-builder"].ingredients = {
        {type = "item", name = "bob-mech-armor-plate", amount = 35},
        {type = "item", name = "mech-frame", amount = 1},
        {type = "item", name = "mech-leg", amount = 8},
        {type = "item", name = "fusion-reactor-equipment", amount = 3},
        {type = "item", name = "construction-robot", amount = 50},
        {type = "item", name = "productivity-module-3", amount = 5},
        {type = "item", name = "steel-chest", amount = 10},
        {type = "item", name = "laser-turret", amount = 2},
        {type = "item", name = "radar", amount = 50}
    }
end
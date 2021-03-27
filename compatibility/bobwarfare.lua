-- checking if mod doesn't exists
if not mods["bobwarfare"] then
    return
end

require "util"

local table_deepcopy = util.table.deepcopy

-- recipe changes
if not settings.startup["disable-spidertronmk2"].value then
    data.raw["recipe"]["spidertronmk2"].ingredients = {
        {"spidertron", 1},
        {"mech-armor-plate", 35},
        {"fusion-reactor-equipment",2},
        {"speed-module-3", 5},
        {"effectivity-module-3", 5},
        {"beacon", 2}
    }
end

if not settings.startup["disable-immolator"].value then
    data.raw["recipe"]["immolator"].ingredients = {
        {"mech-armor-plate", 50},
        {"mech-frame", 1},
        {"mech-leg", 8},
        {"fusion-reactor-equipment", 2},
        {"refined-concrete", 200},
        {"storage-tank", 1},
        {"flamethrower", 1}
    }
end

if not settings.startup["disable-spidertronmk3"].value then
    data.raw["recipe"]["spidertronmk3"].category = "crafting-with-fluid"
    local ingr = {
        {"spidertron",1},
        {"mech-armor-plate", 50},
        {"fusion-reactor-equipment",2},
        {"satellite", 1},
        {"speed-module-3", 10},
        {"effectivity-module-3", 10},
        {"beacon", 5}
    }
    -- if spidertronmk2 not disabled use this recipe
    if not settings.startup["disable-spidertronmk2"].value then
        ingr = {
            {"spidertronmk2", 1},
            {"mech-armor-plate", 50},
            {"fusion-reactor-equipment",2},
            {"satellite", 1},
            {"speed-module-3", 10},
            {"effectivity-module-3", 10},
            {"beacon", 5}
        }
    end
    data.raw["recipe"]["spidertronmk3"].ingredients = ingr
end

if not settings.startup["disable-spidertron-builder"].value then
    data.raw["recipe"]["spidertron-builder"].ingredients = {
        {"mech-armor-plate", 35},
        {"mech-frame", 1},
        {"mech-leg", 8},
        {"fusion-reactor-equipment", 3},
        {"construction-robot", 50},
        {"productivity-module-3", 5},
        {"steel-chest", 10},
        {"laser-turret", 2},
        {"radar", 50}
    }
end
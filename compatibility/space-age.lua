-- Checking for mod
if not mods["space-age"] then
    return
end

-- INGREDIENTS CHANGING for space age
-- mk2
data.raw["recipe"]["spidertronmk2"].ingredients = {
    {type = "item", name = "spidertron", amount = 1},
    {type = "item", name = "tungsten-plate", amount = 50},
    {type = "item", name = "carbon-fiber", amount = 50},
    {type = "item", name = "supercapacitor", amount = 50}
}

-- mk3
data.raw["recipe"]["spidertronmk3"].ingredients = {
    {type = "item", name = "spidertronmk2", amount = 1},
    {type = "fluid", name = "fluoroketone-cold", amount = 40},
    {type = "item", name = "lithium-plate", amount = 40},
    {type = "item", name = "quantum-processor", amount = 2}
}
if settings.startup["disable-spidertronmk2"].value then
    -- if spidertronmk2 disabled use this recipe
    data.raw["recipe"]["spidertronmk3"].ingredients = {
        {type = "item", name = "spidertron", amount = 1},
        {type = "fluid", name = "fluoroketone-cold", amount = 40},
        {type = "item", name = "lithium-plate", amount = 40},
        {type = "item", name = "quantum-processor", amount = 2}
    }
end
data.raw["recipe"]["spidertronmk3"].category = "crafting-with-fluid"

-- ghost weaver
data.raw["recipe"]["spidertron-builder"].ingredients = {
    {type = "item", name = "spidertron", amount = 1},
    {type = "item", name = "tungsten-plate", amount = 50},
    {type = "item", name = "productivity-module-3", amount = 10},
    {type = "item", name = "steel-chest", amount = 10},
    {type = "item", name = "construction-robot", amount = 10},
    {type = "item", name = "radar", amount = 5},
    {type = "item", name = "laser-turret", amount = 2},
}
-- batteries for ghost weaver
data.raw["recipe"]["retrofitted-battery"].ingredients = {
    {type = "item", name = "fission-reactor-equipment", amount = 1},
    {type = "item", name = "productivity-module-2", amount = 5}
}
data.raw["recipe"]["retrofitted-battery2"].ingredients = {
    {type = "item", name = "fission-reactor-equipment", amount = 1},
    {type = "item", name = "productivity-module-2", amount = 5}
}

-- immolator
data.raw["recipe"]["immolator"].ingredients = {
    {type = "item", name = "raw-fish", amount = 1},
    {type = "item", name = "refined-concrete", amount = 200},
    {type = "item", name = "low-density-structure", amount = 150},
    {type = "item", name = "flamethrower", amount = 1},
    {type = "item", name = "storage-tank", amount = 1},
    {type = "item", name = "fission-reactor-equipment", amount = 4},
    {type = "item", name = "exoskeleton-equipment", amount = 8},
    {type = "item", name = "radar", amount = 2}
}
-- major spidertron
--data.raw.recipe["major-spidertron"].ingredients = {  -- this way should also work
data.raw["recipe"]["major-spidertron"].ingredients = {
    {type = "item", name = "raw-fish", amount = 1},
    {type = "item", name = "engine-unit", amount = 40},
    {type = "item", name = "tungsten-plate", amount = 60},
    {type = "item", name = "refined-concrete", amount = 60},
    {type = "item", name = "processing-unit", amount = 80},
    {type = "item", name = "fission-reactor-equipment", amount = 4},
    {type = "item", name = "exoskeleton-equipment", amount = 8}
}
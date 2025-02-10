-- mk2 recipe
if not settings.startup["disable-spidertronmk2"].value then
    local spidertronmk2_recipe = {
        type = "recipe",
        name = "spidertronmk2",
        enabled = false,
        ingredients = {
            {type = "item", name = "spidertron", amount = 1},
            {type = "item", name = "tungsten-plate", amount = 50},
            {type = "item", name = "carbon-fiber", amount = 50},
            {type = "item", name = "supercapacitor", amount = 50}
        },
        energy_required = 10,
        results = {{type="item", name="spidertronmk2", amount=1}}
    }
    
    data:extend{
        spidertronmk2_recipe
    }
end

-- mk3 recipe
if not settings.startup["disable-spidertronmk3"].value then
    local ingr = {
        {type = "item", name = "spidertronmk2", amount = 1},
        {type = "fluid", name = "fluoroketone-cold", amount = 40},
        {type = "item", name = "lithium-plate", amount = 40},
        {type = "item", name = "quantum-processor", amount = 2}
    }
    if settings.startup["disable-spidertronmk2"].value then
        -- if spidertronmk2 disabled use this recipe
        ingr = {
            {type = "item", name = "spidertron", amount = 1},
            {type = "fluid", name = "fluoroketone-cold", amount = 40},
            {type = "item", name = "lithium-plate", amount = 40},
            {type = "item", name = "quantum-processor", amount = 2}
        }
    end
    local spidertronmk3_recipe = {
        type = "recipe",
        name = "spidertronmk3",
        category = "crafting-with-fluid",
        enabled = false,
        ingredients = ingr,
        energy_required = 10,
        results = {{type="item", name="spidertronmk3", amount=1}}
    }
    data:extend{
        spidertronmk3_recipe
    }
end

-- spider builder recipe
if not settings.startup["disable-spidertron-builder"].value then
    local spidertron_builder_recipe = {
        type = "recipe",
        name = "spidertron-builder",
        enabled = false,
        ingredients = {
            {type = "item", name = "spidertron", amount = 1},
            {type = "item", name = "tungsten-plate", amount = 50},
            {type = "item", name = "productivity-module-3", amount = 10},
            {type = "item", name = "steel-chest", amount = 10},
            {type = "item", name = "construction-robot", amount = 10},
            {type = "item", name = "radar", amount = 5},
            {type = "item", name = "laser-turret", amount = 2},
        },
        energy_required = 10,
        results = {{type="item", name="spidertron-builder", amount=1}}
    }

    data:extend{
        spidertron_builder_recipe
    }
end

-- immolator spider
if not settings.startup["disable-immolator"].value then
    local immolator = {
        type = "recipe",
        name = "immolator",
        enabled = false,
        ingredients = {
            {type = "item", name = "raw-fish", amount = 1},
            {type = "item", name = "refined-concrete", amount = 200},
            {type = "item", name = "low-density-structure", amount = 150},
            {type = "item", name = "flamethrower", amount = 1},
            {type = "item", name = "storage-tank", amount = 1},
            {type = "item", name = "fusion-reactor-equipment", amount = 4},
            {type = "item", name = "exoskeleton-equipment", amount = 8},
            {type = "item", name = "radar", amount = 2}
        },
        energy_required = 10,
        results = {{type="item", name="immolator", amount=1}}
    }

    data:extend{
        immolator
    }
end

-- mj-spidetron recipe
if not settings.startup["disable-major-spidertron"].value then
    local major_spidertron_recipe = {
        type = "recipe",
        name = "major-spidertron",
        enabled = false,
        ingredients = {
            {type = "item", name = "spidertron", amount = 1},
            {type = "item", name = "tungsten-plate", amount = 50},
            {type = "item", name = "carbon-fiber", amount = 50},
            {type = "item", name = "supercapacitor", amount = 50}
        },
        energy_required = 10,
        results = {{type="item", name="spidertronmk2", amount=1}}
    }

    data:extend{
        major_spidertron_recipe
    }
end
-- mk2 recipe
local spidertronmk2_recipe = {
    type = "recipe",
    name = "spidertronmk2",
    enabled = false,
    ingredients = {
        {type = "item", name = "spidertron", amount = 1},
        {type = "item", name = "concrete", amount = 40},
        {type = "item", name = "fission-reactor-equipment", amount = 2},
        {type = "item", name = "exoskeleton", amount = 2}
    },
    energy_required = 10,
    results = {{type="item", name="spidertronmk2", amount=1}}
}

-- mk3 recipe
local ingr = {
    {type = "item", name = "spidertronmk2", amount = 1},
    {type = "fluid", name = "refined concrete", amount = 80},
    {type = "item", name = "fission-reactor-equipment", amount = 4},
    {type = "item", name = "exoskeleton", amount = 4}
}
if settings.startup["disable-spidertronmk2"].value then
    -- if spidertronmk2 disabled use this recipe
    ingr = {
        {type = "item", name = "spidertron", amount = 1},
        {type = "fluid", name = "refined concrete", amount = 80},
        {type = "item", name = "fission-reactor-equipment", amount = 4},
        {type = "item", name = "exoskeleton", amount = 4}
    }
end
local spidertronmk3_recipe = {
    type = "recipe",
    name = "spidertronmk3",
    -- modify this
    category = "crafting-with-fluid",
    enabled = false,
    ingredients = ingr,
    energy_required = 10,
    results = {{type="item", name="spidertronmk3", amount=1}}
}

-- spider builder recipe
local spidertron_builder_recipe = {
    type = "recipe",
    name = "spidertron-builder",
    enabled = false,
    ingredients = {
        {type = "item", name = "spidertron", amount = 1},
        {type = "item", name = "low-density-structure", amount = 50},
        {type = "item", name = "roboport", amount = 2},
        {type = "item", name = "steel-chest", amount = 10},
        {type = "item", name = "construction-robot", amount = 10},
        {type = "item", name = "radar", amount = 5},
        {type = "item", name = "personal-laser-defense-equipment", amount = 2}
    },
    energy_required = 10,
    results = {{type="item", name="spidertron-builder", amount=1}}
}

-- immolator spider
local immolator_recipe = {
    type = "recipe",
    name = "immolator",
    enabled = false,
    ingredients = {
        {type = "item", name = "raw-fish", amount = 1},
        {type = "item", name = "refined-concrete", amount = 200},
        {type = "item", name = "low-density-structure", amount = 150},
        {type = "item", name = "flamethrower", amount = 1},
        {type = "item", name = "storage-tank", amount = 1}
    },
    energy_required = 10,
    results = {{type="item", name="immolator", amount=1}}
}

-- mj-spidetron recipe
local major_spidertron_recipe = {
    type = "recipe",
    name = "major-spidertron",
    enabled = false,
    ingredients = {
        {type = "item", name = "raw-fish", amount = 1},
        {type = "item", name = "engine-unit", amount = 40},
        {type = "item", name = "steel-plate", amount = 60},
        {type = "item", name = "concrete", amount = 60},
        {type = "item", name = "processing-unit", amount = 80}
    },
    energy_required = 10,
    results = {{type="item", name="major-spidertron", amount=1}}
}


data:extend{
    spidertronmk2_recipe,
    spidertronmk3_recipe,
    spidertron_builder_recipe,
    immolator_recipe,
    major_spidertron_recipe
}
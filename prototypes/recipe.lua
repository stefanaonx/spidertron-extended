-- mk2 recipe
local spidertronmk2_recipe = {
    type = "recipe",
    name = "spidertronmk2",
    enabled = false,
    ingredients = {
        {"spidertron",1},
        {"low-density-structure",150},
        {"fusion-reactor-equipment",2},
        {"rocket-control-unit",20},
        {"beacon",5},
        {"speed-module-3",5},
        {"effectivity-module-3",5}
    },
    energy_required = 10,
    result = "spidertronmk2"
}

-- mk3 recipe
local spidertronmk3_recipe = {
    type = "recipe",
    name = "spidertronmk3",
    enabled = false,
    ingredients = {
        {"spidertronmk2",1},
        {"low-density-structure",150},
        {"fusion-reactor-equipment",2},
        {"beacon",10},
        {"speed-module-3",10},
        {"effectivity-module-3",10},
        {"satellite",1}
    },
    energy_required = 10,
    result = "spidertronmk3"
}

data:extend{
    spidertronmk2_recipe,
    spidertronmk3_recipe
}
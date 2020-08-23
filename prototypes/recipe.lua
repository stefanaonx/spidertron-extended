-- mk2 recipe
if not settings.startup["disable-spidertronmk2"].value then
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
    
    data:extend{
        spidertronmk2_recipe
    }
end

-- mk3 recipe
if not settings.startup["disable-spidertronmk3"].value then
    local ingr = {
            {"spidertron",1},
            {"low-density-structure",150},
            {"fusion-reactor-equipment",2},
            {"beacon",10},
            {"speed-module-3",10},
            {"effectivity-module-3",10},
            {"satellite",1}
        }
    if not settings.startup["disable-spidertronmk2"].value then
        ingr = {
            {"spidertronmk2",1},
            {"low-density-structure",150},
            {"fusion-reactor-equipment",2},
            {"beacon",10},
            {"speed-module-3",10},
            {"effectivity-module-3",10},
            {"satellite",1}
        }
    end
    local spidertronmk3_recipe = {
        type = "recipe",
        name = "spidertronmk3",
        enabled = false,
        ingredients = ingr,
        energy_required = 10,
        result = "spidertronmk3"
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
            {"raw-fish",1},
            {"rocket-control-unit",16},
            {"low-density-structure",150},
            {"productivity-module-3",10},
            {"steel-chest",10},
            {"construction-robot",50},
            {"radar",50}
        },
        energy_required = 10,
        result = "spidertron-builder"
    }

    data:extend{
        spidertron_builder_recipe
    }
end
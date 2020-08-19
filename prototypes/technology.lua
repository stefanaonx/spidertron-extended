-- technology unlock mk2
local spidertronmk2_technology = {
    type = "technology",
    name = "spidertronmk2-tech",
    icon = "__spidertron-extended__/icons/spidertron_mk2_reseach.png",
    icon_size = 128,
    order = "c",
    prerequisites = {"spidertron"},
    effects = {
        {
            type = "unlock-recipe", 
            recipe = "spidertronmk2"
        }
    },
    unit = {
        count = 2500,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"military-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1}
        },
        time = 30
    }
}

-- technology unlock mk3
local spidertronmk3_technology = {
    type = "technology",
    name = "spidertronmk3-tech",
    icon = "__spidertron-extended__/icons/spidertron_mk3_reseach.png",
    icon_size = 128,
    order = "c",
    prerequisites = {"spidertronmk2-tech", "space-science-pack"},
    effects = {
        {
            type = "unlock-recipe", 
            recipe = "spidertronmk3"
        }
    },
    unit = {
        count = 2500,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"military-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"utility-science-pack", 1},
            {"space-science-pack", 1}
        },
        time = 30
    }
}

data:extend{
    spidertronmk2_technology,
    spidertronmk3_technology
}
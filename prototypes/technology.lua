-- technology unlock mk2
if not settings.startup["disable-spidertronmk2"].value then
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
    data:extend{
        spidertronmk2_technology
    }
end
-- technology unlock mk3
if not settings.startup["disable-spidertronmk3"].value then
    -- i need to modify the prereq is mk2 is not available
    local preqs = {"spidertron", "space-science-pack"}
    if not settings.startup["disable-spidertronmk2"].value then
        preqs = {"spidertronmk2-tech", "space-science-pack"}
    end
    local spidertronmk3_technology = {
        type = "technology",
        name = "spidertronmk3-tech",
        icon = "__spidertron-extended__/icons/spidertron_mk3_reseach.png",
        icon_size = 128,
        order = "c",
        prerequisites = preqs,
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
        spidertronmk3_technology
    }
end

-- technology unlock spider builder
if not settings.startup["disable-spidertron-builder"].value then
    local spidertron_builder_technology = {
        type = "technology",
        name = "spidertron-builder-tech",
        icon = "__spidertron-extended__/icons/spidertron_extended_builder_research.png",
        icon_size = 128,
        order = "c",
        prerequisites = {"spidertron","construction-robotics"},
        effects = {
            {
                type = "unlock-recipe", 
                recipe = "spidertron-builder"
            },
            {
                type = "unlock-recipe", 
                recipe = "retrofitted-battery"
            },
            {
                type = "unlock-recipe", 
                recipe = "retrofitted-battery2"
            }
        },
        unit = {
            count = 1000,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"military-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
            },
            time = 30
        }
    }
    data:extend{
        spidertron_builder_technology
    }
end

-- technology unlock immolator
if not settings.startup["disable-immolator"].value then
    local immolator_technology = {
        type = "technology",
        name = "immolator-tech",
        icon = "__spidertron-extended__/icons/spidertron_extended_immolator_research.png",
        icon_size = 128,
        order = "c",
        prerequisites = {"spidertron"},
        effects = {
            {
                type = "unlock-recipe", 
                recipe = "immolator"
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
    data:extend{
        immolator_technology
    }
end

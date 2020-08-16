require "util"

local table_deepcopy = util.table.deepcopy
local iconsmk2 = {
    {icon = "__spidertron-extended__/icons/spidertron_mk2.png", icon_size = 64, icon_mipmaps = 4}
}
local iconsmk3 = {
    {icon = "__spidertron-extended__/icons/spidertron_mk3.png", icon_size = 64, icon_mipmaps = 4}
}

-- grids
local spidertronmk2_grid = {
    type = "equipment-grid",
    name = "spidertronmk2-grid",
    width = 20,
    height = 8,
    equipment_categories = {"armor"}
}
local spidertronmk3_grid = {
    type = "equipment-grid",
    name = "spidertronmk3-grid",
    width = 30,
    height = 10,
    equipment_categories = {"armor"}
}

-- MK2 spidertronmk2

-- i require new launchers item
local spidertronmk2_rocket_launcher_1_item = table_deepcopy(data.raw["gun"]["spidertron-rocket-launcher-1"])
spidertronmk2_rocket_launcher_1_item.name = "spidertronmk2-rocket-launcher-1"
spidertronmk2_rocket_launcher_1_item.attack_parameters.range = 54

local spidertronmk2_rocket_launcher_2_item = table_deepcopy(data.raw["gun"]["spidertron-rocket-launcher-2"])
spidertronmk2_rocket_launcher_2_item.name = "spidertronmk2-rocket-launcher-2"
spidertronmk2_rocket_launcher_2_item.attack_parameters.range = 54

local spidertronmk2_rocket_launcher_3_item = table_deepcopy(data.raw["gun"]["spidertron-rocket-launcher-3"])
spidertronmk2_rocket_launcher_3_item.name = "spidertronmk2-rocket-launcher-3"
spidertronmk2_rocket_launcher_3_item.attack_parameters.range = 54

local spidertronmk2_rocket_launcher_4_item = table_deepcopy(data.raw["gun"]["spidertron-rocket-launcher-4"])
spidertronmk2_rocket_launcher_4_item.name = "spidertronmk2-rocket-launcher-4"
spidertronmk2_rocket_launcher_4_item.attack_parameters.range = 54


local spidertronmk2_entity = table_deepcopy(data.raw["spider-vehicle"]["spidertron"])
spidertronmk2_entity.name = "spidertronmk2"
spidertronmk2_entity.icon = nil
spidertronmk2_entity.icon_size = nil
spidertronmk2_entity.icon_mipmaps = nil
spidertronmk2_entity.icons = iconsmk2
spidertronmk2_entity.minable.result = "spidertronmk2"
-- extra
spidertronmk2_entity.max_health = 5000
spidertronmk2_entity.inventory_size = 100
spidertronmk2_entity.equipment_grid = "spidertronmk2-grid"
spidertronmk2_entity.resistances = {
    {
        type = "acid",
        decrease = 0,
        percent = 75
    },
    {
        type = "electric",
        decrease = 0,
        percent = 75
    },
    {
        type = "explosion",
        decrease = 40,
        percent = 80
    },
    {
        type = "fire",
        decrease = 20,
        percent = 65
    },
    {
        type = "impact",
        decrease = 50,
        percent = 80
    },
    {
        type = "laser",
        decrease = 0,
        percent = 70
    },
    {
        type = "physical",
        decrease = 20,
        percent = 65
    }
}
spidertronmk2_entity.chunk_exploration_radius = 5
spidertronmk2_entity.automatic_weapon_cycling = true
spidertronmk2_entity.guns = {"spidertronmk2-rocket-launcher-1", "spidertronmk2-rocket-launcher-2", "spidertronmk2-rocket-launcher-3", "spidertronmk2-rocket-launcher-4"}
spidertronmk2_entity.chain_shooting_cooldown_modifier = 0.4
spidertronmk2_entity.braking_force = 2

local spidertronmk2_item = table_deepcopy(data.raw["item-with-entity-data"]["spidertron"])
spidertronmk2_item.name = "spidertronmk2"
spidertronmk2_item.icon = nil
spidertronmk2_item.icon_size = nil
spidertronmk2_item.icon_mipmaps = nil
spidertronmk2_item.icons = iconsmk2
spidertronmk2_item.order = "b[personal-transport]-c[spidertron]-ab[spidertronmk2]"
spidertronmk2_item.place_result = "spidertronmk2"

local spidertronmk2_recipe = {
    type = "recipe",
    name = "spidertronmk2",
    enabled = false,
    ingredients = {
        {"spidertron",1},
        {"low-density-structure",200},
        {"fusion-reactor-equipment",2},
        {"rocket-control-unit",20},
        {"beacon",10},
        {"speed-module-3",10},
        {"effectivity-module-3",10}
    },
    result = "spidertronmk2"
}

-- technology unlock

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

-- table.insert(data.raw["technology"]["spidertron"].effects, 2, {type = "unlock-recipe", recipe = "spidertronmk2"})
-- table.insert(data.raw["technology"]["spidertron"].order, 2, {type = "item", name = "spidertronmk2", order = "ab",})

-- MK3

-- i require new launchers item
local spidertronmk3_rocket_launcher_1_item = table_deepcopy(data.raw["gun"]["spidertron-rocket-launcher-1"])
spidertronmk3_rocket_launcher_1_item.name = "spidertronmk3-rocket-launcher-1"
spidertronmk3_rocket_launcher_1_item.attack_parameters.range = 72

local spidertronmk3_rocket_launcher_2_item = table_deepcopy(data.raw["gun"]["spidertron-rocket-launcher-2"])
spidertronmk3_rocket_launcher_2_item.name = "spidertronmk3-rocket-launcher-2"
spidertronmk3_rocket_launcher_2_item.attack_parameters.range = 72

local spidertronmk3_rocket_launcher_3_item = table_deepcopy(data.raw["gun"]["spidertron-rocket-launcher-3"])
spidertronmk3_rocket_launcher_3_item.name = "spidertronmk3-rocket-launcher-3"
spidertronmk3_rocket_launcher_3_item.attack_parameters.range = 72

local spidertronmk3_rocket_launcher_4_item = table_deepcopy(data.raw["gun"]["spidertron-rocket-launcher-4"])
spidertronmk3_rocket_launcher_4_item.name = "spidertronmk3-rocket-launcher-4"
spidertronmk3_rocket_launcher_4_item.attack_parameters.range = 72


local spidertronmk3_entity = table_deepcopy(data.raw["spider-vehicle"]["spidertron"])
spidertronmk3_entity.name = "spidertronmk3"
spidertronmk3_entity.icon = nil
spidertronmk3_entity.icon_size = nil
spidertronmk3_entity.icon_mipmaps = nil
spidertronmk3_entity.icons = iconsmk3
spidertronmk3_entity.minable.result = "spidertronmk3"
-- extra
spidertronmk3_entity.max_health = 8000
spidertronmk3_entity.inventory_size = 120
spidertronmk3_entity.equipment_grid = "spidertronmk3-grid"
spidertronmk3_entity.resistances = {
    {
        type = "acid",
        decrease = 0,
        percent = 80
    },
    {
        type = "electric",
        decrease = 0,
        percent = 80
    },
    {
        type = "explosion",
        decrease = 60,
        percent = 85
    },
    {
        type = "fire",
        decrease = 25,
        percent = 70
    },
    {
        type = "impact",
        decrease = 50,
        percent = 80
    },
    {
        type = "laser",
        decrease = 0,
        percent = 70
    },
    {
        type = "physical",
        decrease = 25,
        percent = 70
    }
}
spidertronmk3_entity.chunk_exploration_radius = 7
spidertronmk3_entity.automatic_weapon_cycling = true
-- wanted to try flamethrower, it works but with cycling it's not fun
spidertronmk3_entity.guns = {"spidertronmk3-rocket-launcher-1", "spidertronmk3-rocket-launcher-2", "spidertronmk3-rocket-launcher-3", "spidertronmk3-rocket-launcher-4"}
spidertronmk3_entity.chain_shooting_cooldown_modifier = 0.3
spidertronmk3_entity.healing_per_tick = 0.5
spidertronmk3_entity.braking_force = 4

local spidertronmk3_item = table_deepcopy(data.raw["item-with-entity-data"]["spidertron"])
spidertronmk3_item.name = "spidertronmk3"
spidertronmk3_item.icon = nil
spidertronmk3_item.icon_size = nil
spidertronmk3_item.icon_mipmaps = nil
spidertronmk3_item.icons = iconsmk3
spidertronmk3_item.order = "b[personal-transport]-c[spidertron]-ab[spidertronmk3]"
spidertronmk3_item.place_result = "spidertronmk3"


local spidertronmk3_recipe = {
    type = "recipe",
    name = "spidertronmk3",
    enabled = false,
    ingredients = {
        {"spidertronmk2",1},
        {"low-density-structure",250},
        {"fusion-reactor-equipment",2},
        {"beacon",25},
        {"speed-module-3",25},
        {"effectivity-module-3",25},
        {"satellite",1}
    },
    result = "spidertronmk3"
}

-- technology unlock
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

-- table.insert(data.raw["technology"]["spidertron"].effects, 2, {type = "unlock-recipe", recipe = "spidertronmk3"})
-- table.insert(data.raw["technology"]["spidertron"].order, 2, {
    -- type = "item",
    -- name = "spidertronmk3",
    -- order = "ab",
  -- }
-- )

data:extend{
    spidertronmk2_rocket_launcher_1_item,
    spidertronmk2_rocket_launcher_2_item,
    spidertronmk2_rocket_launcher_3_item,
    spidertronmk2_rocket_launcher_4_item,
    spidertronmk2_grid,
    spidertronmk2_entity,
    spidertronmk2_item,
    spidertronmk2_technology,
    spidertronmk2_recipe,
    spidertronmk3_grid,
    spidertronmk3_rocket_launcher_1_item,
    spidertronmk3_rocket_launcher_2_item,
    spidertronmk3_rocket_launcher_3_item,
    spidertronmk3_rocket_launcher_4_item,
    spidertronmk3_entity,
    spidertronmk3_item,
    spidertronmk3_technology,
    spidertronmk3_recipe
}

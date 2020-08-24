require "util"

local table_deepcopy = util.table.deepcopy

-- mk2 rockert launchers
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

-- mk3 rocket launchers
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

local spidertron_builder_laser = {
    name = "spidertron-experimental-laser",
    type = "gun",
    icon = "__base__/graphics/icons/personal-laser-defense-equipment.png",
    icon_size = 64,
    stack_size = 5,
    attack_parameters = {
        type = "beam",
        range = 50,
        cooldown = 5,
        ammo_consumption_modifier = 0
    }
}


data:extend{
    spidertronmk2_rocket_launcher_1_item,
    spidertronmk2_rocket_launcher_2_item,
    spidertronmk2_rocket_launcher_3_item,
    spidertronmk2_rocket_launcher_4_item,
    spidertronmk3_rocket_launcher_1_item,
    spidertronmk3_rocket_launcher_2_item,
    spidertronmk3_rocket_launcher_3_item,
    spidertronmk3_rocket_launcher_4_item,
    spidertron_builder_laser
}
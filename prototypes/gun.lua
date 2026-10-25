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

local immolator_flame_parameters = table_deepcopy(data.raw["gun"]["tank-flamethrower"].attack_parameters)
immolator_flame_parameters.range = 30
immolator_flame_parameters.ammo_consumption_modifier = 1
immolator_flame_parameters.cooldown = 1
-- no idea if this will work
-- immolator_flame_parameters.ammo_category = "flamethrower"
-- immolator_flame_parameters.ammo_type.result.actions = table_deepcopy(data.raw["fluid-turret"]["flamethrower-turret"].attack_parameters.ammo_type.result.actions)

local immolator_flamethrower = {
    name = "spidertron-immolator-flamethrower",
    type = "gun",
    subgroup = "gun",
    icon = "__spidertron-extended__/graphics/spidertron_immolator_gun_icon_2.png",
    icon_size = 64,
    stack_size = 5,
    attack_parameters = immolator_flame_parameters
}

-- keeping this for future reference on gun details
-- local new_gun = {
    -- type = "gun",
    -- name = "Schall-recharging-laser-machine-gun",
    -- icons = RWlib.RW_gun_icons("laser-machine-gun"),
    -- localised_description = RWlib.RW_localised_description(gun_charges("Schall-recharging-laser-machine-gun").energy, "Schall-recharging-laser-machine-gun"),
    -- subgroup = "gun",
    -- order = "pe[energy-charges]-g[laser-machine-gun]",
    -- attack_parameters = {
        -- type = "projectile",
        -- ammo_category = cfg1.LAS_ammo_category,
        -- cooldown = 6, --10,
        -- range = 25,
        -- damage_modifier = 2,
        -- movement_slow_down_factor = 1,
        -- movement_slow_down_cooldown = 120,
        -- projectile_creation_distance = 1.125,
        -- sound = {
            -- {
                -- filename = "__base__/sound/fight/laser-1.ogg",
                -- volume = 0.75
            -- },
            -- {
                -- filename = "__base__/sound/fight/laser-2.ogg",
                -- volume = 0.75
            -- },
            -- {
                -- filename = "__base__/sound/fight/laser-3.ogg",
                -- volume = 0.75
            -- }
        -- }
    -- },
    -- stack_size = 5
-- }


data:extend{
    spidertronmk2_rocket_launcher_1_item,
    spidertronmk2_rocket_launcher_2_item,
    spidertronmk2_rocket_launcher_3_item,
    spidertronmk2_rocket_launcher_4_item,
    spidertronmk3_rocket_launcher_1_item,
    spidertronmk3_rocket_launcher_2_item,
    spidertronmk3_rocket_launcher_3_item,
    spidertronmk3_rocket_launcher_4_item,
    immolator_flamethrower
}
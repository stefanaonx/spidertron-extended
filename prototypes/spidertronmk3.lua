require "util"
require("prototypes.leg_smoke")

local table_deepcopy = util.table.deepcopy

local iconsmk3 = {
    {
        icon = "__spidertron-extended__/icons/spidertron_extended_mk3_item.png",
        icon_size = 64, 
        icon_mipmaps = 4
    }
}

-- MK3
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
        decrease = 100,
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
spidertronmk3_entity.guns = {
    "spidertronmk3-rocket-launcher-1", 
    "spidertronmk3-rocket-launcher-2", 
    "spidertronmk3-rocket-launcher-3", 
    "spidertronmk3-rocket-launcher-4"
}
spidertronmk3_entity.chain_shooting_cooldown_modifier = 0.3
spidertronmk3_entity.braking_force = 4

-- for some reason the line below this doesn't do anything
-- spidertronmk3_entity.healing_per_tick = 0.5

-- table.insert(data.raw["technology"]["military-2"]["effects"], {type = "unlock-recipe", recipe = "basic-grenade-2"})
-- trying to add health_regen setting to spidertronmk3
-- local health_regen = 15
-- table.insert(spidertronmk3_entity, health_regen)
-- -- spidertronmk3_entity.health_regen = 15
-- if settings.startup["disable-health-regenmk3"].value then
    -- spidertronmk3_entity.health_regen = 0
-- end

-- modifies the icon displayed on the map
spidertronmk3_entity.minimap_representation = {
    filename = "__spidertron-extended__/icons/spidertron_extended_mk3_map.png",
    flags = {"icon"},
    size = {128, 128},
    scale = 0.7
}

---- this changes the spidertron_mk3 body texture
-- trying to change size
-- spidertronmk3_entity.selection_box = {{-2, -2}, {2, 2}}
-- spidertronmk3_entity.collision_box = {{-2, -2}, {2, 2}}

spidertronmk3_entity.graphics_set.animation.layers[3] = {
	filename = "__spidertron-extended__/graphics/spidertron_mk3_eye.png",
	width = 66,
	height = 70,
	line_length = 8,
	direction_count = 64,
	shift = util.by_pixel(0, -19),
	hr_version = {
		filename = "__spidertron-extended__/graphics/spidertron_mk3_eye_HD.png",
		width = 132,
		height = 138,
		line_length = 8,
		direction_count = 64,
		scale = 0.5, --0.5 default
		shift = util.by_pixel(0, -19)
	}
}

-- trying to move copy the spidertron legs

if not settings.startup["vanilla-spidertron-size"].value then
    spidertronmk3_entity.height = 2.0
    spidertronmk3_entity.spider_engine = {
        legs = {
            -- 5PM ordering them on the analog clock
            {
                blocking_legs = {2},
                ground_position = {3.375, -3.75},
                leg = "spidertronmk3-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.46875 * 1.4, -0.6875 * 1.4},
            },
            -- 4PM
            {
                blocking_legs = {1, 3},
                ground_position = {5, -1.5},
                leg = "spidertronmk3-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.71875 * 1.4, -0.3125 * 1.4},
            },
            -- 2PM
            {
                blocking_legs = {2, 4},
                ground_position = {5, 1.5},
                leg = "spidertronmk3-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.78125 * 1.4, 0.125 * 1.4},
            },
            -- 1PM
            {
                blocking_legs = {3},
                ground_position = {3.375, 3.75},
                leg = "spidertronmk3-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.46875 * 1.4, 0.53125 * 1.4},
            },
            -- 7PM
            {
                blocking_legs = {6},
                ground_position = {-3.375, -3.75},
                leg = "spidertronmk3-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.46875 * 1.4, -0.6875 * 1.4},
            },
            -- 8PM
            {
                blocking_legs = {5, 7},
                ground_position = {-5, -1.5},
                leg = "spidertronmk3-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.71875 * 1.4, -0.3125 * 1.4},
            },
            -- 10PM
            {
                blocking_legs = {6, 8},
                ground_position = {-5, 1.5},
                leg = "spidertronmk3-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.78125 * 1.4, 0.125 * 1.4},
            },
            -- 11PM
            {
                blocking_legs = {7},
                ground_position = {-3.375, 3.75},
                leg = "spidertronmk3-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.46875 * 1.4, 0.53125 * 1.4},
            }
        },
        military_target = 'spidertron-military-target',
        resistances = {
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
                decrease = 100,
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
    }
--    modify the main body size
    spidertronmk3_entity.graphics_set.animation.layers[1].hr_version.scale = 0.70
    spidertronmk3_entity.graphics_set.animation.layers[2].hr_version.scale = 0.70

    spidertronmk3_entity.graphics_set.shadow_animation.hr_version.scale = 0.70
    spidertronmk3_entity.graphics_set.shadow_animation.hr_version.scale = 0.70

    spidertronmk3_entity.graphics_set.base_animation.layers[1].hr_version.scale = 0.70
    spidertronmk3_entity.graphics_set.base_animation.layers[2].hr_version.scale = 0.70

    spidertronmk3_entity.graphics_set.shadow_base_animation.hr_version.scale = 0.70
    spidertronmk3_entity.graphics_set.shadow_base_animation.hr_version.scale = 0.70
	
	spidertronmk3_entity.graphics_set.animation.layers[3].hr_version.scale = 0.70

end

data:extend{
    spidertronmk3_entity
}
require "util"
require "__spidertron-extended__.resistance_data"
local table_deepcopy = util.table.deepcopy

local ms_inv_size = settings.startup["major-spidertron-invsize"].value
local ms_hp = settings.startup["major-spidertron-hp"].value

local leg_hit_the_ground_trigger = {
    {
        offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
        repeat_count = 4,
        smoke_name = "smoke-building",
        speed_from_center = 0.03,
        starting_frame_deviation = 5,
        starting_frame_speed_deviation = 5,
        type = "create-trivial-smoke",
        start_scale = 1.2,
        end_scale = 1.2
    }
}

-- using mk2 untill get new one
local iconsms = {
    {
        icon = "__spidertron-extended__/icons/spidertron_extended_major_spidertron_item.png",
        icon_size = 64, 
        icon_mipmaps = 4
    }
}

-- MJS
local major_spidertron_entity = table_deepcopy(data.raw["spider-vehicle"]["spidertron"])

major_spidertron_entity.graphics_set.animation.layers[1].filename = "__spidertron-extended__/graphics/major_spidertron_big_camo.png"


-- major spidertron TANK TURRET
major_spidertron_entity.graphics_set.animation.layers[3] = {
	filename = "__spidertron-extended__/graphics/camo_turret_green.png",
    width = 179,
    height = 132,
    line_length = 8,
    direction_count = 64,
    scale = 0.6, --0.5 default -- 0.5 before space age
	shift = util.by_pixel(1, -19),
	hr_version = {
		filename = "__spidertron-extended__/graphics/camo_turret_green.png",
		width = 75,
		height = 100,
		line_length = 8,
		direction_count = 64,
		scale = 0.6, --0.5 default -- 0.5 before space age
		shift = util.by_pixel(1, -19)
	}
}

major_spidertron_entity.name = "major-spidertron"
-- spidertronmk2_entity.icon = nil
-- spidertronmk2_entity.icon_size = nil
-- spidertronmk2_entity.icon_mipmaps = nil
major_spidertron_entity.icons = iconsms
major_spidertron_entity.minable.result = "major-spidertron"
-- extra
major_spidertron_entity.max_health = ms_hp
major_spidertron_entity.inventory_size = ms_inv_size
major_spidertron_entity.equipment_grid = "major-spidertron-grid"
major_spidertron_entity.resistances = table_deepcopy(major_spidertron_resistances)
major_spidertron_entity.chunk_exploration_radius = 5
major_spidertron_entity.automatic_weapon_cycling = false

-- make new guns for him
-- user should be able to disable the artillery if he wants to
if settings.startup["disable-artillery-major-spidertron"] == true then
    major_spidertron_entity.guns = {
        "major-spidertron-machine-gun",
        "major-spidertron-cannon"
    }
else
    major_spidertron_entity.guns = {
        "major-spidertron-machine-gun",
        "major-spidertron-cannon",
        "artillery-wagon-cannon"
    }
end
major_spidertron_entity.chain_shooting_cooldown_modifier = 0.4
major_spidertron_entity.braking_force = 2
major_spidertron_entity.minimap_representation = {
    filename = "__spidertron-extended__/icons/spidertron_extended_major_spidertron_map.png",
    flags = {"icon"},
    size = {128, 128},
    scale = 0.6
}

if not settings.startup["vanilla-spidertron-size"].value then
    major_spidertron_entity.height = 1.75
	major_spidertron_entity.spider_engine = {
        legs = {
            -- 5PM ordering them on the analog clock
            {
                blocking_legs = {2},
                ground_position = {2.8125, -3.125},
                leg = "major-spidertron-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.46875 * 1.2, -0.6875 * 1.2},
                walking_group = 1
            },
            -- 4PM
            {
                blocking_legs = {1, 3},
                ground_position = {4, -1.25},
                leg = "major-spidertron-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.71875 * 1.2, -0.3125 * 1.2},
                walking_group = 2
            },
            -- 2PM
            {
                blocking_legs = {2, 4},
                ground_position = {4, 1.25},
                leg = "major-spidertron-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.78125 * 1.2, 0.125 * 1.2},
                walking_group = 1
            },
            -- 1PM
            {
                blocking_legs = {3},
                ground_position = {2.8125, 3.125},
                leg = "major-spidertron-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.46875 * 1.2, 0.53125 * 1.2},
                walking_group = 2
            },
            -- 7PM
            {
                blocking_legs = {6},
                ground_position = {-2.8125, -3.125},
                leg = "major-spidertron-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.46875 * 1.2, -0.6875 * 1.2},
                walking_group = 2
            },
            -- 8PM
            {
                blocking_legs = {5, 7},
                ground_position = {-4, -1.25},
                leg = "major-spidertron-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.71875 * 1.2, -0.3125 * 1.2},
                walking_group = 1
            },
            -- 10PM
            {
                blocking_legs = {6, 8},
                ground_position = {-4, 1.25},
                leg = "major-spidertron-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.78125 * 1.2, 0.125 * 1.2},
                walking_group = 2
            },
            -- 11PM
            {
                blocking_legs = {7},
                ground_position = {-2.8125, 3.125},
                leg = "major-spidertron-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.46875 * 1.2, 0.53125 * 1.2},
                walking_group = 1
            }
        },
        military_target = 'spidertron-military-target',
        resistances = table_deepcopy(major_spidertron_resistances)
    }
	
-- modify the main body size
	major_spidertron_entity.graphics_set.animation.layers[1].scale = 0.60 --1.20 before space age
	--spidertronmk2_entity.graphics_set.animation.layers[1].hr_version.scale = 0.60

	major_spidertron_entity.graphics_set.animation.layers[2].scale = 0.60
	--spidertronmk2_entity.graphics_set.animation.layers[2].hr_version.scale = 0.60

	major_spidertron_entity.graphics_set.base_animation.layers[1].scale = 0.60
	--spidertronmk2_entity.graphics_set.base_animation.layers[1].hr_version.scale = 0.60

	major_spidertron_entity.graphics_set.base_animation.layers[2].scale = 0.60
	--spidertronmk2_entity.graphics_set.base_animation.layers[2].hr_version.scale = 0.60

	major_spidertron_entity.graphics_set.shadow_animation.scale = 0.60
	--spidertronmk2_entity.graphics_set.shadow_animation.hr_version.scale = 0.60

	major_spidertron_entity.graphics_set.shadow_base_animation.scale = 0.60
	--spidertronmk2_entity.graphics_set.shadow_base_animation.hr_version.scale = 0.60
end

data:extend{
    major_spidertron_entity
}
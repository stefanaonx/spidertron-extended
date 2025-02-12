require "util"
require "__spidertron-extended__.resistance_data"
local table_deepcopy = util.table.deepcopy
local imres = table_deepcopy(immolator_resistances)
local immolator_inv_size = settings.startup["immolator-invsize"].value
local immolator_hp = settings.startup["immolator-hp"].value

local leg_hit_the_ground_trigger = {
    {
        entity_name = "purifier-flame",
        type = "create-fire"
    }
}
if settings.startup["disable-immolator-fire"].value then
    leg_hit_the_ground_trigger = {
        {
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
            repeat_count = 4,
            smoke_name = "smoke-building",
            speed_from_center = 0.03,
            starting_frame_deviation = 5,
            starting_frame_speed_deviation = 5,
            type = "create-trivial-smoke"
        }
    }
end


local immicon = {
    {
        icon = "__spidertron-extended__/icons/spidertron_extended_immolator_item.png",
        icon_size = 64, 
        icon_mipmaps = 4
    }
}

-- immolator
local immolator_entity = table_deepcopy(data.raw["spider-vehicle"]["spidertron"])
immolator_entity.name = "immolator"
immolator_entity.icon = nil
immolator_entity.icon_size = nil
immolator_entity.icon_mipmaps = nil
immolator_entity.icons = immicon
immolator_entity.minable.result = "immolator"
-- extra
immolator_entity.max_health = immolator_hp
immolator_entity.inventory_size = immolator_inv_size
immolator_entity.equipment_grid = "immolator-grid"
immolator_entity.resistances = table_deepcopy(immolator_resistances)
immolator_entity.chunk_exploration_radius = 5
immolator_entity.automatic_weapon_cycling = true
immolator_entity.guns = {
    "spidertron-immolator-flamethrower",
    "spidertron-immolator-flamethrower",
    "spidertron-immolator-flamethrower",
    "spidertron-immolator-flamethrower"
}
immolator_entity.chain_shooting_cooldown_modifier = 0.4
immolator_entity.braking_force = 2
immolator_entity.minimap_representation = {
    filename = "__spidertron-extended__/icons/spidertron_extended_immolator_map.png",
    flags = {"icon"},
    size = {128, 128},
    scale = 0.5
}

-- changes the eye texture
--[[
immolator_entity.graphics_set.animation.layers[3] = {
	filename = "__spidertron-extended__/graphics/spidertron_immolator_eye.png",
	width = 66,
	height = 70,
	line_length = 8,
	direction_count = 64,
	shift = util.by_pixel(1, -19), -- (0, -19) before space age
	hr_version = {
		filename = "__spidertron-extended__/graphics/spidertron_immolator_eye_HD.png",
		width = 132,
		height = 138,
		line_length = 8,
		direction_count = 64,
		scale = 0.4,
		shift = util.by_pixel(1, -19) -- (0, -19) before space age
	}
}
]]
-- forcing high quality textures
immolator_entity.graphics_set.animation.layers[3] = {
	filename = "__spidertron-extended__/graphics/spidertron_immolator_eye_HD.png",
    width = 132,
    height = 138,
    line_length = 8,
    direction_count = 64,
    scale = 0.4,
	shift = util.by_pixel(1, -19), -- (0, -19) before space age
	hr_version = {
		filename = "__spidertron-extended__/graphics/spidertron_immolator_eye_HD.png",
		width = 132,
		height = 138,
		line_length = 8,
		direction_count = 64,
		scale = 0.4,
		shift = util.by_pixel(1, -19) -- (0, -19) before space age
	}
}

-- head turret
immolator_entity.graphics_set.animation.layers[4] = {
	filename = "__spidertron-extended__/graphics/spidertron_immolator_flamethrower_turret_overlay.png",
	width = 132,
	height = 138,
	line_length = 8,
	direction_count = 64,
	shift = util.by_pixel(0, -19),
    scale = 0.4,
	hr_version = {
		filename = "__spidertron-extended__/graphics/spidertron_immolator_flamethrower_turret_overlay.png",
		width = 132,
		height = 138,
		line_length = 8,
		direction_count = 64,
		scale = 0.4,
		shift = util.by_pixel(0, -19)
	}
}

if not settings.startup["vanilla-spidertron-size"].value then
    immolator_entity.height = 1.50
    local leg_scale = 0.7
    local ground_leg_position = leg_scale * 1.1
    local general_hr_scale = 0.4 -- 0.4 before space age
    local general_scale = 0.4 -- 0.8 before space age
	immolator_entity.spider_engine = {
        legs = {
            -- 5PM ordering them on the analog clock
            {
                blocking_legs = {2},
                ground_position = {2.8125 * ground_leg_position, -3.125 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                walking_group = 1,
                mount_position = {0.46875 * leg_scale, -0.6875 * leg_scale}
            },
            -- 4PM
            {
                blocking_legs = {1, 3},
                ground_position = {4 * ground_leg_position, -1.25 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                walking_group = 2,
                mount_position = {0.71875 * leg_scale, -0.3125 * leg_scale}
            },
            -- 2PM
            {
                blocking_legs = {2, 4},
                ground_position = {4 * ground_leg_position, 1.25 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                walking_group = 1,
                mount_position = {0.78125 * leg_scale, 0.125 * leg_scale}
            },
            -- 1PM
            {
                blocking_legs = {3},
                ground_position = {2.8125 * ground_leg_position, 3.125 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                walking_group = 2,
                mount_position = {0.46875 * leg_scale, 0.53125 * leg_scale}
            },
            -- 7PM
            {
                blocking_legs = {6},
                ground_position = {-2.8125 * ground_leg_position, -3.125 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                walking_group = 2,
                mount_position = {-0.46875 * leg_scale, -0.6875 * leg_scale}
            },
            -- 8PM
            {
                blocking_legs = {5, 7},
                ground_position = {-4 * ground_leg_position, -1.25 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                walking_group = 1,
                mount_position = {-0.71875 * leg_scale, -0.3125 * leg_scale}
            },
            -- 10PM
            {
                blocking_legs = {6, 8},
                ground_position = {-4 * ground_leg_position, 1.25 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                walking_group = 2,
                mount_position = {-0.78125 * leg_scale, 0.125 * leg_scale}
            },
            -- 11PM
            {
                blocking_legs = {7},
                ground_position = {-2.8125 * ground_leg_position, 3.125 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                walking_group = 1,
                mount_position = {-0.46875 * leg_scale, 0.53125 * leg_scale}
            }
        },
        military_target = 'spidertron-military-target',
        resistances = table_deepcopy(immolator_resistances)
    }
	
-- modify the main body size
	immolator_entity.graphics_set.animation.layers[1].scale = general_scale
	--immolator_entity.graphics_set.animation.layers[1].hr_version.scale = general_hr_scale

	immolator_entity.graphics_set.animation.layers[2].scale = general_scale
	--immolator_entity.graphics_set.animation.layers[2].hr_version.scale = general_hr_scale

	immolator_entity.graphics_set.base_animation.layers[1].scale = general_scale
	--immolator_entity.graphics_set.base_animation.layers[1].hr_version.scale = general_hr_scale

	immolator_entity.graphics_set.base_animation.layers[2].scale = general_scale
	--immolator_entity.graphics_set.base_animation.layers[2].hr_version.scale = general_hr_scale

	immolator_entity.graphics_set.shadow_animation.scale = general_scale
	--immolator_entity.graphics_set.shadow_animation.hr_version.scale = general_hr_scale

	immolator_entity.graphics_set.shadow_base_animation.scale = general_scale
	--immolator_entity.graphics_set.shadow_base_animation.hr_version.scale = general_hr_scale
end

data:extend{
    immolator_entity
}
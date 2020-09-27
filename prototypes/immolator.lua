-- disabling immolator if required
if settings.startup["disable-immolator"].value then
    return
end

require "util"
local table_deepcopy = util.table.deepcopy

local immolator_inv_size = settings.startup["immolator-invsize"].value
local immolator_hp = settings.startup["immolator-hp"].value

local leg_hit_the_ground_trigger = {
    {
        entity_name = "fire-flame",
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
        icon = "__spidertron-extended__/icons/spidertron_extended_mk2_item.png",
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
immolator_entity.resistances = {
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
        decrease = 60,
        percent = 80
    },
    {
        type = "fire",
        decrease = 0,
        percent = 100
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
immolator_entity.chunk_exploration_radius = 5
immolator_entity.automatic_weapon_cycling = false
immolator_entity.guns = {
    "spidertron-immolator-flamethrower",
    "spidertronmk2-rocket-launcher-1"
}
immolator_entity.chain_shooting_cooldown_modifier = 0.4
immolator_entity.braking_force = 2
immolator_entity.minimap_representation = {
    filename = "__spidertron-extended__/icons/spidertron_extended_immolator_map.png",
    flags = {"icon"},
    size = {128, 128},
    scale = 0.5
}

immolator_entity.graphics_set.animation.layers[3] = {
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
    local general_hr_scale = 0.4
    local general_scale = 0.8
	immolator_entity.spider_engine = {
        legs = {
            -- 5PM ordering them on the analog clock
            {
                blocking_legs = {2},
                ground_position = {2.8125 * ground_leg_position, -3.125 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.46875 * leg_scale, -0.6875 * leg_scale},
            },
            -- 4PM
            {
                blocking_legs = {1, 3},
                ground_position = {4 * ground_leg_position, -1.25 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.71875 * leg_scale, -0.3125 * leg_scale},
            },
            -- 2PM
            {
                blocking_legs = {2, 4},
                ground_position = {4 * ground_leg_position, 1.25 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.78125 * leg_scale, 0.125 * leg_scale},
            },
            -- 1PM
            {
                blocking_legs = {3},
                ground_position = {2.8125 * ground_leg_position, 3.125 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.46875 * leg_scale, 0.53125 * leg_scale},
            },
            -- 7PM
            {
                blocking_legs = {6},
                ground_position = {-2.8125 * ground_leg_position, -3.125 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.46875 * leg_scale, -0.6875 * leg_scale},
            },
            -- 8PM
            {
                blocking_legs = {5, 7},
                ground_position = {-4 * ground_leg_position, -1.25 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.71875 * leg_scale, -0.3125 * leg_scale},
            },
            -- 10PM
            {
                blocking_legs = {6, 8},
                ground_position = {-4 * ground_leg_position, 1.25 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.78125 * leg_scale, 0.125 * leg_scale},
            },
            -- 11PM
            {
                blocking_legs = {7},
                ground_position = {-2.8125 * ground_leg_position, 3.125 * ground_leg_position},
                leg = "spidertron-immolator-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.46875 * leg_scale, 0.53125 * leg_scale},
            }
        },
        military_target = 'spidertron-military-target',
        resistances = {
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
                decrease = 60,
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
    }
	
-- modify the main body size
	immolator_entity.graphics_set.animation.layers[1].scale = general_scale
	immolator_entity.graphics_set.animation.layers[1].hr_version.scale = general_hr_scale

	immolator_entity.graphics_set.animation.layers[2].scale = general_scale
	immolator_entity.graphics_set.animation.layers[2].hr_version.scale = general_hr_scale

	immolator_entity.graphics_set.base_animation.layers[1].scale = general_scale
	immolator_entity.graphics_set.base_animation.layers[1].hr_version.scale = general_hr_scale

	immolator_entity.graphics_set.base_animation.layers[2].scale = general_scale
	immolator_entity.graphics_set.base_animation.layers[2].hr_version.scale = general_hr_scale

	immolator_entity.graphics_set.shadow_animation.scale = general_scale
	immolator_entity.graphics_set.shadow_animation.hr_version.scale = general_hr_scale

	immolator_entity.graphics_set.shadow_base_animation.scale = general_scale
	immolator_entity.graphics_set.shadow_base_animation.hr_version.scale = general_hr_scale
end

data:extend{
    immolator_entity
}
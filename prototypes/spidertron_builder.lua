require "util"
require("prototypes.leg_smoke")

local table_deepcopy = util.table.deepcopy

local icon_sp_builder = {
    {
        icon = "__spidertron-extended__/icons/spidertron_extended_builder_item.png",
        icon_size = 64, 
        icon_mipmaps = 4
    }
}

-- SPIDER BUILDER
local spidertron_builder_entity = table_deepcopy(data.raw["spider-vehicle"]["spidertron"])
spidertron_builder_entity.name = "spidertron-builder"
spidertron_builder_entity.icon = nil
spidertron_builder_entity.icon_size = nil
spidertron_builder_entity.icon_mipmaps = nil
spidertron_builder_entity.icons = icon_sp_builder
spidertron_builder_entity.minable.result = "spidertron-builder"
-- extra
spidertron_builder_entity.max_health = 3000
spidertron_builder_entity.inventory_size = 240
spidertron_builder_entity.equipment_grid = "spidertron-builder-grid"
spidertron_builder_entity.resistances = {
    {
        type = "acid",
        decrease = 0,
        percent = 95
    },
    {
        type = "electric",
        decrease = 0,
        percent = 95
    },
    {
        type = "explosion",
        decrease = 20,
        percent = 50
    },
    {
        type = "fire",
        decrease = 30,
        percent = 80
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
        decrease = 15,
        percent = 60
    }
}
spidertron_builder_entity.chunk_exploration_radius = 7
spidertron_builder_entity.guns = {
    "spidertron-experimental-laser"
}
spidertron_builder_entity.minimap_representation = {
    filename = "__spidertron-extended__/icons/spidertron_extended_builder_map.png",
    flags = {"icon"},
    size = {128, 128},
    scale = 0.5
}

-- testing textures for ghost weaver
spidertron_builder_entity.graphics_set.animation = {
	layers = {{
		direction_count = 64,
		filename = "__spidertron-extended__/graphics/spidertron_builder_body.png",
		height = 70,
		hr_version = {
			direction_count = 64,
			filename = "__spidertron-extended__/graphics/spidertron_builder_body_HD.png",
			height = 138,
			line_length = 8,
			scale = 0.5,
			shift = {0, -0.59375},
			width = 132
		},
		line_length = 8,
		shift = {0, -0.59375},
		width = 66
    }}
}

if not settings.startup["vanilla-spidertron-size"].value then
    spidertron_builder_entity.height = 2.25
    spidertron_builder_entity.spider_engine = {
        legs = {
            -- 5PM ordering them on the analog clock
            {
                blocking_legs = {2},
                ground_position = {2.8125, -3.125},
                leg = "spidertron-builder-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.46875 * 1, -0.6875 * 1},
            },
            -- 4PM
            {
                blocking_legs = {1, 3},
                ground_position = {4, -1.25},
                leg = "spidertron-builder-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.71875 * 1, -0.3125 * 1},
            },
            -- 2PM
            {
                blocking_legs = {2, 4},
                ground_position = {4, 1.25},
                leg = "spidertron-builder-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.78125 * 1, 0.125 * 1},
            },
            -- 1PM
            {
                blocking_legs = {3},
                ground_position = {2.8125, 3.125},
                leg = "spidertron-builder-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {0.46875 * 1, 0.53125 * 1},
            },
            -- 7PM
            {
                blocking_legs = {6},
                ground_position = {-2.8125, -3.125},
                leg = "spidertron-builder-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.46875 * 1, -0.6875 * 1},
            },
            -- 8PM
            {
                blocking_legs = {5, 7},
                ground_position = {-4, -1.25},
                leg = "spidertron-builder-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.71875 * 1, -0.3125 * 1},
            },
            -- 10PM
            {
                blocking_legs = {6, 8},
                ground_position = {-4, 1.25},
                leg = "spidertron-builder-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.78125 * 1, 0.125 * 1},
            },
            -- 11PM
            {
                blocking_legs = {7},
                ground_position = {-2.8125, 3.125},
                leg = "spidertron-builder-leg",
                leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
                mount_position = {-0.46875 * 1, 0.53125 * 1},
            }
        },
        military_target = 'spidertron-military-target',
        resistances = {
            {
                type = "acid",
                decrease = 0,
                percent = 95
            },
            {
                type = "electric",
                decrease = 0,
                percent = 95
            },
            {
                type = "explosion",
                decrease = 20,
                percent = 50
            },
            {
                type = "fire",
                decrease = 30,
                percent = 80
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
                decrease = 15,
                percent = 60
            }
        }
    }
end

data:extend{
	spidertron_builder_entity
}
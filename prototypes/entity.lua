require "util"

local table_deepcopy = util.table.deepcopy

local iconsmk2 = {
    {
        icon = "__spidertron-extended__/icons/spidertron_mk2.png", 
        icon_size = 64, 
        icon_mipmaps = 4
    }
}
local iconsmk3 = {
    {
        icon = "__spidertron-extended__/icons/spidertron_mk3.png", 
        icon_size = 64, 
        icon_mipmaps = 4
    }
}

-- smoke for when the footsteps of the spidertron hits the ground
-- hope the person that made the tarantulator doesn't get mad at me
local leg_hit_the_ground_trigger = {
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

-- MK2 spidertronmk2
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
spidertronmk2_entity.chunk_exploration_radius = 5
spidertronmk2_entity.automatic_weapon_cycling = true
spidertronmk2_entity.guns = {"spidertronmk2-rocket-launcher-1", "spidertronmk2-rocket-launcher-2", "spidertronmk2-rocket-launcher-3", "spidertronmk2-rocket-launcher-4"}
spidertronmk2_entity.chain_shooting_cooldown_modifier = 0.4
spidertronmk2_entity.braking_force = 2
spidertronmk2_entity.minimap_representation = {
    filename = "__spidertron-extended__/icons/spidertron_extended_mk2_map.png",
    flags = {"icon"},
    size = {128, 128},
    scale = 0.6
}
-- trying to change size
spidertronmk2_entity.height = 1.75

-- modify the main body size
spidertronmk2_entity.graphics_set.animation.layers[1].hr_version.scale = 0.60
spidertronmk2_entity.graphics_set.animation.layers[2].hr_version.scale = 0.60

spidertronmk2_entity.graphics_set.shadow_animation.hr_version.scale = 0.60
spidertronmk2_entity.graphics_set.shadow_animation.hr_version.scale = 0.60

spidertronmk2_entity.graphics_set.base_animation.layers[1].hr_version.scale = 0.60
spidertronmk2_entity.graphics_set.base_animation.layers[2].hr_version.scale = 0.60

spidertronmk2_entity.graphics_set.shadow_base_animation.hr_version.scale = 0.60
spidertronmk2_entity.graphics_set.shadow_base_animation.hr_version.scale = 0.60

spidertronmk2_entity.spider_engine = {
    legs = {
        -- 5PM ordering them the way it's in the original
        {
            blocking_legs = {2},
            ground_position = {2.8125, -3.125},
            leg = "spidertronmk2-leg",
            leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
            mount_position = {0.46875 * 1.2, -0.6875 * 1.2},
        },
        -- 4PM
        {
            blocking_legs = {1, 3},
            ground_position = {4, -1.25},
            leg = "spidertronmk2-leg",
            leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
            mount_position = {0.71875 * 1.2, -0.3125 * 1.2},
        },
        -- 2PM
        {
            blocking_legs = {2, 4},
            ground_position = {4, 1.25},
            leg = "spidertronmk2-leg",
            leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
            mount_position = {0.78125 * 1.2, 0.125 * 1.2},
        },
        -- 1PM
        {
            blocking_legs = {3},
            ground_position = {2.8125, 3.125},
            leg = "spidertronmk2-leg",
            leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
            mount_position = {0.46875 * 1.2, 0.53125 * 1.2},
        },
        -- 7PM
        {
            blocking_legs = {6},
            ground_position = {-2.8125, -3.125},
            leg = "spidertronmk2-leg",
            leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
            mount_position = {-0.46875 * 1.2, -0.6875 * 1.2},
        },
        -- 8PM
        {
            blocking_legs = {5, 7},
            ground_position = {-4, -1.25},
            leg = "spidertronmk2-leg",
            leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
            mount_position = {-0.71875 * 1.2, -0.3125 * 1.2},
        },
        -- 10PM
        {
            blocking_legs = {6, 8},
            ground_position = {-4, 1.25},
            leg = "spidertronmk2-leg",
            leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
            mount_position = {-0.78125 * 1.2, 0.125 * 1.2},
        },
        -- 11PM
        {
            blocking_legs = {7},
            ground_position = {-2.8125, 3.125},
            leg = "spidertronmk2-leg",
            leg_hit_the_ground_trigger = leg_hit_the_ground_trigger,
            mount_position = {-0.46875 * 1.2, 0.53125 * 1.2},
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
spidertronmk3_entity.healing_per_tick = 0.5
spidertronmk3_entity.braking_force = 4
-- modifies the mimimap icon
spidertronmk3_entity.minimap_representation = {
    filename = "__spidertron-extended__/icons/spidertron_extended_mk3_map.png",
    flags = {"icon"},
    size = {128, 128},
    scale = 0.7
}
-- trying to change size
spidertronmk3_entity.height = 2.0
-- spidertronmk3_entity.selection_box = {{-2, -2}, {2, 2}}
-- spidertronmk3_entity.collision_box = {{-2, -2}, {2, 2}}

-- trying to move copy the spidertron legs
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
-- modify the main body size
spidertronmk3_entity.graphics_set.animation.layers[1].hr_version.scale = 0.70
spidertronmk3_entity.graphics_set.animation.layers[2].hr_version.scale = 0.70

spidertronmk3_entity.graphics_set.shadow_animation.hr_version.scale = 0.70
spidertronmk3_entity.graphics_set.shadow_animation.hr_version.scale = 0.70

spidertronmk3_entity.graphics_set.base_animation.layers[1].hr_version.scale = 0.70
spidertronmk3_entity.graphics_set.base_animation.layers[2].hr_version.scale = 0.70

spidertronmk3_entity.graphics_set.shadow_base_animation.hr_version.scale = 0.70
spidertronmk3_entity.graphics_set.shadow_base_animation.hr_version.scale = 0.70

-- still 300+ lines, i might split this
data:extend{
    spidertronmk2_entity,
    spidertronmk3_entity
}
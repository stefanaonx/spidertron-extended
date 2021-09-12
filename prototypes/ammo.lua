require "util"
local table_deepcopy = util.table.deepcopy

-- adding new prototype for repair beam
local beam_heal_ammount = settings.startup["spidertron-builder-healing-beam-ammount"].value

local repair_beam = table_deepcopy(data.raw['beam']['laser-beam'])
repair_beam.name = "weaver-repair-beam"
repair_beam.head = {
    filename = "__spidertron-extended-se__/graphics/spidertron_builder_laser_body_HD_1.png",
    tint = {r = 0.8, g = 0.8, b = 0.8},
    flags = {"mipmap"},
    line_length = 8,
    width = 64,
    height = 12,
    frame_count = 8,
    scale = 0.5,
    animation_speed = 0.5,
    blend_mode = laser_beam_blend_mode
}
repair_beam.tail = {
    filename = "__spidertron-extended-se__/graphics/spidertron_builder_laser_end_HD_1.png",
    tint = {r = 0.8, g = 0.8, b = 0.8},
    flags = { "no-crop", "mipmap" },
    width = 110,
    height = 62,
    frame_count = 8,
    shift = util.by_pixel(11.5, 1),
    scale = 0.5,
    animation_speed = 0.5,
    blend_mode = laser_beam_blend_mode
}
repair_beam.body = {
    {
        filename = "__spidertron-extended-se__/graphics/spidertron_builder_laser_body_HD_1.png",
        tint = {r = 0.8, g = 0.8, b = 0.8},
        flags = {"mipmap"},
        line_length = 8,
        width = 64,
        height = 12,
        frame_count = 8,
        scale = 0.5,
        animation_speed = 0.5,
        blend_mode = laser_beam_blend_mode
    }
}

repair_beam.action.action_delivery.target_effects = {
    {
        type = "damage",
        damage = { 
            amount = -1 * beam_heal_ammount, 
            type = "laser"
        }
    }
}

data:extend{
    repair_beam
}

-- adding the ammo-category
data:extend{
    {
        type = "ammo-category",
        name = "retrofitted-battery"
    },
    {
        type = "ammo-category",
        name = "retrofitted-battery2"
    }
}

--adding the ammo
data:extend{
    {
        type = "ammo",
        name = "retrofitted-battery",
        icon = "__spidertron-extended-se__/graphics/spidertron_builder_energy_cell_repair_1.png",
        icon_size = 64,
        flags = {"hidden"},
        ammo_type = {
            category = "retrofitted-battery",
            action = {
                type = "direct",
                action_delivery = {
                    type = "beam",
                    beam = "weaver-repair-beam",
                    max_length = 24,
                    duration = 20,
                    source_offset = {0, -0.9}  --{0, -1.31439 } //{0, -0.9} default right now
                }
            }
        },
        magazine_size = 1, --1
        subgroup = "ammo",
        order = "pe[energy-charges]-c[laser-rifle]",
        stack_size = 1 --20
    },
    {
        type = "ammo",
        name = "retrofitted-battery2",
        icon = "__spidertron-extended-se__/graphics/spidertron_builder_energy_cell_repair_3.png",
        icon_size = 64,
        flags = {"hidden"},
        ammo_type = {
            category = "retrofitted-battery2",
            action = {
                type = "direct",
                action_delivery = {
                    type = "beam",
                    beam = "laser-beam",
                    max_length = 24,
                    duration = 20,
                    source_offset = {0, -0.9}  --{0, -1.31439 }
                }
            }
        },
        magazine_size = 1, --1
        subgroup = "ammo",
        order = "pe[energy-charges]-c[laser-rifle]",
        stack_size = 1 --20
    }
}

--adding recipe for the ammo
local retrofitted_battery = {
    type = "recipe",
    name = "retrofitted-battery",
    enabled = false,
    ingredients = {
        {"fusion-reactor-equipment", 1},
        {"rocket-control-unit", 5}
    },
    energy_required = 10,
    result = "retrofitted-battery"
}
local retrofitted_battery2 = {
    type = "recipe",
    name = "retrofitted-battery2",
    enabled = false,
    ingredients = {
        {"fusion-reactor-equipment", 1},
        {"rocket-control-unit", 5}
    },
    energy_required = 10,
    result = "retrofitted-battery2"
}


data:extend{
    retrofitted_battery,
    retrofitted_battery2
}
require "util"
local item_sounds = require("__base__.prototypes.item_sounds")
local table_deepcopy = util.table.deepcopy

-- adding new prototype for repair beam
local beam_heal_ammount = settings.startup["spidertron-builder-healing-beam-ammount"].value

local repair_beam = table_deepcopy(data.raw['beam']['laser-beam'])
repair_beam.name = "weaver-repair-beam"


repair_beam.graphics_set.beam.head.layers[1].filename = "__spidertron-extended__/graphics/spidertron_builder_laser_body_HD_1.png"

repair_beam.graphics_set.beam.tail.layers[1].filename = "__spidertron-extended__/graphics/spidertron_builder_laser_end_HD_1.png"
--repair_beam.tail.width = 110
--repair_beam.tail.height = 62
--repair_beam.tail.frame_count = 8

repair_beam.graphics_set.beam.body[1].layers[1].filename = "__spidertron-extended__/graphics/spidertron_builder_laser_body_HD_1.png"

-- tried replacing for the body how is it up but doesn't work
--[[
repair_beam.body = {
    {
        filename = "__spidertron-extended__/graphics/spidertron_builder_laser_body_HD_1.png",
        flags = beam_non_light_flags,
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
--]]



-- the values under here are the same as original laser beam
-- this part can be cleaned up / removed if not used
--[[
repair_beam.head = {
    filename = "__spidertron-extended__/graphics/spidertron_builder_laser_body_HD_1.png",
    flags = beam_non_light_flags,
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
    filename = "__spidertron-extended__/graphics/spidertron_builder_laser_end_HD_1.png",
    flags = beam_non_light_flags,
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
        filename = "__spidertron-extended__/graphics/spidertron_builder_laser_body_HD_1.png",
        flags = beam_non_light_flags,
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
--]]
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
        name = "retrofitted-battery",
        hidden_in_factoriopedia = true
    },
    {
        type = "ammo-category",
        name = "retrofitted-battery2",
        hidden_in_factoriopedia = true
    }
}

--adding the ammo
data:extend{
    {
        type = "ammo",
        name = "retrofitted-battery",
        icon = "__spidertron-extended__/graphics/spidertron_builder_energy_cell_repair_1.png",
        flags = {"excluded-from-trash-unrequested"},
        icon_size = 64,
        hidden = true,
        ammo_category = "retrofitted-battery",
        ammo_type = {
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
        inventory_move_sound = item_sounds.mechanical_inventory_move,
        pick_sound = item_sounds.mechanical_inventory_pickup,
        drop_sound = item_sounds.mechanical_inventory_move,
        stack_size = 1, --20
        weight = 10*kg
    },
    {
        type = "ammo",
        name = "retrofitted-battery2",
        icon = "__spidertron-extended__/graphics/spidertron_builder_energy_cell_repair_3.png",
        flags = {"excluded-from-trash-unrequested"},
        icon_size = 64,
        hidden = true,
        ammo_category = "retrofitted-battery2",
        ammo_type = {
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
        inventory_move_sound = item_sounds.mechanical_inventory_move,
        pick_sound = item_sounds.mechanical_inventory_pickup,
        drop_sound = item_sounds.mechanical_inventory_move,
        stack_size = 1, --20
        weight = 10*kg
    }
}

--adding recipe for the ammo
local retrofitted_battery = {
    type = "recipe",
    name = "retrofitted-battery",
    enabled = false,
    ingredients = {
        {type = "item", name = "fission-reactor-equipment", amount = 1},
        {type = "item", name = "productivity-module-2", amount = 5}
    },
    energy_required = 10,
    results = {{type="item", name="retrofitted-battery", amount=1}}
}
local retrofitted_battery2 = {
    type = "recipe",
    name = "retrofitted-battery2",
    enabled = false,
    ingredients = {
        {type = "item", name = "fission-reactor-equipment", amount = 1},
        {type = "item", name = "productivity-module-2", amount = 5}
    },
    energy_required = 10,
    results = {{type="item", name="retrofitted-battery2", amount=1}}
}


data:extend{
    retrofitted_battery,
    retrofitted_battery2
}
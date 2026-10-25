require "util"
local table_deepcopy = util.table.deepcopy

-- Ghost Weaver beams.
-- These are visual only: the healing and damage are applied by control.lua, so the Ghost Weaver
-- needs no guns, ammo or energy cell items at all.

local function visual_only(beam)
    beam.action = nil
    beam.action_triggered_automatically = false
    return beam
end

-- Weaving Beam (repair)
local repair_beam = visual_only(table_deepcopy(data.raw["beam"]["laser-beam"]))
repair_beam.name = "weaver-repair-beam"
repair_beam.graphics_set.beam.head.layers[1].filename = "__spidertron-extended__/graphics/spidertron_builder_laser_body_HD_1.png"
repair_beam.graphics_set.beam.tail.layers[1].filename = "__spidertron-extended__/graphics/spidertron_builder_laser_end_HD_1.png"
repair_beam.graphics_set.beam.body[1].layers[1].filename = "__spidertron-extended__/graphics/spidertron_builder_laser_body_HD_1.png"

-- Reaping Beam (attack), looks like the vanilla laser beam
local reaper_beam = visual_only(table_deepcopy(data.raw["beam"]["laser-beam"]))
reaper_beam.name = "weaver-reaper-beam"

data:extend{
    repair_beam,
    reaper_beam
}

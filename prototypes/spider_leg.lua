require "util"

local table_deepcopy = util.table.deepcopy

-- leg for spidertronmk2
local spidertronmk2_leg = table_deepcopy(data.raw['spider-leg']['spidertron-leg-1'])
spidertronmk2_leg.name = "spidertronmk2-leg"
spidertronmk2_leg.part_length = 4

-- leg for spidertronmk3
local spidertronmk3_leg = table_deepcopy(data.raw['spider-leg']['spidertron-leg-1'])
spidertronmk3_leg.name = "spidertronmk3-leg"
spidertronmk3_leg.part_length = 5
spidertronmk3_leg.movement_based_position_selection_distance = 6
-- what happens if i change the scale? // 0.5 default, doesn't seem to affect
spidertronmk3_leg.scale = 1.0

-- leg for spider builder
local spidertron_builder_leg = table_deepcopy(data.raw['spider-leg']['spidertron-leg-1'])
spidertron_builder_leg.name = "spidertron-builder-leg"
spidertron_builder_leg.part_length = 3

-- leg for the immolator
local spidertron_immolator = table_deepcopy(data.raw['spider-leg']['spidertron-leg-1'])
spidertron_immolator.name = "spidertron-immolator-leg"
spidertron_immolator.part_length = 2
spidertron_immolator.scale = 0.4

data:extend{
    spidertronmk2_leg,
    spidertronmk3_leg,
	spidertron_builder_leg,
    spidertron_immolator
}
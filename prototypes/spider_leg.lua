require "util"
require "__spidertron-extended__.resistance_data"

local table_deepcopy = util.table.deepcopy

-- leg for spidertronmk2
local spidertronmk2_leg = table_deepcopy(data.raw['spider-leg']['spidertron-leg-1'])
spidertronmk2_leg.name = "spidertronmk2-leg"
spidertronmk2_leg.part_length = 4
spidertronmk2_leg.resistances = table_deepcopy(spidertronmk2_resistances)
spidertronmk2_leg.resistances[3].percent = 100

-- leg for spidertronmk3
local spidertronmk3_leg = table_deepcopy(data.raw['spider-leg']['spidertron-leg-1'])
spidertronmk3_leg.name = "spidertronmk3-leg"
spidertronmk3_leg.part_length = 5
spidertronmk3_leg.movement_based_position_selection_distance = 6
-- what happens if i change the scale? // 0.5 default, doesn't seem to affect
spidertronmk3_leg.scale = 1.0
spidertronmk3_leg.resistances = table_deepcopy(spidertronmk3_resistances)
spidertronmk3_leg.resistances[3].percent = 100

-- leg for spider builder
local spidertron_builder_leg = table_deepcopy(data.raw['spider-leg']['spidertron-leg-1'])
spidertron_builder_leg.name = "spidertron-builder-leg"
spidertron_builder_leg.part_length = 3
spidertron_builder_leg.resistances = table_deepcopy(spidertron_builder_resistances)
spidertron_builder_leg.resistances[3].percent = 100

-- leg for the immolator
local spidertron_immolator_leg = table_deepcopy(data.raw['spider-leg']['spidertron-leg-1'])
spidertron_immolator_leg.name = "spidertron-immolator-leg"
spidertron_immolator_leg.part_length = 2
spidertron_immolator_leg.scale = 0.4
spidertron_immolator_leg.resistances = table_deepcopy(immolator_resistances)
spidertron_immolator_leg.resistances[3].percent = 100

-- leg for major spidertron
local major_spidertron_leg = table_deepcopy(data.raw['spider-leg']['spidertron-leg-1'])
major_spidertron_leg.name = "major-spidertron-leg"
major_spidertron_leg.part_length = 4
major_spidertron_leg.resistances = table_deepcopy(major_spidertron_resistances)
major_spidertron_leg.resistances[3].percent = 100

data:extend{
    spidertronmk2_leg,
    spidertronmk3_leg,
	spidertron_builder_leg,
    spidertron_immolator_leg,
    major_spidertron_leg
}
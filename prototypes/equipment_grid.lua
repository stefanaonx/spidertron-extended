-- grids

local table_deepcopy = util.table.deepcopy

local smk2w = settings.startup["spidertronmk2-width"].value
local smk2h = settings.startup["spidertronmk2-height"].value
local smk3w = settings.startup["spidertronmk3-width"].value
local smk3h = settings.startup["spidertronmk3-height"].value
local sbuildw = settings.startup["spidertron-builder-width"].value
local sbuildh = settings.startup["spidertron-builder-height"].value
local immw = settings.startup["immolator-width"].value
local immh = settings.startup["immolator-height"].value
local mjsw = settings.startup["major-spidertron-width"].value
local mjsh = settings.startup["major-spidertron-height"].value


local basic_equipment_categories = data.raw["equipment-grid"]["spidertron-equipment-grid"].equipment_categories

local spidertronmk2_grid = {
    type = "equipment-grid",
    name = "spidertronmk2-grid",
    width = smk2w,
    height = smk2h,
    equipment_categories = basic_equipment_categories
}

local spidertronmk3_grid = {
    type = "equipment-grid",
    name = "spidertronmk3-grid",
    width = smk3w,
    height = smk3h,
    equipment_categories = basic_equipment_categories
}

local spidertron_builder_grid = {
    type = "equipment-grid",
    name = "spidertron-builder-grid",
    width = sbuildw,
    height = sbuildh,
    equipment_categories = basic_equipment_categories
}

local immolator_grid = {
    type = "equipment-grid",
    name = "immolator-grid",
    width = immw,
    height = immh,
    equipment_categories = basic_equipment_categories
}

local major_spidertron_grid = {
    type = "equipment-grid",
    name = "major-spidertron-grid",
    width = mjsw,
    height = mjsh,
    equipment_categories = basic_equipment_categories
}


data:extend{
    spidertronmk2_grid,
    spidertronmk3_grid,
	spidertron_builder_grid,
    immolator_grid,
    major_spidertron_grid
}
-- grids

local smk2w = settings.startup["spidertronmk2-width"].value
local smk2h = settings.startup["spidertronmk2-height"].value
local smk3w = settings.startup["spidertronmk3-width"].value
local smk3h = settings.startup["spidertronmk3-height"].value
local sbuildw = settings.startup["spidertron-builder-width"].value
local sbuildh = settings.startup["spidertron-builder-height"].value
local immw = settings.startup["immolator-width"].value
local immh = settings.startup["immolator-height"].value

local spidertronmk2_grid = {
    type = "equipment-grid",
    name = "spidertronmk2-grid",
    width = smk2w,
    height = smk2h,
    equipment_categories = {"armor"}
}

local spidertronmk3_grid = {
    type = "equipment-grid",
    name = "spidertronmk3-grid",
    width = smk3w,
    height = smk3h,
    equipment_categories = {"armor"}
}

local spidertron_builder_grid = {
    type = "equipment-grid",
    name = "spidertron-builder-grid",
    width = sbuildw,
    height = sbuildh,
    equipment_categories = {"armor"}
}

local immolator_grid = {
    type = "equipment-grid",
    name = "immolator-grid",
    width = immw,
    height = immh,
    equipment_categories = {"armor"}
}


data:extend{
    spidertronmk2_grid,
    spidertronmk3_grid,
	spidertron_builder_grid,
    immolator_grid
}
-- grids

local smk2w = settings.startup["spidertronmk2-width"].value
local smk2h = settings.startup["spidertronmk2-height"].value
local smk3w = settings.startup["spidertronmk3-width"].value
local smk3h = settings.startup["spidertronmk3-height"].value

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

data:extend{
    spidertronmk2_grid,
    spidertronmk3_grid
}
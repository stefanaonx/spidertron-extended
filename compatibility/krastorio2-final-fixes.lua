--skipping if Krastorio2 not present
if not mods["Krastorio2"] then
    return
end

-- trying to change so that vanilla spidertron
-- doesn't use burner for krastorio on setting
if settings.startup["disable-krastorio-spidertron-burner"].value then
    data.raw["spider-vehicle"]["spidertron"].energy_source = data.raw["spider-vehicle"]["spidertronmk2"].energy_source
    data.raw["spider-vehicle"]["spidertron"].movement_energy_consumption = data.raw["spider-vehicle"]["spidertronmk2"].movement_energy_consumption
end
-- copying the grid equipment here since the variables are available here
data.raw["equipment-grid"]["spidertronmk2-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories
data.raw["equipment-grid"]["spidertronmk3-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories
data.raw["equipment-grid"]["spidertron-builder-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories
data.raw["equipment-grid"]["immolator-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories
data.raw["equipment-grid"]["major-spidertron-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories

-- now adjust the grid size
local vanilla_grid_width = settings.startup["vanilla-spidertron-width"].value
local vanilla_grid_height = settings.startup["vanilla-spidertron-height"].value

if vanilla_grid_width ~= 0 then
    data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].width = vanilla_grid_width
end
if vanilla_grid_height ~= 0 then
    data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].height = vanilla_grid_height
end
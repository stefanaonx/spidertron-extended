-- trying to change so that vanilla spidertron 
-- doesn't use burner for krastorio on setting

if mods["Krastorio2"] then
    if settings.startup["disable-krastorio-spidertron-burner"].value then
        data.raw["spider-vehicle"]["spidertron"].energy_source = data.raw["spider-vehicle"]["spidertronmk2"].energy_source
        data.raw["spider-vehicle"]["spidertron"].movement_energy_consumption = data.raw["spider-vehicle"]["spidertronmk2"].movement_energy_consumption
    end
    -- copying the grid equipment here since the variables are available here
    data.raw["equipment-grid"]["spidertronmk2-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories
    data.raw["equipment-grid"]["spidertronmk3-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories
    data.raw["equipment-grid"]["spidertron-builder-grid"].equipment_categories = data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories
end
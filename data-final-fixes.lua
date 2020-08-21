-- trying to change so that vanilla spidertron 
-- doesn't use burner for krastorio on setting

if mods["Krastorio2"] then
    if settings.startup["disable-krastorio-spidertron-burner"].value then
        data.raw["spider-vehicle"]["spidertron"].energy_source = data.raw["spider-vehicle"]["spidertronmk2"].energy_source
        data.raw["spider-vehicle"]["spidertron"].movement_energy_consumption = data.raw["spider-vehicle"]["spidertronmk2"].movement_energy_consumption
    end
end
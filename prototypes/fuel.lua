local table_deepcopy = util.table.deepcopy
-- i can customize them even more from here for each one
if settings.startup["enable-spidertron-extended-burner"].value then
    -- copying fuel values from tank
    -- local energy_source = table_deepcopy(data.raw["car"]["tank"].energy_source) -- tried tank and it's too limited
    local energy_source = table_deepcopy(data.raw["locomotive"]["locomotive"].energy_source)
    -- adding fuel values for each one depending if it's enabled or disabled
    -- mk2 changes
    if not settings.startup["disable-spidertronmk2"].value then
        data.raw["spider-vehicle"]["spidertronmk2"].energy_source = energy_source
    end
    -- immolator changes
    if not settings.startup["disable-immolator"].value then
        data.raw["spider-vehicle"]["immolator"].energy_source = energy_source
    end
    -- mk3 changes
    if not settings.startup["disable-spidertronmk3"].value then
        data.raw["spider-vehicle"]["spidertronmk3"].energy_source = energy_source
    end
    -- spider builder changes
    if not settings.startup["disable-spidertron-builder"].value then
        data.raw["spider-vehicle"]["spidertron-builder"].energy_source = energy_source
    end
    --major spidertron changes
    if not settings.startup["disable-major-spidertron"].value then
        data.raw["spider-vehicle"]["major-spidertron"].energy_source = energy_source
    end
end
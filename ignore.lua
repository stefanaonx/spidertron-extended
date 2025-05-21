    --[[--Disable spidertronmk4
    {
        type = "bool-setting",
        name = "disable-spidertronmk4",
        setting_type = "startup",
        default_value = false,
        order = "x1"
    },
    --]]

## Used in bobvehicle
    --Crashes if enabled using new selective setting format
    --Sync coding, exiting if disable-bobs equipment is active
    --[[
        if settings.startup["disable-bobs-equipment"].value then
            return
        end
    ]]

## Used in bobvehicle-final-fixes
    --[[ --Crashes if enabled using new selective setting format
    if settings.startup["disable-bobs-vehicle-equipment-vanilla"].value then
        data.raw["equipment-grid"]["spidertron-equipment-grid"].equipment_categories = {"armor"}
    end]]
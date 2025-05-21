-- checking if mod doesn't exists
if  mods["bobvehicleequipment"] then
    -- Might want to copy the entire spidertron grid so we don't. Have any compatibility issues with any other mods directly.
    data.raw["equipment-grid"]["spidertronmk2-grid"].equipment_categories = {
        "spidertron",
        "vehicle",
        "armoured-vehicle"
    }

    data.raw["equipment-grid"]["spidertronmk3-grid"].equipment_categories = {
        "spidertron",
        "vehicle",
        "armoured-vehicle"
    }

    data.raw["equipment-grid"]["spidertron-builder-grid"].equipment_categories = {
        "spidertron",
        "vehicle",
        "armoured-vehicle"
    }

    data.raw["equipment-grid"]["immolator-grid"].equipment_categories = {
        "spidertron",
        "vehicle",
        "armoured-vehicle"
    }

    data.raw["equipment-grid"]["major-spidertron-grid"].equipment_categories = {
        "spidertron",
        "vehicle",
        "armoured-vehicle"
    }
end
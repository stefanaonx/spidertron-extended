-- checking if mod doesn't exists
if not mods["bobvehicleequipment"] then
    return
end

-- gotta love sync coding
-- exiting if disable-bobs equipment is active
if settings.startup["disable-bobs-equipment"].value then
    return
end

-- maybe i should copy the entire spidertron grid so i don't
-- have any compatibility issues with any other mods directly

-- modify the grids equipment
if not settings.startup["disable-spidertronmk2"].value then
    data.raw["equipment-grid"]["spidertronmk2-grid"].equipment_categories = {
        "spidertron",
        "vehicle",
        "armoured-vehicle"
    }
end

if not settings.startup["disable-spidertronmk3"].value then
    data.raw["equipment-grid"]["spidertronmk3-grid"].equipment_categories = {
        "spidertron",
        "vehicle",
        "armoured-vehicle"
    }
end

if not settings.startup["disable-spidertron-builder"].value then
    data.raw["equipment-grid"]["spidertron-builder-grid"].equipment_categories = {
        "spidertron",
        "vehicle",
        "armoured-vehicle"
    }
end
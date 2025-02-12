-- new setting to disable bobs vehicle equipment on vanilla spidertron
-- this will affect other mods though ... sad
if settings.startup["disable-bobs-vehicle-equipment-vanilla"].value then
    data.raw["equipment-grid"]["spidertron-equipment-grid"].equipment_categories = {"armor"}
end

if mods["bobequipment"] then
    grid_items = {
        "armor"
    }
    if mods["bobvehicleequipment"] then
        grid_items = {
            "armor",
            "spidertron",
            "vehicle",
            "armoured-vehicle"
        }
    end
    if settings.startup["enable-bobs-all-equipment-spidertrons"].value then
        data.raw["equipment-grid"]["spidertron-equipment-grid"].equipment_categories = grid_items
        data.raw["equipment-grid"]["spidertronmk2-grid"].equipment_categories = grid_items
        data.raw["equipment-grid"]["spidertronmk3-grid"].equipment_categories = grid_items
        data.raw["equipment-grid"]["spidertron-builder-grid"].equipment_categories = grid_items
        data.raw["equipment-grid"]["immolator-grid"].equipment_categories = grid_items
    end
end
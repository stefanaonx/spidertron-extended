-- new setting to disable bobs vehicle equipment on vanilla spidertron
-- this will affect other mods though ... sad
if settings.startup["disable-bobs-vehicle-equipment-vanilla"].value then
    data.raw["equipment-grid"]["spidertron-equipment-grid"].equipment_categories = {"armor"}
end

--defining grid_items based on what we have enabled
local grid_items = {}
if mods["bobvehicleequipment"] then
    grid_items = {"armor", "spidertron", "vehicle", "armoured-vehicle"}
elseif mods["bobequipment"] then
    grid_items = { "armor" }
end

--setting the grids and making sure that grid_items isnt empty because this lua file always runs but we could be missing
--bobvehicleequipment AND bobequipment
if settings.startup["enable-bobs-all-equipment-spidertrons"].value and next(grid_items) ~= nil then
    data.raw["equipment-grid"]["spidertron-equipment-grid"].equipment_categories = grid_items
    data.raw["equipment-grid"]["spidertronmk2-grid"].equipment_categories = grid_items
    data.raw["equipment-grid"]["spidertronmk3-grid"].equipment_categories = grid_items
    data.raw["equipment-grid"]["spidertron-builder-grid"].equipment_categories = grid_items
    data.raw["equipment-grid"]["immolator-grid"].equipment_categories = grid_items
    data.raw["equipment-grid"]["major-spidertron-grid"].equipment_categories = grid_items
end
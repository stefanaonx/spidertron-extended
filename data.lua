require("prototypes.gun")
require("prototypes.equipment_grid")
require("prototypes.item")
require("prototypes.spider_leg")
require("prototypes.recipe")
require("prototypes.technology")
require("prototypes.entity")
-- changes for vanilla
require("prototypes.vanilla")

if mods["Krastorio2"] then
    -- compatible with version 1.0.3 of krastorio2
    require("prototypes.compatibility_krastorio2")
end

if mods["bobvehicleequipment"] then
    -- compatibility with bobs vehicle equipment
    require("prototypes.compatibility_bobvehicleequipment")
end

if mods["vintage-spidertron"] then
    -- compatibility with bobs vehicle equipment
    require("prototypes.compatibility_vintage_spidertron")
end

require("prototypes.gun")
require("prototypes.equipment_grid")
require("prototypes.item")
require("prototypes.spider_leg")
require("prototypes.recipe")
require("prototypes.technology")
-- changes for vanilla
require("prototypes.vanilla")

-- separate files for spidertrons with disable feature
-- disabling recipe if we need this disabled
if not settings.startup["disable-spidertronmk2"].value then
    require("prototypes.spidertronmk2")
end

-- disabling recipe if we need this disabled
if not settings.startup["disable-spidertronmk3"].value then
    require("prototypes.spidertronmk3")
end

-- disabling recipe if we need this disabled
if not settings.startup["disable-spidertron-builder"].value then
    require("prototypes.spidertron_builder")
end
    
if mods["Krastorio2"] then
    -- compatible with version 1.0.3 of krastorio2
    require("prototypes.compatibility_krastorio2")
end

if mods["bobvehicleequipment"] then
    -- compatibility with bobs vehicle equipment
    if not settings.startup["disable-bobs-equipment"].value then
        require("prototypes.compatibility_bobvehicleequipment")
    end
end

if mods["vintage-spidertron"] then
    -- compatibility with bobs vehicle equipment
    require("prototypes.compatibility_vintage_spidertron")
end

if mods["Krastorio2_Spiderleg"] then
    -- compatibility with bobs vehicle equipment
    require("prototypes.compatibility_krastorio2_spiderleg")
end

if mods["spidertron-deal-with-it"] then
    -- compatibility with bobs vehicle equipment
    require("prototypes.compatibility_deal_with_it")
end
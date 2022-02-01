-- modifying original minmap icon to yellow
data.raw["spider-vehicle"]["spidertron"].minimap_representation = {
    filename = "__spidertron-extended__/icons/spidertron_extended_vanilla_map.png",
    flags = {"icon"},
    size = {128, 128},
    scale = 0.5
}

-- apply settings
local vanilla_grid_width = settings.startup["vanilla-spidertron-width"].value
local vanilla_grid_height = settings.startup["vanilla-spidertron-height"].value
local vanilla_invsize = settings.startup["vanilla-spidertron-invsize"].value
local vanilla_hp = settings.startup["vanilla-spidertron-hp"].value

if vanilla_grid_width ~= 0 then
    data.raw["equipment-grid"]["spidertron-equipment-grid"].width = vanilla_grid_width
end
if vanilla_grid_height ~= 0 then
    data.raw["equipment-grid"]["spidertron-equipment-grid"].height = vanilla_grid_height
end
if vanilla_invsize ~= 0 then
    data.raw["spider-vehicle"]["spidertron"].inventory_size = vanilla_invsize
end
if vanilla_hp ~= 0 then
    data.raw["spider-vehicle"]["spidertron"].max_health = vanilla_hp    
end

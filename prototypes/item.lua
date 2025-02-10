require "util"

local table_deepcopy = util.table.deepcopy

local iconsmk2 = {
    {
        icon = "__spidertron-extended__/icons/spidertron_extended_mk2_item.png", 
        icon_size = 64, 
        icon_mipmaps = 4
    }
}
-- using mk2 icon for major spidertron till i get new one
local icons_mj_spidertron = {
    {
        icon = "__spidertron-extended__/icons/spidertron_extended_mk2_item.png",
        icon_size = 64,
        icon_mipmaps = 4
    }
}
local iconsmk3 = {
    {
        icon = "__spidertron-extended__/icons/spidertron_extended_mk3_item.png", 
        icon_size = 64, 
        icon_mipmaps = 4
    }
}
local icon_sp_builder = {
    {
        icon = "__spidertron-extended__/icons/spidertron_extended_builder_item.png",
        icon_size = 64, 
        icon_mipmaps = 4
    }
}
local immolator = {
    {
        icon = "__spidertron-extended__/icons/spidertron_extended_immolator_item.png", 
        icon_size = 64, 
        icon_mipmaps = 4
    }
}

-- mk2 item
if not settings.startup["disable-spidertronmk2"].value then
    local spidertronmk2_item = table_deepcopy(data.raw["item-with-entity-data"]["spidertron"])
    spidertronmk2_item.name = "spidertronmk2"
    -- spidertronmk2_item.icon = nil
    -- spidertronmk2_item.icon_size = nil
    -- spidertronmk2_item.icon_mipmaps = nil
    spidertronmk2_item.icons = iconsmk2
    spidertronmk2_item.order = "b[personal-transport]-c[spidertron]-ab[spidertronmk2]"
    spidertronmk2_item.place_result = "spidertronmk2"
    data:extend{
        spidertronmk2_item
    }
end

-- mk3 item
if not settings.startup["disable-spidertronmk3"].value then
    local spidertronmk3_item = table_deepcopy(data.raw["item-with-entity-data"]["spidertron"])
    spidertronmk3_item.name = "spidertronmk3"
    -- spidertronmk3_item.icon = nil
    -- spidertronmk3_item.icon_size = nil
    -- spidertronmk3_item.icon_mipmaps = nil
    spidertronmk3_item.icons = iconsmk3
    spidertronmk3_item.order = "b[personal-transport]-c[spidertron]-ab[spidertronmk3]"
    spidertronmk3_item.place_result = "spidertronmk3"
    data:extend{
        spidertronmk3_item
    }
end
    
-- builder item
if not settings.startup["disable-spidertron-builder"].value then
    local spidertron_builder_item = table_deepcopy(data.raw["item-with-entity-data"]["spidertron"])
    spidertron_builder_item.name = "spidertron-builder"
    -- spidertron_builder_item.icon = nil
    -- spidertron_builder_item.icon_size = nil
    -- spidertron_builder_item.icon_mipmaps = nil
    spidertron_builder_item.icons = icon_sp_builder
    spidertron_builder_item.order = "b[personal-transport]-c[spidertron]-ab[spidertron_builder]"
    spidertron_builder_item.place_result = "spidertron-builder"
    data:extend{
        spidertron_builder_item
    }
end

-- immolator item
if not settings.startup["disable-immolator"].value then
    local immolator_item = table_deepcopy(data.raw["item-with-entity-data"]["spidertron"])
    immolator_item.name = "immolator"
    -- immolator_item.icon = nil
    -- immolator_item.icon_size = nil
    -- immolator_item.icon_mipmaps = nil
    immolator_item.icons = immolator
    immolator_item.order = "b[personal-transport]-c[spidertron]-ab[immolator]"
    immolator_item.place_result = "immolator"
    data:extend{
        immolator_item
    }
end

-- major spidertron item
if not settings.startup["disable-major-spidertron"].value then
    local major_spidertron_item = table_deepcopy(data.raw["item-with-entity-data"]["spidertron"])
    major_spidertron_item.name = "major-spidertron"
    -- major_spidertron_item.icon = nil
    -- major_spidertron_item.icon_size = nil
    -- major_spidertron_item.icon_mipmaps = nil
    major_spidertron_item.icons = icons_mj_spidertron
    major_spidertron_item.order = "b[personal-transport]-c[spidertron]-ab[major_spidertron]" -- need to change order
    major_spidertron_item.place_result = "major-spidertron"
    data:extend{
        major_spidertron_item
    }
end

-- major spidertron machine gun and cannon
local spidertron_machine_gun_item = table_deepcopy(data.raw["gun"]["tank-machine-gun"])
spidertron_machine_gun_item.name = "spidertron-machine-gun"
spidertron_machine_gun_item.attack_parameters.cooldown = 2
spidertron_machine_gun_item.attack_parameters.range = 30

local spidertron_cannon_item = table_deepcopy(data.raw["gun"]["tank-cannon"])
spidertron_cannon_item.name = "spidertron-cannon"
spidertron_cannon_item.attack_parameters.cooldown = 80
spidertron_cannon_item.attack_parameters.range = 70

data:extend{
    spidertron_machine_gun_item,
    spidertron_cannon_item
}
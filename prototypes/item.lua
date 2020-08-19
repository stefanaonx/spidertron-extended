require "util"

local table_deepcopy = util.table.deepcopy

local iconsmk2 = {
    {
        icon = "__spidertron-extended__/icons/spidertron_mk2.png", 
        icon_size = 64, 
        icon_mipmaps = 4
    }
}
local iconsmk3 = {
    {
        icon = "__spidertron-extended__/icons/spidertron_mk3.png", 
        icon_size = 64, 
        icon_mipmaps = 4
    }
}

-- mk2 item
local spidertronmk2_item = table_deepcopy(data.raw["item-with-entity-data"]["spidertron"])
spidertronmk2_item.name = "spidertronmk2"
spidertronmk2_item.icon = nil
spidertronmk2_item.icon_size = nil
spidertronmk2_item.icon_mipmaps = nil
spidertronmk2_item.icons = iconsmk2
spidertronmk2_item.order = "b[personal-transport]-c[spidertron]-ab[spidertronmk2]"
spidertronmk2_item.place_result = "spidertronmk2"

-- mk3 item
local spidertronmk3_item = table_deepcopy(data.raw["item-with-entity-data"]["spidertron"])
spidertronmk3_item.name = "spidertronmk3"
spidertronmk3_item.icon = nil
spidertronmk3_item.icon_size = nil
spidertronmk3_item.icon_mipmaps = nil
spidertronmk3_item.icons = iconsmk3
spidertronmk3_item.order = "b[personal-transport]-c[spidertron]-ab[spidertronmk3]"
spidertronmk3_item.place_result = "spidertronmk3"

data:extend{
    spidertronmk2_item,
    spidertronmk3_item
}
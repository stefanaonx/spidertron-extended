-- checking if mod doesn't exists
if not mods["Krastorio2_Spiderleg"] then
    return
end

table.insert(data.raw["equipment-grid"]["spidertronmk2-grid"].equipment_categories, "armor")
table.insert(data.raw["equipment-grid"]["spidertronmk3-grid"].equipment_categories, "armor")
table.insert(data.raw["equipment-grid"]["spidertron-builder-grid"].equipment_categories, "armor")
table.insert(data.raw["equipment-grid"]["immolator-grid"].equipment_categories, "armor")
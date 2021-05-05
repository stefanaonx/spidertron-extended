-- checking if mod doesn't exists
if not mods["RampantArsenal"] then
    return
end

-- at some point i gotta add this in a separate file
spidertrons_grids = {
    "spidertronmk2-grid",
    "spidertronmk3-grid",
    "spidertron-builder-grid",
    "immolator-grid"
}

for _, x in ipairs(spidertrons_grids ) do
    local grids = data.raw["equipment-grid"][x].equipment_categories
    if grids then
        grids[#grids+1] = "adv-generator"
    end
end
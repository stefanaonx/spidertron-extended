-- Mods final fixes
require("compatibility.krastorio2-final-fixes")
require("compatibility.bobvehicleequipment-final-fixes")

local SS = settings.startup
local spiders = data.raw["spider-vehicle"]

-- spidertron name -> {setting that disables it, technology, recipe}
local extended_spiders = {
    ["spidertronmk2"]      = { setting = "disable-spidertronmk2",      tech = "spidertronmk2-tech" },
    ["spidertronmk3"]      = { setting = "disable-spidertronmk3",      tech = "spidertronmk3-tech" },
    ["spidertron-builder"] = { setting = "disable-spidertron-builder", tech = "spidertron-builder-tech" },
    ["immolator"]          = { setting = "disable-immolator",          tech = "immolator-tech" },
    ["major-spidertron"]   = { setting = "disable-major-spidertron",   tech = "major-spidertron-tech" },
}

-- all spidertrons are military targets (done last so other mods can't undo it)
if spiders["spidertron"] then
    spiders["spidertron"].is_military_target = true
end
for name in pairs(extended_spiders) do
    if spiders[name] then
        spiders[name].is_military_target = true
    end
end

-- hide technologies and recipes of spidertrons disabled in the startup settings
for name, info in pairs(extended_spiders) do
    if SS[info.setting].value then
        local tech = data.raw.technology[info.tech]
        if tech then
            tech.enabled = false
            tech.hidden = true
        end
        local recipe = data.raw.recipe[name]
        if recipe then
            recipe.hidden = true
        end
    end
end

---@class LuaSettings
local SS = settings.startup --removes the yellow warning lines. and puts them only here.
---@class data.TechnologyPrototype
local Tech = data.raw.technology --put's the yellow warning lines to the top of file.
---@class data.RecipePrototype
local Recipe = data.raw.recipe --put's the yellow warning lines to the top of file.

-- checking if spidertronmk2 is disabled
if SS["disable-spidertronmk2"].value == true then
    Tech["spidertronmk2-tech"].enabled = false
    Tech["spidertronmk2-tech"].hidden = true
    Recipe["spidertronmk2"].hidden = true
end

-- disabling spidertronmk3 if required
if SS["disable-spidertronmk3"].value == true then
    Tech["spidertronmk3-tech"].enabled = false
    Tech["spidertronmk3-tech"].hidden = true
    Recipe["spidertronmk3"].hidden = true
end

-- disabling immolator if required
if SS["disable-spidertron-builder"].value == true then
    Tech["spidertron-builder-tech"].enabled = false
    Tech["spidertron-builder-tech"].hidden = true
    Recipe["spidertron-builder"].hidden = true
end

-- disabling immolator if required
if SS["disable-immolator"].value == true then
    Tech["immolator-tech"].enabled = false
    Tech["immolator-tech"].hidden = true
    Recipe["immolator"].hidden = true
    --DRI["immolator"].hidden = true --not needed
end

-- disabling major-spidertron if required
if SS["disable-major-spidertron"].value == true then
    Tech["major-spidertron-tech"].enabled = false
    Tech["major-spidertron-tech"].hidden = true
    Recipe["major-spidertron"].hidden = true
end

local SS = settings.startup --removes the yellow warning lines. and puts them only here.
local DRT = data.raw.technology --put's the yellow warning lines to the top of file.
local DRR = data.raw.recipe --put's the yellow warning lines to the top of file.
local DRI = data.raw.item --put's the yellow warning lines to the top of file.

-- checking if spidertronmk2 is disabled
if SS["disable-spidertronmk2"].value == true then
    DRT["spidertronmk2-tech"].enabled = false
    DRT["spidertronmk2-tech"].hidden = true
    DRR["spidertronmk2"].hidden = true
    --DRI["spidertronmk2"].hidden = true --not needed
end

-- disabling spidertronmk3 if required
if SS["disable-spidertronmk3"].value == true then
    DRT["spidertronmk3-tech"].enabled = false
    DRT["spidertronmk3-tech"].hidden = true
    DRR["spidertronmk3"].hidden = true
    --DRI["spidertronmk3"].hidden = true --not needed
end

-- disabling immolator if required
if SS["disable-spidertron-builder"].value == true then
    DRT["spidertron-builder-tech"].enabled = false
    DRT["spidertron-builder-tech"].hidden = true
    DRR["spidertron-builder"].hidden = true
    --DRI["spidertron-builder"].hidden = true --not needed
end

-- disabling immolator if required
if SS["disable-immolator"].value == true then
    DRT["immolator-tech"].enabled = false
    DRT["immolator-tech"].hidden = true
    DRR["immolator"].hidden = true
    --DRI["immolator"].hidden = true --not needed
end

-- disabling major-spidertron if required
if SS["disable-major-spidertron"].value == true then
    DRT["major-spidertron-tech"].enabled = false
    DRT["major-spidertron-tech"].hidden = true
    DRR["major-spidertron"].hidden = true
    --DRI["major-spidertron"].hidden = true --not needed
end

-- checking if mod doesn't exit
if not mods["vintage-spidertron"] then
    return
end

-- copied code directly from the mod itself

local util = require("util")

local legraphics = "__vintage-spidertron__/graphics/entity/spidertron/legs/"

local function change_leg(leg_index)
    --local leg = "spidertron"..leg_index.."-leg" -- leaving it for redundancy
    local leg = leg_index

    data.raw["spider-leg"][leg].graphics_set.joint.layers[1].filename = legraphics.."spidertron-legs-knee.png"
    data.raw["spider-leg"][leg].graphics_set.joint.layers[2].filename = legraphics.."spidertron-legs-knee.png"
    data.raw["spider-leg"][leg].graphics_set.joint_shadow.filename = legraphics.."spidertron-legs-knee.png"
    
    data.raw["spider-leg"][leg].graphics_set.lower_part.bottom_end.layers[1].filename = legraphics.."spidertron-legs-lower-end-B.png"
    data.raw["spider-leg"][leg].graphics_set.lower_part.bottom_end.layers[2].filename = legraphics.."spidertron-legs-lower-end-B.png"

    data.raw["spider-leg"][leg].graphics_set.lower_part.middle.layers[1].filename = legraphics.."spidertron-legs-lower-stretchable.png"
    data.raw["spider-leg"][leg].graphics_set.lower_part.middle.layers[2] = util.table.deepcopy(data.raw["spider-leg"][leg].graphics_set.lower_part.middle.layers[1])
    data.raw["spider-leg"][leg].graphics_set.lower_part.middle.layers[2].apply_runtime_tint = true

    data.raw["spider-leg"][leg].graphics_set.lower_part.top_end.layers[1].filename = legraphics.."spidertron-legs-lower-end-A.png"
    data.raw["spider-leg"][leg].graphics_set.lower_part.top_end.layers[2].filename = legraphics.."spidertron-legs-lower-end-A.png"

    data.raw["spider-leg"][leg].graphics_set.lower_part_shadow.bottom_end.filename = legraphics.."spidertron-legs-lower-end-B.png"
    data.raw["spider-leg"][leg].graphics_set.lower_part_shadow.middle.filename = legraphics.."spidertron-legs-lower-stretchable.png"
    data.raw["spider-leg"][leg].graphics_set.lower_part_shadow.top_end.filename = legraphics.."spidertron-legs-lower-end-A.png"
    
    data.raw["spider-leg"][leg].graphics_set.lower_part_water_reflection.bottom_end.filename = legraphics.."spidertron-legs-lower-end-B-water-reflection.png"
    data.raw["spider-leg"][leg].graphics_set.lower_part_water_reflection.top_end.filename = legraphics.."spidertron-legs-lower-end-A-water-reflection.png"
    data.raw["spider-leg"][leg].graphics_set.lower_part_water_reflection.middle.filename = legraphics.."spidertron-legs-lower-stretchable-water-reflection.png"

    data.raw["spider-leg"][leg].graphics_set.upper_part.bottom_end.layers[1].filename = legraphics.."spidertron-legs-upper-end-B.png"
    data.raw["spider-leg"][leg].graphics_set.upper_part.bottom_end.layers[2].filename = legraphics.."spidertron-legs-upper-end-B.png"

    data.raw["spider-leg"][leg].graphics_set.upper_part.middle.layers[1].filename = legraphics.."spidertron-legs-upper-stretchable.png"
    data.raw["spider-leg"][leg].graphics_set.upper_part.middle.layers[2] = util.table.deepcopy(data.raw["spider-leg"][leg].graphics_set.upper_part.middle.layers[1])
    data.raw["spider-leg"][leg].graphics_set.upper_part.middle.layers[2].apply_runtime_tint = true

    data.raw["spider-leg"][leg].graphics_set.upper_part.top_end.layers[1].filename = legraphics.."spidertron-legs-upper-end-A.png"
    data.raw["spider-leg"][leg].graphics_set.upper_part.top_end.layers[2].filename = legraphics.."spidertron-legs-upper-end-A.png"

    data.raw["spider-leg"][leg].graphics_set.upper_part_shadow.bottom_end.filename = legraphics.."spidertron-legs-upper-end-B.png"
    data.raw["spider-leg"][leg].graphics_set.upper_part_shadow.middle.filename = legraphics.."spidertron-legs-upper-stretchable.png"
    data.raw["spider-leg"][leg].graphics_set.upper_part_shadow.top_end.filename = legraphics.."spidertron-legs-upper-end-A.png"
    
    data.raw["spider-leg"][leg].graphics_set.upper_part_water_reflection.bottom_end.filename = legraphics.."spidertron-legs-upper-end-B-water-reflection.png"
    data.raw["spider-leg"][leg].graphics_set.upper_part_water_reflection.top_end.filename = legraphics.."spidertron-legs-upper-end-A-water-reflection.png"
    data.raw["spider-leg"][leg].graphics_set.upper_part_water_reflection.middle.filename = legraphics.."spidertron-legs-upper-stretchable-water-reflection.png"

end

-- i only have 1 leg instead of 8 when creating mk2 and mk3
change_leg("spidertronmk2-leg")
change_leg("spidertronmk3-leg")
change_leg("spidertron-builder-leg")
change_leg("spidertron-immolator-leg")
change_leg("major-spidertron-leg")
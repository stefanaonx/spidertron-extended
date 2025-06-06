-- checking if mod doesn't exists
if not mods["spidertron-deal-with-it"] then
    return
end

local spidey = data.raw["spider-vehicle"]["spidertron"]
local normal_head = spidey.graphics_set.animation

---------------------------------------
-- copying the code from deal_with_it--
---------------------------------------
if not normal_head.layers then
    normal_head = {layers = normal_head}
end

-- this was really smart thinking for the dev at deal_with_it
-- layer name is "front" or "back"
function gen_layer(name, scale)
    return {
        filename = "__spidertron-deal-with-it__/graphics/1x-" .. name .. ".png",
        width = 66,
        height = 70,
        line_length = 8,
        direction_count = 64,
        shift = util.by_pixel(0, -10),
        hr_version = {
            filename = "__spidertron-deal-with-it__/graphics/2x-" .. name .. ".png",
            width = 132,
            height = 138,
            line_length = 8,
            direction_count = 64,
            scale = scale, --0.5 default
            shift = util.by_pixel(0, -10)
        }
    }
end

if not settings.startup["disable-spidertronmk2"].value then
    local scalemk2 = 0.6
    if settings.startup["vanilla-spidertron-size"].value then
        scalemk2 = 0.5
    end
    data.raw["spider-vehicle"]["spidertronmk2"].graphics_set.animation = {
        layers = {
            gen_layer("back", scalemk2),
            data.raw["spider-vehicle"]["spidertronmk2"].graphics_set.animation,
            gen_layer("front", scalemk2)
        }
    }
end

if not settings.startup["disable-spidertronmk3"].value then
    local scalemk3 = 1.0
    if settings.startup["vanilla-spidertron-size"].value then
        scalemk3 = 0.5
    end
    data.raw["spider-vehicle"]["spidertronmk3"].graphics_set.animation = {
        layers = {
            gen_layer("back", scalemk3),
            data.raw["spider-vehicle"]["spidertronmk3"].graphics_set.animation,
            gen_layer("front", scalemk3)
        }
    }
end

if not settings.startup["disable-spidertron-builder"].value then
    local scale_builder = 0.4
    if settings.startup["vanilla-spidertron-size"].value then
        scale_builder = 0.5
    end
    data.raw["spider-vehicle"]["spidertron-builder"].graphics_set.animation = {
        layers = {
            gen_layer("back", scale_builder),
            data.raw["spider-vehicle"]["spidertron-builder"].graphics_set.animation,
            gen_layer("front", scale_builder)
        }
    }
end

if not settings.startup["disable-major-spidertron"].value then
    local scale_ms = 0.6
    if settings.startup["vanilla-spidertron-size"].value then
        scale_ms = 0.5
    end
    data.raw["spider-vehicle"]["major-spidertron"].graphics_set.animation = {
        layers = {
            gen_layer("back", scale_ms),
            data.raw["spider-vehicle"]["major-spidertron"].graphics_set.animation,
            gen_layer("front", scale_ms)
        }
    }
end

if not settings.startup["disable-immolator"].value then
    local scale_immolator = 0.4
    if settings.startup["vanilla-spidertron-size"].value then
        scale_immolator = 0.5
    end
    data.raw["spider-vehicle"]["immolator"].graphics_set.animation = {
        layers = {
            gen_layer("back", scale_immolator),
            data.raw["spider-vehicle"]["immolator"].graphics_set.animation,
            gen_layer("front", scale_immolator)
        }
    }
end
require "util"
local table_deepcopy = util.table.deepcopy

local purifier_fire_smoke = table_deepcopy(data.raw["trivial-smoke"]["fire-smoke"])
purifier_fire_smoke.name = "purifier-fire-smoke"
purifier_fire_smoke.glow_animation.filename = "__spidertron-extended__/graphics/immolator_fire_smoke_glow.png"

local purifier_flame = table_deepcopy(data.raw["fire"]["fire-flame"])
purifier_flame.name = "purifier-flame"
-- tried to change tint but it just woulnd't get the good color
-- for x in pairs(purifier_flame.pictures) do
    -- purifier_flame.pictures[x].tint = {r = 0.17647, g = 0.56863, b = 0.86275, a = 0.5}
    -- --purifier_flame.pictures[x].tint = {r = 0, g = 0, b = 1, a = 1}
-- end
-- gotta love the order is exactly rotated
-- for x in pairs(purifier_flame.pictures) do
    -- purifier_flame.pictures[x].filename = "__spidertron-extended__/graphics/purifier_flame/immolator_fire_flame_"..tostring(x)..".png"
    -- --purifier_flame.pictures[x].tint = {r = 0, g = 0, b = 1, a = 1}
-- end
-- gonna put a proper for in this at some point
purifier_flame.pictures[1].filename = "__spidertron-extended__/graphics/purifier_flame/spex-fire-flame-01.png"
purifier_flame.pictures[2].filename = "__spidertron-extended__/graphics/purifier_flame/spex-fire-flame-02.png"
purifier_flame.pictures[3].filename = "__spidertron-extended__/graphics/purifier_flame/spex-fire-flame-03.png"
purifier_flame.pictures[4].filename = "__spidertron-extended__/graphics/purifier_flame/spex-fire-flame-04.png"
purifier_flame.pictures[5].filename = "__spidertron-extended__/graphics/purifier_flame/spex-fire-flame-01.png"
purifier_flame.pictures[6].filename = "__spidertron-extended__/graphics/purifier_flame/spex-fire-flame-02.png"
purifier_flame.pictures[7].filename = "__spidertron-extended__/graphics/purifier_flame/spex-fire-flame-03.png"
purifier_flame.pictures[8].filename = "__spidertron-extended__/graphics/purifier_flame/spex-fire-flame-04.png"

purifier_flame.initial_lifetime = 120 -- default 120
purifier_flame.lifetime_increase_by = 600 -- default 150
purifier_flame.damage_per_tick = {
    amount = 1, -- 0.2166666666666667 default
    type = "fire"
}
purifier_flame.smoke[1].name = "purifier-fire-smoke"


data:extend{
    purifier_fire_smoke,
    purifier_flame
}
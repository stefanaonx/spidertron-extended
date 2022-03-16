-- checking if mod doesn't exists
if not mods["IndustrialRevolution"] then
    return
end

data.raw['beam']['weaver-repair-beam'].head.filename = "__spidertron-extended__/graphics/spidertron_builder_laser_body_HD_1.png"

data.raw['beam']['weaver-repair-beam'].tail.filename = "__spidertron-extended__/graphics/spidertron_builder_laser_end_HD_1.png"
data.raw['beam']['weaver-repair-beam'].tail.width = 55
data.raw['beam']['weaver-repair-beam'].tail.height = 31
data.raw['beam']['weaver-repair-beam'].tail.frame_count = 16

data.raw['beam']['weaver-repair-beam'].body.filename = "__spidertron-extended__/graphics/spidertron_builder_laser_body_HD_1.png"
data.raw['beam']['weaver-repair-beam'].body.width = 16
data.raw['beam']['weaver-repair-beam'].body.height = 12
data.raw['beam']['weaver-repair-beam'].body.frame_count = 32

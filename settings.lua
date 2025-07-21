-- vanilla grid size defaults
local vanilla_grid_width, vanilla_grid_height, vanilla_inv_size, vanilla_hp = 10, 6, 80, 3000
-- default is 10x6, 80 inv size, 3000 hp
-- default for SE is 10x6, 80 inv size, 3000 hp
if mods["space-exploration"] then
    vanilla_grid_width = 10
    vanilla_grid_height = 6
    vanilla_inv_size = 80
    vanilla_hp = 3000
end

-- I need to modify this if i want to ifs for checking if mods are enabled
-- and maybe make it so that it's more modular as well
data:extend({
    -- vanilla sizes
    {
        type = "bool-setting",
        name = "vanilla-spidertron-size",
        setting_type = "startup",
        default_value = false,
        order = "a10"
    },
    -- grid sizes for vanilla
    {
        type = "int-setting",
        name = "vanilla-spidertron-width",
        setting_type = "startup",
        minimum_value = 0,
        default_value = vanilla_grid_width,
        order = "a11"
    },
    {
        type = "int-setting",
        name = "vanilla-spidertron-height",
        setting_type = "startup",
        minimum_value = 0,
        default_value = vanilla_grid_height,
        order = "a12"
    },
    -- inventory size for vanilla
    {
        type = "int-setting",
        name = "vanilla-spidertron-invsize",
        setting_type = "startup",
        minimum_value = 0,
        default_value = vanilla_inv_size,
        order = "a13"
    },
    -- hp for vanilla
    {
        type = "int-setting",
        name = "vanilla-spidertron-hp",
        setting_type = "startup",
        minimum_value = 1,
        default_value = vanilla_hp,
        order = "a14"
    },
    -- to disable spidertronmk2
    {
        type = "bool-setting",
        name = "disable-spidertronmk2",
        setting_type = "startup",
        default_value = false,
        order = "a20"
    },
    -- grid sizes for mk2
    {
        type = "int-setting",
        name = "spidertronmk2-width",
        setting_type = "startup",
        minimum_value = 10,
        default_value = 20,
        order = "a21"
    },
    {
        type = "int-setting",
        name = "spidertronmk2-height",
        setting_type = "startup",
        minimum_value = 6,
        default_value = 8,
        order = "a22"
    },
    -- inventory size for mk2
    {
        type = "int-setting",
        name = "spidertronmk2-invsize",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 100,
        order = "a23"
    },
    -- hp for mk2
    {
        type = "int-setting",
        name = "spidertronmk2-hp",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 5000,
        order = "a24"
    },
    -- to disable spidertronmk3
    {
        type = "bool-setting",
        name = "disable-spidertronmk3",
        setting_type = "startup",
        default_value = false,
        order = "a30"
    },
    -- grid sizes for mk3
    {
        type = "int-setting",
        name = "spidertronmk3-width",
        setting_type = "startup",
        minimum_value = 10,
        default_value = 30,
        order = "a32"
    },
    {
        type = "int-setting",
        name = "spidertronmk3-height",
        setting_type = "startup",
        minimum_value = 6,
        default_value = 10,
        order = "a33"
    },
    -- inventory size for mk3
    {
        type = "int-setting",
        name = "spidertronmk3-invsize",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 120,
        order = "a34"
    },
    -- hp for mk3
    {
        type = "int-setting",
        name = "spidertronmk3-hp",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 8000,
        order = "a35"
    },
    {
        type = "bool-setting",
        name = "disable-health-regenmk3",
        setting_type = "startup",
        default_value = false,
        order = "a36"
    },
    -- to disable spidertron builder
    {
        type = "bool-setting",
        name = "disable-spidertron-builder",
        setting_type = "startup",
        default_value = false,
        order = "b10"
    },
    -- grid sizes for spider-builder
    {
        type = "int-setting",
        name = "spidertron-builder-width",
        setting_type = "startup",
        minimum_value = 10,
        default_value = 16,
        order = "b11"
    },
    {
        type = "int-setting",
        name = "spidertron-builder-height",
        setting_type = "startup",
        minimum_value = 6,
        default_value = 8,
        order = "b12"
    },
    -- inventory size for spidertron-builder
    {
        type = "int-setting",
        name = "spidertron-builder-invsize",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 240,
        order = "b13"
    },
    -- hp for spidertron-builder
    {
        type = "int-setting",
        name = "spidertron-builder-hp",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 3000,
        order = "b14"
    },
    -- healing beam for spidertron-builder
    {
        type = "int-setting",
        name = "spidertron-builder-healing-beam-ammount",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 10,
        order = "b15"
    },
    {
        type = "bool-setting",
        name = "disable-spidertron-builder-reaper-beam",
        setting_type = "startup",
        default_value = false,
        order = "b16"
    },
	    -- trash inventory size for spidertron-builder
    {
        type = "int-setting",
        name = "spidertron-builder-trashsize",
        setting_type = "startup",
        minimum_value = 0,
        default_value = 20,
        maximum_value = 100,
        order = "b17"
    },
    -- immolator settings
    {
        type = "bool-setting",
        name = "disable-immolator",
        setting_type = "startup",
        default_value = false,
        order = "c0"
    },
    {
        type = "int-setting",
        name = "immolator-width",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 10,
        order = "c1"
    },
    {
        type = "int-setting",
        name = "immolator-height",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 10,
        order = "c12"
    },
    {
        type = "int-setting",
        name = "immolator-invsize",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 80,
        order = "c13"
    },
    {
        type = "int-setting",
        name = "immolator-hp",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 3000,
        order = "c14"
    },
    {
        type = "bool-setting",
        name = "disable-immolator-fire",
        setting_type = "startup",
        default_value = false,
        order = "c15"
    },
    -- major-spidertron settings
    {
        type = "bool-setting",
        name = "disable-major-spidertron",
        setting_type = "startup",
        default_value = false,
        order = "d001"
    },
    {
        type = "int-setting",
        name = "major-spidertron-width",
        setting_type = "startup",
        minimum_value = 10,
        default_value = 20,
        order = "d002"
    },
    {
        type = "int-setting",
        name = "major-spidertron-height",
        setting_type = "startup",
        minimum_value = 6,
        default_value = 8,
        order = "d003"
    },
    {
        type = "int-setting",
        name = "major-spidertron-invsize",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 90,
        order = "d004"
    },
    {
        type = "int-setting",
        name = "major-spidertron-hp",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 5000,
        order = "d005"
    },
    {
        type = "bool-setting",
        name = "disable-artillery-major-spidertron",
        setting_type = "startup",
        default_value = false,
        order = "d001"
    },
})

if mods["bobvehicleequipment"] then
    data:extend({
        --New selective setting needs more to test the option to pysicly work with bobs.
        {
            type = "string-setting",
            name = "s-extended-bob-vehicle-equipments",
            setting_type = "startup",
            default_value = "disable-bobs-equipment",
            allowed_values = {"enable-bobs-all-equipment-spidertrons", "disable-bobs-vehicle-equipment-vanilla", "disable-bobs-equipment"},
            order = "x1"
        },
        --[[Someday make this into some kind of selector option instead of sperate settings.]]
        -- Bobs equipment
        --[[
        {
            type = "bool-setting",
            name = "disable-bobs-equipment",
            setting_type = "startup",
            default_value = false,
            order = "m0"
        },
        -- Disable Bobs equipment on vanilla
        {
            type = "bool-setting",
            name = "disable-bobs-vehicle-equipment-vanilla",
            setting_type = "startup",
            default_value = false,
            order = "m01"
        },
        -- Bobs equipment + vehicle equipment
        {
            type = "bool-setting",
            name = "enable-bobs-all-equipment-spidertrons",
            setting_type = "startup",
            default_value = false,
            order = "m02"
        },
        ]]
    })
end

if mods["Krastorio2"] then
    data:extend({
        {
            type = "bool-setting",
            name = "disable-krastorio-spidertron-burner",
            setting_type = "startup",
            default_value = false,
            order = "m1"
        }
    })
end

data:extend({
    {
        type = "bool-setting",
        name = "enable-spidertron-extended-burner",
        setting_type = "startup",
        default_value = false,
        order = "m1"
    }
})
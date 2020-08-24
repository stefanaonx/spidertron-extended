data:extend({
    -- vanilla sizes
	{
		type = "bool-setting",
		name = "vanilla-spidertron-size",
		setting_type = "startup",
		default_value = false,
		order = "a1"
	},
    -- grid sizes for mk2
    {
		type = "int-setting",
		name = "spidertronmk2-width",
		setting_type = "startup",
        minimum_value = 10,
        default_value = 20,
		order = "a3"
	},
    {
		type = "int-setting",
		name = "spidertronmk2-height",
		setting_type = "startup",
        minimum_value = 6,
        default_value = 8,
		order = "a4"
	},
    -- grid sizes for mk3
    {
		type = "int-setting",
		name = "spidertronmk3-width",
		setting_type = "startup",
        minimum_value = 10,
        default_value = 30,
		order = "a6"
	},
    {
		type = "int-setting",
		name = "spidertronmk3-height",
		setting_type = "startup",
        minimum_value = 6,
        default_value = 10,
		order = "a7"
	},
    {
		type = "bool-setting",
		name = "disable-health-regenmk3",
		setting_type = "startup",
		default_value = false,
		order = "a8"
	},
    {
		type = "bool-setting",
		name = "disable-krastorio-spidertron-burner",
		setting_type = "startup",
		default_value = false,
		order = "c5"
	},
    -- to disable spidertron builder
    {
		type = "bool-setting",
		name = "disable-spidertron-builder",
		setting_type = "startup",
		default_value = false,
		order = "b1"
	},
    -- to disable spidertronmk2
    {
		type = "bool-setting",
		name = "disable-spidertronmk2",
		setting_type = "startup",
		default_value = false,
		order = "a2"
	},
    -- to disable spidertronmk3
    {
		type = "bool-setting",
		name = "disable-spidertronmk3",
		setting_type = "startup",
		default_value = false,
		order = "a5"
	},
    -- to disable spidertronmk4
    {
		type = "bool-setting",
		name = "disable-spidertronmk4",
		setting_type = "startup",
		default_value = false,
		order = "c6"
	},
	-- grid sizes for spider-builder
    {
		type = "int-setting",
		name = "spidertron-builder-width",
		setting_type = "startup",
        minimum_value = 10,
        default_value = 16,
		order = "b2"
	},
    {
		type = "int-setting",
		name = "spidertron-builder-height",
		setting_type = "startup",
        minimum_value = 6,
        default_value = 8,
		order = "b3"
	},
    {
		type = "bool-setting",
		name = "disable-bobs-equipment",
		setting_type = "startup",
		default_value = false,
		order = "c7"
	}
})
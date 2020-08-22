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
		order = "a2"
	},
    {
		type = "int-setting",
		name = "spidertronmk2-height",
		setting_type = "startup",
        minimum_value = 6,
        default_value = 8,
		order = "a3"
	},
    -- grid sizes for mk3
    {
		type = "int-setting",
		name = "spidertronmk3-width",
		setting_type = "startup",
        minimum_value = 10,
        default_value = 30,
		order = "a4"
	},
    {
		type = "int-setting",
		name = "spidertronmk3-height",
		setting_type = "startup",
        minimum_value = 6,
        default_value = 10,
		order = "a5"
	},
    -- disable-health-regen mk3, don't know how to make it yet
    {
		type = "bool-setting",
		name = "disable-health-regenmk3",
		setting_type = "startup",
		default_value = false,
		order = "a6"
	},
    {
		type = "bool-setting",
		name = "disable-krastorio-spidertron-burner",
		setting_type = "startup",
		default_value = false,
		order = "a7"
	}
})
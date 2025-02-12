local simulations = require("__spidertron-extended__/prototypes/tips-and-tricks-simulations")

local spidertron_extended_tips = {
    type = "tips-and-tricks-item",
    name = "spidertron-extended",
    category = "spidertron-extended",
    order = "s",
    trigger =
    {
        type = "unlock-recipe",
        recipe = "spidertronmk2"
    },
    skip_trigger =
    {
      type = "enter-vehicle",
      vehicle = "spidertronmk2",
      match_type_only = true,
      count = 5
    },
    simulation = {} --simulations.spidertron_extended
}

data:extend{
    spidertron_extended_tips
}
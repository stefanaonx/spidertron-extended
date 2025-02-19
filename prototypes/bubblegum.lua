require "util"
require "__spidertron-extended__.resistance_data"

local table_deepcopy = util.table.deepcopy

-- might need to put these in separate files

-- create remnants to be used by the particle
-- function copied from base/prototypes/entity/remnants.lua
function make_rotated_animation_variations_from_sheet(variation_count, sheet) --makes remnants work with more than 1 variation
  local result = {}

  local function set_y_offset(variation, i)
    local frame_count = variation.frame_count or 1
    local line_length = variation.line_length or frame_count
    if (line_length < 1) then
      line_length = frame_count
    end

    local height_in_frames = math.floor((frame_count * variation.direction_count + line_length - 1) / line_length)
    -- if (height_in_frames ~= 1) then
    --   log("maybe broken sheet: h=" .. height_in_frames .. ", vc=" .. variation_count .. ", " .. variation.filename)
    -- end
    variation.y = variation.height * (i - 1) * height_in_frames
  end

  for i = 1,variation_count do
    local variation = util.table.deepcopy(sheet)

    if variation.layers then
      for _, layer in pairs(variation.layers) do
        set_y_offset(layer, i)
      end
    else
      set_y_offset(variation, i)
    end

    table.insert(result, variation)
  end
 return result
end

local major_spidertron_bubblegum_remnants = table_deepcopy(data.raw["corpse"]["defender-remnants"])
major_spidertron_bubblegum_remnants.name = "major-spidertron-bubblegum-remnants"
major_spidertron_bubblegum_remnants.animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__spidertron-extended__/graphics/major-spidertron-bubblegum-remnants.png",
      line_length = 1,
      width = 98,
      height = 94,
      direction_count = 1,
      shift = util.by_pixel(0.5, 0.5),
      scale = 0.5
    })
data:extend{
    major_spidertron_bubblegum_remnants
}

-- copy the existing particles instead of creating them
local major_spidertron_bubblegum_particle = table_deepcopy(data.raw["optimized-particle"]["defender-dying-particle"])
major_spidertron_bubblegum_particle.name = "major-spidertron-bubblegum-dying-particle"
-- in particle add remnants
major_spidertron_bubblegum_particle.ended_on_ground_trigger_effect[1].entity_name = "major-spidertron-bubblegum-remnants"
data:extend{
    major_spidertron_bubblegum_particle
}

-- creating explosion for bubblegum -- not sure if i really need this
local major_spidertron_bubblegum_explosion = table_deepcopy(data.raw["explosion"]["defender-robot-explosion"])
major_spidertron_bubblegum_explosion.name = "major-spidertron-bubblegum-explosion"
data:extend{
    major_spidertron_bubblegum_explosion
}

-- major spidertron BUBBLEGUM
local major_spidertron_bubblegum = table_deepcopy(data.raw["combat-robot"]["defender"])
major_spidertron_bubblegum.name = "major-spidertron-bubblegum"
--major_spidertron_bubblegum.idle = robot_animations.defender.idle
major_spidertron_bubblegum.idle.layers[1].filename = "__spidertron-extended__/graphics/major-spidertron-bubblegum-robot.png"
--major_spidertron_bubblegum.in_motion = robot_animations.defender.in_motion
major_spidertron_bubblegum.in_motion.layers[1].filename = "__spidertron-extended__/graphics/major-spidertron-bubblegum-robot.png"
major_spidertron_bubblegum.max_health = 500 -- 60 on normal defender
major_spidertron_bubblegum.attack_parameters.range = 30 -- 15 on normal defender
major_spidertron_bubblegum.attack_parameters.ammo_type.action.action_delivery.target_effects[2].damage.amount = 24 -- 8 on normal defender
major_spidertron_bubblegum.attack_parameters.cooldown = 10 -- 20 default
-- creates particle for major spidertron
-- make_robot_particle(major_spidertron_bubblegum)
major_spidertron_bubblegum.dying_trigger_effect[1].particle_id = "major-spidertron-bubblegum-dying-particle"
major_spidertron_bubblegum.resistances = major_spidertron_bubblegum_resistances
-- for getting the destroyed version of bubblegum -- not sure if i really need this
major_spidertron_bubblegum.dying_explosion = "major-spidertron-bubblegum-explosion"
major_spidertron_bubblegum.destroy_action.action_delivery.source_effects[1].particle_name = "major-spidertron-bubblegum-dying-particle"
-- testing
major_spidertron_bubblegum.dying_trigger_effect[1].particle_name = "major-spidertron-bubblegum-dying-particle"
data:extend{
   major_spidertron_bubblegum
}

-- create projectile for when it is spawned
local major_spidertron_bubblegum_projectile = table_deepcopy(data.raw["projectile"]["defender-capsule"])
major_spidertron_bubblegum_projectile.name = "major-spidertron-bubblegum-capsule"
major_spidertron_bubblegum_projectile.action.action_delivery.target_effects[1].entity_name = "major-spidertron-bubblegum"
data:extend{
    major_spidertron_bubblegum_projectile
}

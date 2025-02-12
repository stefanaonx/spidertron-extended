local simulations = {}

simulations.spidertron_extended = {
  game_view_settings = { default_show_value = false, show_controller_gui = true, show_quickbar = true, update_entity_selection = true },
  init =
  [[
    require("__core__/lualib/story")
    game.simulation.active_quickbars = 1
    player = game.simulation.create_test_player{name = "big K"}
    player.character.teleport{0, 4}
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    player.set_quick_bar_slot(1,'burner-inserter')

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqV1FFqhDAQBuC7zHNcTDQac5WlFHWnJaBRklgq4t0bXdoui9LOYzTz+Tsks0DTTTg6YwPoBUw7WA/6uoA377butmdhHhE0mIA9MLB1v62Cq60fBxeSBrsAKwNjb/gJmq/sz2IfBovJ2+Rs3eJDrVhfGKANJhi8p9gX86ud+gZdxE8IBuPgY9Vgt29GKREpgxl0tW5xnhTxb4WrcyU768VBmPIid4jzi4y/ezMO2/uG/EDOCXJBkiVBliS5IMg5SS4JckaSFUEWJLn6kZt4ttAlxnp0Ib46OqnfdPpMqwOap4TUnJSacwKd0mhB6AhXtI4QbiKvaLEJV/E39QEd59o+AvXDuGXwgc7vG4TiucpkURS5lGUcN19DUdJu",
      position = {-6,0},
    }

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            player.insert("transport-belt")
            player.insert("stone-furnace")
            player.insert("burner-inserter")
          end,
          condition = story_elapsed_check(1)
        },
        { condition = function() return game.simulation.move_cursor({position = {-1, -1}}) end },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.control_press{control = "pipette", notify = true} end
        },
        { condition = story_elapsed_check(0.25) },
        { condition = function() return game.simulation.move_cursor({position = {1, -1}}) end},
        {
          init = function() game.simulation.control_down{control = "build", notify = false} end,
          condition = function() return game.simulation.move_cursor({position = {3, -1}}) end,
          action = function() game.simulation.control_up{control = "build"} end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.clear_cursor() end
        },
        { condition = story_elapsed_check(0.25),
          action = function()
            if player.input_method ~= defines.input_method.game_controller then
              story_jump_to(storage.story, "inserter-mouse-branch")
            end
          end
        },
        -- controller branch
        {
          action = function() player.opened = player end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "recipe-slot", data = "burner-inserter"})
            return game.simulation.move_cursor({position = target})
          end
        },
        { condition = story_elapsed_check(0.25),
          action = function()
            story_jump_to(storage.story, "inserter-pipette")
          end
        },
        -- mouse branch
        { action = function() end }, --called by story_jump_to(storage.story, "inserter-mouse-branch")
        {
          name = "inserter-mouse-branch",
          condition = function()
            local target = game.simulation.get_widget_position({type = "quickbar-slot", data = "burner-inserter"})
            return game.simulation.move_cursor({position = target})
          end
        },
        { condition = story_elapsed_check(0.25) },
        -- branch join
        {
          name = "inserter-pipette",
          action = function()
            game.simulation.control_press{control = "pipette", notify = true}
            game.simulation.camera_player_cursor_direction = defines.direction.south
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = nil end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function() return game.simulation.move_cursor({position = {0.5, 0.5}}) end,
          action = function() game.simulation.control_press{control = "build", notify = false} end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function() return game.simulation.move_cursor({position = {2.5, 0.5}}) end,
          action = function() game.simulation.control_press{control = "build", notify = false} end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.clear_cursor() end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = player end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "recipe-slot", data = "transport-belt"})
            return game.simulation.move_cursor({position = target})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action =
            function() game.simulation.control_press{control = "pipette", notify = true}
            game.simulation.camera_player_cursor_direction = defines.direction.east
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = nil end
        },
        { condition = story_elapsed_check(0.25) },
        { condition = function() return game.simulation.move_cursor({position = {-0.5, 1.5}}) end},
        {
          init = function() game.simulation.control_down{control = "build", notify = false} end,
          condition = function() return game.simulation.move_cursor({position = {2.5, 1.5}}) end,
          action = function() game.simulation.control_up{control = "build"} end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.clear_cursor() end
        },
        { condition = story_elapsed_check(0.25) },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(1),
          action = function()
            for k, v in pairs (game.surfaces[1].find_entities_filtered{area = {{0, -2}, {3,  2}}}) do
              v.destroy()
            end
            local belt = game.surfaces[1].find_entity("transport-belt", {-0.5, 1.5})
            belt.destroy()
            player.character.clear_items_inside()
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}
local simulations = {}

simulations.spidertron_extended = {
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-22, -11}, {22, 11}}
    game.simulation.camera_player_cursor_position = player.position

    spider = game.surfaces[1].create_entity{name = "spidertron", position = {-8, 1.5}, force = "player"}

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(1),
        },
        {
          condition = function() return game.simulation.move_cursor({position = {player.position.x, player.position.y - 2.5}}) end,
          action = function() game.simulation.control_press{control = "give-spidertron-remote", notify = true} end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            if player.input_method ~= defines.input_method.game_controller then
              story_jump_to(storage.story, "add-spidertron-mouse-branch")
            end
          end
        },
        -- controller branch
        {
          condition = function() return game.simulation.move_cursor({position = {spider.position.x - 1.5, spider.position.y - 3}}) end,
          action = function() game.simulation.control_press{control = "select-for-blueprint", notify = true} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {spider.position.x + 1.5, spider.position.y}}) end,
          action = function() game.simulation.control_press{control = "select-for-blueprint", notify = true} end
        },
        {
          action = function() story_jump_to(storage.story, "add-spidertron-join-branch") end
        },
        -- mouse branch
        { action = function() end },
        {
          name = "add-spidertron-mouse-branch",
          condition = function() return game.simulation.move_cursor({position = {spider.position.x, spider.position.y - 1.5}}) end,
          action = function() game.simulation.control_press{control = "select-for-blueprint", notify = true} end
        },
        -- branch join
        { action = function() end },
        {
          name = "add-spidertron-join-branch",
          condition = story_elapsed_check(1)
        },
        {
          condition = function() return game.simulation.move_cursor({position = {8, 1.5}}) end,
          action = function() game.simulation.control_press{control = "use-item", notify = true} end
        },
        { condition = story_elapsed_check(2) },
        {
          condition = function() return game.simulation.move_cursor({position = {8, -5.5}, speed = 0.35}) end,
          action = function() game.simulation.control_press{control = "alternative-use-item", notify = true} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {-8, -5.5}, speed = 0.35}) end,
          action = function() game.simulation.control_press{control = "alternative-use-item", notify = true} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {-8, 1.5}, speed = 0.35}) end,
          action = function() game.simulation.control_press{control = "alternative-use-item", notify = true} end
        },
        {
          condition = story_elapsed_check(3.2),
          action = function()
            if player.input_method ~= defines.input_method.game_controller then
              story_jump_to(storage.story, "remove-spidertron-mouse-branch")
            end
          end
        },
        -- controller branch
        {
          condition = function() return game.simulation.move_cursor({position = {spider.position.x - 1.5, spider.position.y - 3}}) end,
          action = function() game.simulation.control_press{control = "deselect", notify = true} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {spider.position.x + 1.5, spider.position.y}}) end,
          action = function() game.simulation.control_press{control = "select-for-blueprint", notify = true} end
        },
        {
          action = function() story_jump_to(storage.story, "remove-spidertron-join-branch") end
        },
        -- mouse branch
        { action = function() end },
        {
          name = "remove-spidertron-mouse-branch",
          condition = function() return game.simulation.move_cursor({position = {spider.position.x, spider.position.y - 1.5}}) end,
          action = function() game.simulation.control_press{control = "deselect", notify = true} end
        },
        -- branch join
        { action = function() end },
        {
          name = "remove-spidertron-join-branch",
          condition = story_elapsed_check(1)
        },
        { condition = function() return game.simulation.move_cursor({position = player.position}) end },
        {
          condition = story_elapsed_check(3),
          action = function()
            player.clear_cursor()
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}
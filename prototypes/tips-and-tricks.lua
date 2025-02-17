--local simulations = require("__spidertron-extended__/prototypes/tips-and-tricks-simulations")
local spidertron_extended = {
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 0})
    game.simulation.camera_player = player
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-22, -11}, {22, 11}}
    game.simulation.camera_player_cursor_position = player.position
    spider = game.surfaces[1].create_entity{name = "spidertronmk2", position = {-15, -2}, force = "player", color = {1.0, 0, 0, 0.5}}
    spider = game.surfaces[1].create_entity{name = "spidertronmk3", position = {-5, -2}, force = "player", color = {0.5, 0, 0.5, 0.5}}
    spider = game.surfaces[1].create_entity{name = "spidertron-builder", position = {5, -2}, force = "player", color = {1, 1, 1, 0.5}}
    spider = game.surfaces[1].create_entity{name = "immolator", position = {-10, 8}, force = "player", color = {0.17647, 0.56863, 0.86275, 0.5}}
    spider = game.surfaces[1].create_entity{name = "major-spidertron", position = {0, 8}, force = "player", color = {0.2941, 0.3255, 0.1255, 0.5}}

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(1),
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}
local spidertron_extended_mk2 = {
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-22, -11}, {22, 11}}
    game.simulation.camera_player_cursor_position = player.position
    spider = game.surfaces[1].create_entity{name = "spidertronmk2", position = {-8, 1.5}, force = "player", color={1.0, 0, 0, 0.5}}

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
local spidertron_extended_mk3 = {
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-22, -11}, {22, 11}}
    game.simulation.camera_player_cursor_position = player.position
    spider = game.surfaces[1].create_entity{name = "spidertronmk3", position = {-8, 1.5}, force = "player", color={0.5, 0, 0.5, 0.5}}

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
local spidertron_extended_builder = {
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-22, -11}, {22, 11}}
    game.simulation.camera_player_cursor_position = player.position
    spider = game.surfaces[1].create_entity{name = "spidertron-builder", position = {-8, 1.5}, force = "player", color={1, 1, 1, 0.5}}

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
local spidertron_extended_immolator = {
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-22, -11}, {22, 11}}
    game.simulation.camera_player_cursor_position = player.position
    spider = game.surfaces[1].create_entity{name = "immolator", position = {-8, 1.5}, force = "player", color={0.17647, 0.56863, 0.86275, 0.5}}

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
local spidertron_extended_major = {
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "big k"}
    player.teleport({0, 2.5})
    game.simulation.camera_player = player
    game.simulation.camera_zoom = 1
    game.surfaces[1].build_checkerboard{{-22, -11}, {22, 11}}
    game.simulation.camera_player_cursor_position = player.position
    spider = game.surfaces[1].create_entity{name = "major-spidertron", position = {-8, 1.5}, force = "player", color = {0.2941, 0.3255, 0.1255, 0.5}}

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


data:extend({
    {
        type = "tips-and-tricks-item-category",
        name = "spidertron-extended",
        order = "s-[spidertron]"
    },
    {
        type = "tips-and-tricks-item",
        name = "spidertron-extended",
        category = "spidertron-extended",
        order = "a",
        trigger =
        {
            type = "unlock-recipe",
            recipe = "spidertron"
        },
        skip_trigger =
        {
          type = "enter-vehicle",
          vehicle = "spidertron",
          match_type_only = true,
          count = 5
        },
        --simulation = {} --simulations.spidertron_extended
        dependencies = {"spidertron-extended"},
        simulation = spidertron_extended
    },
    {
        type = "tips-and-tricks-item",
        name = "spidertronmk2",
        tag = "[entity=spidertronmk2]",
        category = "spidertron-extended",
        order = "b",
        indent = 1,
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
        dependencies = {"spidertron-extended"},
        simulation = spidertron_extended_mk2
    },
    {
        type = "tips-and-tricks-item",
        name = "spidertronmk3",
        tag = "[entity=spidertronmk3]",
        category = "spidertron-extended",
        order = "c",
        indent = 1,
        trigger =
        {
            type = "unlock-recipe",
            recipe = "spidertronmk3"
        },
        skip_trigger =
        {
          type = "enter-vehicle",
          vehicle = "spidertronmk3",
          match_type_only = true,
          count = 5
        },
        dependencies = {"spidertron-extended"},
        simulation = spidertron_extended_mk3
    },
    {
        type = "tips-and-tricks-item",
        name = "spidertron-builder",
        tag = "[entity=spidertron-builder]",
        category = "spidertron-extended",
        order = "d",
        indent = 1,
        trigger =
        {
            type = "unlock-recipe",
            recipe = "spidertron-builder"
        },
        skip_trigger =
        {
          type = "enter-vehicle",
          vehicle = "spidertron-builder",
          match_type_only = true,
          count = 5
        },
        dependencies = {"spidertron-extended"},
        simulation = spidertron_extended_builder
    },
    {
        type = "tips-and-tricks-item",
        name = "immolator",
        tag = "[entity=immolator]",
        category = "spidertron-extended",
        order = "e",
        indent = 1,
        trigger =
        {
            type = "unlock-recipe",
            recipe = "immolator"
        },
        skip_trigger =
        {
          type = "enter-vehicle",
          vehicle = "immolator",
          match_type_only = true,
          count = 5
        },
        dependencies = {"spidertron-extended"},
        simulation = spidertron_extended_immolator
    },
    {
        type = "tips-and-tricks-item",
        name = "major-spidertron",
        tag = "[entity=major-spidertron]",
        category = "spidertron-extended",
        order = "f",
        indent = 1,
        trigger =
        {
            type = "unlock-recipe",
            recipe = "major-spidertron"
        },
        skip_trigger =
        {
          type = "enter-vehicle",
          vehicle = "major-spidertron",
          match_type_only = true,
          count = 5
        },
        dependencies = {"spidertron-extended"},
        simulation = spidertron_extended_major
    }
})
return {
  "bngarren/checkmate.nvim",
  ft = "markdown",
  cmd = "Checkmate",
  opts = {
    keys = {
      ["<leader>tt"] = {
        rhs = "<cmd>Checkmate toggle<CR>",
        desc = "Toggle todo item",
        modes = { "n", "v" },
      },
      ["<leader>tu"] = {
        rhs = "<cmd>Checkmate uncheck<CR>",
        desc = "Set todo item as unchecked (not done)",
        modes = { "n", "v" },
      },
      ["<leader>tn"] = {
        rhs = "<cmd>Checkmate create<CR>",
        desc = "Create todo item",
        modes = { "n", "v" },
      },
      ["<leader>tv"] = {
        rhs = "<cmd>Checkmate metadata select_value<CR>",
        desc = "Update the value of a metadata tag under the cursor",
        modes = { "n" },
      },
      ["<leader>t]"] = {
        rhs = "<cmd>Checkmate metadata jump_next<CR>",
        desc = "Move cursor to next metadata tag",
        modes = { "n" },
      },
      ["<leader>t["] = {
        rhs = "<cmd>Checkmate metadata jump_previous<CR>",
        desc = "Move cursor to previous metadata tag",
        modes = { "n" },
      },
      ["<leader>th"] = {
        rhs = function()
          require("checkmate").toggle("on_hold")
        end,
        desc = "Set todo item as hold",
        modes = { "n", "v" },
      },
    },
    todo_states = {
      -- we don't need to set the `markdown` field for `unchecked` and `checked` as these can't be overriden
      ---@diagnostic disable-next-line: missing-fields
      unchecked = {
        marker = "[ ]",
        order = 1,
      },
      ---@diagnostic disable-next-line: missing-fields
      checked = {
        marker = "[x]",
        order = 2,
      },

      -- Custom states
      on_hold = {
        marker = "[-]",
        markdown = "-", -- Saved as `- [/]`
        type = "inactive", -- Ignored in counts
        order = 100,
      },
    },
    metadata = {
      pms = {
        style = { fg = "#4343f9" },
        get_value = function()
          return "pms_number"
        end,
        key = "<leader>tP",
        sort_order = 5,
        jump_to_on_insert = "value",
        select_on_insert = true,
      },
      fixer = {
        style = function(context)
          local value = context.value:lower()
          if value == "gy" then
            return { fg = "#b20ffd" }
          elseif value == "zdy" then
            return { fg = "#ffb86c" }
          elseif value == "sl" then
            return { fg = "#8be9fd" }
          elseif value == "pwh" then
            return { fg = "#50fa7b" }
          elseif value == "lh" then
            return { fg = "#bd93f9" }
          elseif value == "wyx" then
            return { fg = "#f1fa8c" }
          elseif value == "lhx" then
            return { fg = "#ff79c6" }
          elseif value == "xyb" then
            return { fg = "#7062a4" }
          elseif value == "lyn" then
            return { fg = "#ff6e6e" }
          else -- fallback
            return { fg = "#b20ffd" }
          end
        end,
        get_value = function()
          return "gy"
        end,
        choices = function()
          return { "gy", "zdy", "sl", "pwh", "lh", "wyx", "lhx", "xyb", "lyn" }
        end,
        key = "<leader>tf",
        sort_order = 8,
        jump_to_on_insert = "value",
      },
      -- Example: A @priority tag that has dynamic color based on the priority value
      priority = {
        style = function(context)
          local value = context.value:lower()
          if value == "high" then
            return { fg = "#ff5555", bold = true }
          elseif value == "medium" then
            return { fg = "#ffb86c" }
          elseif value == "low" then
            return { fg = "#8be9fd" }
          else -- fallback
            return { fg = "#8be9fd" }
          end
        end,
        get_value = function()
          return "medium" -- Default priority
        end,
        choices = function()
          return { "low", "medium", "high" }
        end,
        key = "<leader>tp",
        sort_order = 10,
        jump_to_on_insert = "value",
      },
      -- Example: A @started tag that uses a default date/time string when added
      started = {
        aliases = { "init" },
        style = { fg = "#9fd6d5" },
        get_value = function()
          return tostring(os.date("%y-%m-%d %H:%M"))
        end,
        key = "<leader>ts",
        sort_order = 20,
      },
      -- Example: A @done tag that also sets the todo item state when it is added and removed
      done = {
        aliases = { "completed", "finished" },
        style = { fg = "#96de7a" },
        get_value = function()
          return tostring(os.date("%y-%m-%d %H:%M"))
        end,
        key = "<leader>td",
        on_add = function(todo_item)
          require("checkmate").set_todo_item(todo_item, "checked")
        end,
        on_remove = function(todo_item)
          require("checkmate").set_todo_item(todo_item, "unchecked")
        end,
        sort_order = 30,
      },
    },
  },
}

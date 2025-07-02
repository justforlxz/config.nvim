return {
  "olimorris/codecompanion.nvim",
  keys = {
    {
      "<leader>aa",
      "<CMD>CodeCompanionActions<CR>",
      mode = { "n", "v" },
      desc = "CodeCompanion: actions",
    },
  },
  opts = {
    opts = {
      language = "Chinese",
      send_code = true,
    },
    display = {
      action_palette = {
        provider = "fzf_lua",
      },
    },
    strategies = {
      chat = {
        adapter = {
          name = "copilot",
          -- model = "claude-3.7-sonnet",
          model = "claude-sonnet-4",
          -- model = "gemini-2.5-pro",
        },
        slash_commands = {
          ["file"] = {
            opts = { provider = "fzf_lua" },
          },
          ["buffer"] = {
            opts = { provider = "fzf_lua" },
          },
        },
      },
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
  },
  dependencies = {
    "ravitemer/mcphub.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "saghen/blink.cmp",
      opts = {
        sources = {
          per_filetype = {
            codecompanion = { "codecompanion" },
          },
        },
      },
    },
  },

  config = function(_, opts)
    require("codecompanion").setup(opts)
  end,
}

return {
  "telescope.nvim",
  keys = {
    {
      "<leader>fs",
      "<CMD>Telescope grep_string<CR>",
      "n",
      desc = "Telescope Find current word",
    },
    {
      "<leader>fr",
      "<CMD>Telescope resume<CR>",
      "n",
      desc = "Telescope Resume",
    },
    {
      "<leader>fw",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      "n",
      desc = "Telescope Live grep",
    },
  },
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  opts = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        live_grep_args = {
          theme = "dropdown", -- use dropdown theme
          -- layout_config = { mirror=true }, -- mirror preview pane
        },
      },
      defaults = {
        layout_config = {
          vertical = { width = 0.9 },
        },
        theme = "dropdown",
      },
    })

    telescope.load_extension("live_grep_args")
  end,
}

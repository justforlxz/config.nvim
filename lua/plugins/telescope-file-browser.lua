--- https://github.com/nvim-telescope/telescope-file-browser.nvim

-- Description:
-- telescope.nvim is a highly extendable fuzzy finder over lists.
-- Built on the latest awesome features from neovim core.
-- Telescope is centered around modularity, allowing for easy customization.

local function config()
  local actions = require("telescope.actions")
  require('telescope').setup({
    extensions = {
      file_browser = {
        theme = 'ivy',
      },
      hijack_netrw = true,
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
        }
      }
    },
  })
  require("telescope").load_extension "file_browser"
end

return {
  'nvim-telescope/telescope-file-browser.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  after = {
    'nvim-lspconfig',
  },
  config = config,
}

-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- Description:
-- file explorer
local function config()
  require("neo-tree").setup({
    default_component_configs = {
      container = {
        enable_character_fade = true,
      },
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        -- expander config, needed for nesting files
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "ﰊ",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "✖", -- this can only be used in the git_status source
          renamed = "", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },
    },
    window = {
      width = 30,
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
      },
    },
    filesystem = {
      follow_current_file = true,
      filtered_items = {
        visible = true,
        never_show = { ".git" },
      },
      window = {
        mappings = {
          ["L"] = "set_root",
          ["H"] = "navigate_up",
        },
      },
    },
    buffers = {
      follow_current_file = true, -- This will find and focus the file in the active buffer every
      -- time the current file is changed while the tree is open.
      group_empty_dirs = true, -- when true, empty folders will be grouped together
      show_unloaded = true,
      window = {
        mappings = {
          ["bd"] = "buffer_delete",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
        },
      },
    },
  })
end

local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  lazy = false,
  dependencies = { -- https://github.com/kyazdani42/nvim-web-devicons
    "kyazdani42/nvim-web-devicons", -- icon
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = config,
}

function M.init()
  vim.cmd([[
      nnoremap <silent> <leader>e :Neotree toggle reveal_force_cwd<CR>
 ]])
end

return M

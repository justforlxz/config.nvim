---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<A-i>"] = "",
    ["<leader>x"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<leader>D"] = "",
    ["gd"] = "",
    ["gr"] = "",
    ["gi"] = "",
  },
  t = {
    ["<A-i>"] = "",
  },
}

M.general = {
  i = {
    ["<C-s>"] = { "<Esc><cmd>w!<CR>", "Save file" },
    ["<A-S-q>"] = { "<Esc><cmd>q!<CR>", "Force quit" },
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-s>"] = { "<cmd>w!<CR>", "Save file" },
    ["<A-S-q>"] = { "<cmd>q!<CR>", "Force quit" },
  },
}

-- more keybinds!

M.telescope = {
  n = {
    ["<leader>fs"] = { "<cmd>Telescope grep_string<CR>", "Find current word" },
  },
}

M.tabufline = {
  n = {
    -- close buffer + hide terminal buffer
    ["<A-q>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.suda = {
  n = {
    ["<A-s>"] = { "<cmd>SudaWrite<CR>", "Save file using sudo" },
  },
  i = {
    ["<A-s>"] = { "<Esc><cmd>SudaWrite<CR>", "Save file using sudo" },
  },
}

M.nvterm = {
  t = {
    ["<A-d>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
  n = {
    ["<A-d>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
}

M.crates = {
  n = {
    ["<leader>cv"] = {
      function()
        require("crates").show_versions_popup()
      end,
      "Show versions",
    },
    ["<leader>cf"] = {
      function()
        require("crates").show_features_popup()
      end,
      "Show features or features details",
    },
    ["<leader>cd"] = {
      function()
        require("crates").show_dependencies_popup()
      end,
      "Show depedencies",
    },
  },
}

M.markdown_preview = {
  n = {
    ["<F12>"] = { "<cmd>MarkdownPreviewToggle<CR>", "Preview markdown" },
  },
}

M.lspconfig = {
  n = {
    ["<A-f>"] = {
      function()
        require("custom.configs.format").toggle_format_on_save()
      end,
    },
  },
}

M.diffview = {
  n = {
    ["dv"] = { "<cmd>DiffviewOpen<CR>", "Open diff view" },
    ["dc"] = { "<cmd>DiffviewClose<CR>", "Close diff view" },
  },
}

M.ufo = {
  n = {
    ["zR"] = {
      function()
        require("ufo").openAllFolds()
      end,
      "Open all folds",
    },
    ["zM"] = {
      function()
        require("ufo").closeAllFolds()
      end,
    },
    ["zr"] = {
      function()
        require("ufo").openFoldsExceptKinds()
      end,
    },
    ["zm"] = {
      function()
        require("ufo").closeFoldsWith()
      end,
    },
    ["K"] = {
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          -- choose one of coc.nvim and nvim lsp
          vim.lsp.buf.hover()
        end
      end,
    },
  },
}

M.trouble = {
  n = {
    ["<leader>tt"] = { "<cmd>TroubleToggle<CR>", "Toggle trouble list" },
    ["<leader>tr"] = { "<cmd>TroubleToggle lsp_references<CR>", "Show lsp references" },
    ["<leader>tD"] = { "<cmd>TroubleToggle document_diagnostics<CR>", "Show document diagnostics" },
    ["<leader>tw"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Show workspace diagnostics" },
    ["<leader>tq"] = { "<cmd>TroubleToggle loclist<CR>", "Show loclist" },
  },
}

M.glance = {
  n = {
    ["gd"] = { "<cmd>Glance definitions<CR>", "Glance definitions" },
    ["gr"] = { "<cmd>Glance references<CR>", "Glance references" },
    ["gi"] = { "<cmd>Glance implementations<CR>", "Glance implementations" },
    ["gy"] = { "<cmd>Glance type_definitions<CR>", "Glance type_definitions" },
  },
}
return M

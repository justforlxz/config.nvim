local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lsp"
    end, -- Override to setup mason-lspconfig
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    opts = require "custom.configs.lsp.conform",
    event = "BufWritePre",
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "hrsh7th/nvim-cmp",
    commit = "6c84bc75c64f778e9f1dcb798ed41c7fcb93b639",
    opts = overrides.cmp,
  },

  {
    "numToStr/Comment.nvim",
    config = function(_, opts)
      require("Comment").setup(opts)
      local ft = require "Comment.ft"
      ft.set("qmljs", "//%s")
    end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function(_, opts)
      require("better_escape").setup(opts)
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
  },

  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
    config = function()
      vim.g["suda#prompt"] = "Enter administrator password: "
    end,
  },

  {
    "ibhagwan/smartyank.nvim",
    event = "BufReadPost",
    config = function(_, opts)
      require("smartyank").setup(opts)
    end,
  },

  {
    "jcdickinson/codeium.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function(_, opts)
      require("codeium").setup(opts)
    end,
  },

  {
    "Saecki/crates.nvim",
    event = "BufReadPost Cargo.toml",
    opts = require "custom.configs.crates",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = ":call mkdp#util#install()",
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      background_colour = "#1D1536",
    },
    config = function(_, opts)
      local notify = require "notify"
      notify.setup(opts)
      vim.notify = notify
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    opts = {
      under_cursor = false,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  {
    "https://gitlab.com/itaranto/plantuml.nvim",
    ft = { "puml" },
    opts = require "custom.configs.plantuml",
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      mode = "document_diagnostics",
    },
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require "custom.configs.noice",
    config = function(_, opts)
      require("noice").setup(opts)
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  -- {
  --   "kevinhwang91/nvim-ufo",
  --   event = { "BufReadPost", "BufNewFile" },
  --   dependencies = {
  --     "kevinhwang91/promise-async",
  --   },
  --   opts = require "custom.configs.nvim-ufo",
  --   config = function(_, opts)
  --     require("ufo").setup(opts)
  --     vim.opt.foldlevel = 99
  --     vim.opt.foldlevelstart = 99
  --     vim.opt.foldcolumn = "0"
  --     vim.opt.foldenable = true
  --   end,
  -- },

  {
    "dnlhc/glance.nvim",
    event = "LspAttach",
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  -- DAP
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    requires = { "mfussenegger/nvim-dap" },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
    requires = { "mfussenegger/nvim-dap" },
  },

  -- escape using key combo (currently set to jk)
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require "custom.configs.betterescape"
    end,
  },
}

return plugins

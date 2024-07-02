local global = require "global"

return {
  -- disable
  {
    "lukas-reineke/indent-blankline.nvim",
    config = require "configs.indent",
  },
  -- overrides
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig").defaults()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return require "configs.gitsigns"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.cmp",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return require "configs.telescope"
    end,
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
  },

  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("Comment.ft").set("qmljs", "//%s")
    end,
  },

  -- add plugins to here
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = ":call mkdp#util#install()",
  },
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
    event = "BufWritePre",
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
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
    event = "BufRead",
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
    "tzachar/local-highlight.nvim",
    config = function(_, opts)
      require("local-highlight").setup(opts)
    end,
  },

  {
    "https://gitlab.com/itaranto/plantuml.nvim",
    ft = { "plantuml" },
    opts = require "configs.plantuml",
    dependencies = {
      "javiorfo/nvim-nyctophilia",
    },
    cond = global.is_linux,
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
  },

  {
    "folke/noice.nvim",
    event = "UIEnter",
    opts = require "configs.noice",
    config = function(_, opts)
      require("noice").setup(opts)
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#1D1536",
        },
        config = function(_, opts)
          require("notify").setup(opts)
          vim.notify = require "notify"
        end,
      },
    },
  },

  {
    "stevearc/aerial.nvim",
    event = "LspAttach",
    config = function(_, opts)
      require("aerial").setup(opts)
    end,
  },

  {
    "echasnovski/mini.trailspace",
    event = { "BufRead" },
    config = function(_, opts)
      require("mini.trailspace").setup(opts)
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = { "CursorMoved" },
    config = function(_, opts)
      require("neoscroll").setup(opts)
    end,
  },

  {
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
  },

  {
    "mrcjkb/rustaceanvim",
    ft = "rust",
    version = "^4",
  },

  {
    "Saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    opts = require "configs.crates",
    config = function(_, opts)
      return require("crates").setup(opts)
    end,
  },

  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = { "CursorMoved", "CursorHold" },
  },
}

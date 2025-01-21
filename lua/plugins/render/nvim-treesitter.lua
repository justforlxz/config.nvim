return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = {
    -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "go",
      "html",
      "ini",
      "javascript",
      "json",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "meson",
      "python",
      "qmljs",
      "rust",
      "typescript",
      "vim",
      "yaml",
      "diff",
      "dap_repl",
    },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
  },
  dependencies = {
    {
      "hiphish/rainbow-delimiters.nvim",
      config = function(_, opts)
        require("rainbow-delimiters.setup").setup(opts)
      end,
    },
    "LiadOz/nvim-dap-repl-highlights",
  },

  config = function(_, opts)
    require("nvim-dap-repl-highlights").setup()
    require("nvim-treesitter.configs").setup(opts)
  end,
}

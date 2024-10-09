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
    },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
  },
  dependencies = {
    "hiphish/rainbow-delimiters.nvim",
    config = function(_, opts)
      local cache_dir = vim.g.base46_cache .. "rainbowdelimiters"
      if vim.g.base46_cache and vim.uv.fs_stat(cache_dir) then
        dofile(cache_dir)
      end

      require("rainbow-delimiters.setup").setup(opts)
    end,
  },

  config = function(_, opts)
    local cache_dir = vim.g.base46_cache .. "syntax"
    if vim.g.base46_cache and vim.uv.fs_stat(cache_dir) then
      dofile(cache_dir)
    end
    local cache_dir = vim.g.base46_cache .. "treesitter"
    if vim.g.base46_cache and vim.uv.fs_stat(cache_dir) then
      dofile(cache_dir)
    end

    require("nvim-treesitter.configs").setup(opts)
  end,
}

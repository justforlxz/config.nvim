local M = {
  'folke/tokyonight.nvim',
  config = function()
    require("tokyonight").setup({
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
  lazy = false,
  priority = 1000,
  dependencies = {
    { "stevearc/dressing.nvim", event = "VeryLazy" },
  },
}

return M

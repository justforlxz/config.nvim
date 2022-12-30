local M = {
  'folke/tokyonight.nvim',
  config = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
  lazy = false,
  priority = 1000,
  after = 'nvim-treesitter',
}

return M

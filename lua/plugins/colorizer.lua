-- https://github.com/norcalli/nvim-colorizer.lua

-- Description:
-- A high-performance color highlighter for Neovim

local function config()
  vim.o.termguicolors = true
  require'colorizer'.setup({
    ['*'] = {
      names = false,
    }
  })
end

local M = {
  'norcalli/nvim-colorizer.lua',
  config = config,
}

return M

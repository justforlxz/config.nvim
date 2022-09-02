--- https://github.com/windwp/nvim-ts-autotag

local function config()
  require('nvim-ts-autotag').setup()
end

return {
  'windwp/nvim-ts-autotag',
  config = config,
  requires = {
    'nvim-lspconfig',
    'nvim-treesitter'
  }
}

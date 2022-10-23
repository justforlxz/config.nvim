-- https://github.com/folke/lua-dev.nvim

-- Description:
-- lua language server setup for neovim dev and init.lua config
-- FIXME for now, I just use lua to develop neovim and write neovim/wez config,
-- but this configuration will not suitable for really develop projects in lua.

local function config()
  -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
  require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
  })

  -- then setup your lsp server as usual
  local lspconfig = require('lspconfig')

  -- example to setup sumneko and enable call snippets
  lspconfig.sumneko_lua.setup({
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace"
        }
      }
    }
  })
end

return {
  'folke/neodev.nvim',
  config = config,
  after = {
    'nvim-lspconfig',
    'telescope.nvim',
  }
}

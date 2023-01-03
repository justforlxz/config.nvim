--- https://github.com/windwp/nvim-ts-autotag

local function config()
  require('nvim-ts-autotag').setup()

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      underline = true,
      virtual_text = {
        spacing = 5,
        severity_limit = 'Warning',
      },
      update_in_insert = true,
    }
  )
end

local M = {
  'windwp/nvim-ts-autotag',
  config = config,
  dependencies = {
    'nvim-lspconfig',
    'nvim-treesitter'
  },
  event = "BufRead",
}

return M

local function config()
  local null_ls = require("null-ls")

  null_ls.setup({
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

        -- format on save
        vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
      end

      if client.server_capabilities.documentRangeFormattingProvider then
        vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
      end
    end,
  })

  local prettier = require("prettier")

  prettier.setup({
    bin = 'prettier', -- or `prettierd`
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    },
  })
end

return {
  'MunifTanjim/prettier.nvim',
  requires = {
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
  },
  after = {
    'nvim-lspconfig',
  },
  config = config,
}

local M = {}

function M.setup(client)
  local ts = require("nvim-lsp-ts-utils")
  ts.setup({
    enable_import_on_completion = true,
    eslint_bin = "eslint_d",
    eslint_enable_diagnostics = true,
    eslint_enable_disable_comments = true,
  })

  ts.setup_client(client)

  -- no default maps, so you may want to define some here
  local opts = { silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)

  --local ts = require "typescript"
  --ts.setup()
end

return M

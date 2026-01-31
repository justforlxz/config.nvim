return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local lsp = require("lsp")
    opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, lsp.servers)
    opts.on_attach = function(client, bufnr)
      lsp.on_attach(client, bufnr)
    end
  end,
}

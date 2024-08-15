return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  init = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = require("lazyvim.util").lsp.on_attach,
      },
    }
  end,
  ft = "rust",
}

return {
  src = {
    cmp = {
      enabled = true,
    },
  },
  lsp = {
    enabled = true,
    on_attach = function ()
      return require("configs.lspconfig").on_attach
    end,
    actions = true,
    completion = true,
    hover = true,
  },
}

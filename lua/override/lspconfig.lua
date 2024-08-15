return {
  "neovim/nvim-lspconfig",
  priority = 50,
  opts = {
    inlay_hints = {
      enabled = true,
    },
    codelens = {
      enabled = true,
    },
    servers = {
      qmlls = {},
    },
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      qmlls = function(_, opts)
        require("lspconfig").qmlls.setup({})
        return true
      end,
    },
  },
}

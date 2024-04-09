return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      qmlls = {},
    },
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      qmlls = function(_, opts)
        require'lspconfig'.qmlls.setup{}
        return true
      end,
    },
  },
}

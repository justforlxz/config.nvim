return {
  "Saecki/crates.nvim",
  event = "BufRead Cargo.toml",
  opts = {
    src = {
      cmp = {
        enabled = true,
      },
    },
    lsp = {
      enabled = true,
      on_attach = require("nvvim.configs").lsp_on_attach,
      actions = true,
      completion = true,
      hover = true,
    },
    popup = {
      autofocus = true,
      border = "rounded",
    },
  },

  config = function(_, opts)
    require("nvvim.configs").add_cmp_source("crates", 3)
    return require("crates").setup(opts)
  end,
}

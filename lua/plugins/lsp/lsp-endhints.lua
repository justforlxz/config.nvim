return {
  "chrisgrieser/nvim-lsp-endhints",
  event = "LspAttach",
  dependencies = { "neovim/nvim-lspconfig" },
  opts = {
    icons = {
      type = "󰰦 ",
      parameter = "󰰚 ",
      offspec = "󱁐 ", -- hint kind not defined in official LSP spec
      unknown = "󰋖", -- hint kind is nil
    },
  }, -- required, even if empty
  enabled = vim.fn.has("nvim-0.10") == 1,
}

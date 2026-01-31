return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "qmlls",
      },
    },
  },
  opts = {
    servers = {
      qmlls = {
        cmd = { "qmlls", "--build-dir", vim.fn.getcwd() .. "/build", "-E", "--no-cmake-calls" },
        filetypes = { "qml", "qmljs" },
        on_attach = function(_, bufnr)
          vim.diagnostic.enable(false, { bufnr = bufnr })
        end,
      },
    },
  },
}

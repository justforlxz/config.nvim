return {
  "mason-org/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
      -- icons = require("config.lazy").icons.mason,
    },
  },
  ensure_installed = {
    "html",
    "clangd",
    "cpplint",
    "neocmakelsp",
    "qmlls",
  },
}

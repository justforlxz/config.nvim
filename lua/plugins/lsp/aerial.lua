return {
  "stevearc/aerial.nvim",
  event = "LspAttach",
  config = function(_, opts)
    require("aerial").setup(opts)
  end,
}


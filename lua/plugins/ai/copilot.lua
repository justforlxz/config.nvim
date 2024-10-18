return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
  end,
  dependencies = {
    {
      "zbirenbaum/copilot-cmp",
      dependencies = {
        "hrsh7th/nvim-cmp",
      },
      config = function(_, opts)
        require("configs.lsp").add_cmp_source("copilot", 1)
        require("copilot_cmp").setup(opts)
      end,
    },
  },
}

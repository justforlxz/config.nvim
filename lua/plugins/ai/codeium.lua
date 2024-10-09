return {
  "Exafunction/codeium.nvim",
  event = "InsertEnter",
  opts = {
    enable_chat = true,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function(_, opts)
    require("configs").add_cmp_source("codeium", 2)
    require("codeium").setup(opts)
  end,
}

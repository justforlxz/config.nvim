return {
  "Exafunction/codeium.nvim",
  event = "InsertEnter",
  opts = {
    enable_local_search = true,
    enable_index_service = true,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
}

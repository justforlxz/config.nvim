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
    local has_cmp, cmp = pcall(require, "cmp")
    if has_cmp then
      local config = cmp.get_config()
      table.insert(config.sources, 2, {
        name = "codeium",
        max_item_count = 5,
      })
      cmp.setup(config)
    end
    require("codeium").setup(opts)
  end,
}

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
      config = function(_, opts)
        local has_cmp, cmp = pcall(require, "cmp")
        if has_cmp then
          local config = cmp.get_config()
          table.insert(config.sources, 1, {
            name = "copilot",
            max_item_count = 5,
          })
          cmp.setup(config)
        end

        require("copilot_cmp").setup(opts)
      end,
    },
  },
}

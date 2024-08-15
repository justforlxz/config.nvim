return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function(_, opts)
          require("copilot_cmp").setup(opts)
        end,
      },
    },
  }
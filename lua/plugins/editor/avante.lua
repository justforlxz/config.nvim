return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  config = function()
    require("avante").setup({})
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "grapp-dev/nui-components.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
      },
    },
    "nvim-lua/plenary.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
  },
}

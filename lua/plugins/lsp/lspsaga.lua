return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  opts = {
    beacon = {
      enable = false,
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}

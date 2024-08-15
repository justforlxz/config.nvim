return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  opts = {
    beacon = false,
  },
  config = function()
    require("lspsaga").setup({})
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}

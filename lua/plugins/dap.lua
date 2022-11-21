return {
  "mfussenegger/nvim-dap",
  opt = true,
  event = "BufReadPre",
  module = { "dap" },
  wants = {
    "nvim-dap-virtual-text",
    "nvim-dap-ui",
    "nvim-dap-python",
    "nvim-dap-go",
    "which-key.nvim"
  },
  requires = {
    "Pocco81/dap-buddy.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "nvim-telescope/telescope-dap.nvim",
    { "leoluz/nvim-dap-go", module = "dap-go" },
    { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    {
      "simrat39/rust-tools.nvim",
      requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
      opt = true,
      module = "rust-tools",
      ft = { "rust" },
    }
  },
  config = function()
    require("config.dap").setup()
  end,
}

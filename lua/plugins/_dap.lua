return {
  "mfussenegger/nvim-dap",
  opt = true,
  module = { "dap" },
  requires = {
    {
      "theHamsta/nvim-dap-virtual-text",
      module = { "nvim-dap-virtual-text" },
    },
    {
      "rcarriga/nvim-dap-ui",
      module = { "dapui" },
    },
    {
      "mfussenegger/nvim-dap-python",
      module = { "dap-python" },
    },
    "nvim-telescope/telescope-dap.nvim",
    {
      "leoluz/nvim-dap-go",
      module = "dap-go",
    },
    {
      "jbyuki/one-small-step-for-vimkind",
      module = "osv",
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      module = { "dap-vscode-js" },
    },
    {
      "microsoft/vscode-js-debug",
      opt = true,
      run = "npm install --legacy-peer-deps && npm run compile",
      disable = false,
    },
  },
  config = function()
    require("config.dap").setup()
  end,
  disable = false,
}

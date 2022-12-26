return {
  "mfussenegger/nvim-dap",
  opt = true,
  module = { "dap" },
  dependencies = {
    {
      "theHamsta/nvim-dap-virtual-text",
      module = { "nvim-dap-virtual-text" },
    },
    {
      "rcarriga/nvim-dap-ui",
      module = { "dapui" },
    },
    {
      "rcarriga/cmp-dap",
      module = "cmp-dap",
      config = function()
        require("cmp").setup({
          enabled = function()
            return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                or require("cmp_dap").is_dap_buffer()
          end,
        })

        require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
          sources = {
            { name = "dap" },
          },
        })
      end,
    },
    {
      "mfussenegger/nvim-dap-python",
      module = { "dap-python" },
    },
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

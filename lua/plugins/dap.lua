return {
  "mfussenegger/nvim-dap",
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
  },
  config = function()
    require("config.dap").setup()
  end,
  event = "BufRead",
}

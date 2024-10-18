return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "nvim-neotest/nvim-nio",
    {
      "LiadOz/nvim-dap-repl-highlights",
      config = function()
        require("nvim-dap-repl-highlights").setup()
      end,
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  },
  opts = {},
  config = function(_, opts)
    require("dapui").setup()
  end,
}

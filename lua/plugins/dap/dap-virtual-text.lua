return {
  "theHamsta/nvim-dap-virtual-text",
  dependencies = { "mfussenegger/nvim-dap" },
  opts = {
    ensure_installed = { "dap_repl" },
  },
  config = function(opts)
    require("nvim-dap-virtual-text").setup(opts)
  end,
}

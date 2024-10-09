return {
  "karb94/neoscroll.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function(_, opts)
    require("neoscroll").setup(opts)
  end,
}

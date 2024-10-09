return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  optes = {
    max_lines = 3,
  },
  config = function(_, opts)
    require("treesitter-context").setup(opts)
  end,
}

return {
  "folke/todo-comments.nvim",
  event = "BufReadPost",
  config = function(_, opts)
    require("todo-comments").setup(opts)
  end,
}

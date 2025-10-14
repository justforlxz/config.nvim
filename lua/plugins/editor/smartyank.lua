return {
  "ibhagwan/smartyank.nvim",
  event = "TextYankPost",
  config = function(_, opts)
    require("smartyank").setup(opts)
  end,
}

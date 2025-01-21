return {
  "akinsho/git-conflict.nvim",
  event = "BufReadPost",
  version = "*", -- Later on, I will lock the version.
  config = function()
    require("git-conflict").setup()
  end,
}

return {
  "sindrets/diffview.nvim",
  keys = {
    { "dv", "<CMD>DiffviewOpen<CR>", mode = "n", desc = "Diffview Open diff view" },
    { "dc", "<CMD>DiffviewClose<CR>", mode = "n", desc = "Diffview Close diff view" },
  },
  cmd = { "DiffviewOpen", "DiffviewClose" },
}

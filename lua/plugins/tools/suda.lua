return {
  "lambdalisue/suda.vim",
  keys = {
    { "<A-s>", "<CMD>SudaWrite<CR>", mode = "n", desc = "Suda Save file using sudo" },
    { "<A-s>", "<Esc><CMD>SudaWrite<CR>", mode = "i", desc = "Suda Save file using sudo" },
  },
  cmd = { "SudaRead", "SudaWrite" },
  config = function()
    vim.g["suda#prompt"] = "Enter administrator password: "
  end,
}

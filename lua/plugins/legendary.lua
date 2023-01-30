return {
  "mrjones2014/legendary.nvim",
  keys = {{
      "C-k",
      "<cmd>lua require('legendary').find()<CR>",
      desc = "legendary"
  }},
  -- sqlite is only needed if you want to use frecency sorting
  dependencies = { "kkharji/sqlite.lua", "romgrk/barbar.nvim", "folke/which-key.nvim", },
  config = function()
    require("config.legendary").setup()
  end,
}

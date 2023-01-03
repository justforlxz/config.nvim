return {
  "mrjones2014/legendary.nvim",
  -- sqlite is only needed if you want to use frecency sorting
  dependencies = { "kkharji/sqlite.lua", "romgrk/barbar.nvim", "folke/which-key.nvim", },
  config = function()
    require("config.legendary").setup()
  end,
}

return {
  "mrjones2014/legendary.nvim",
  -- sqlite is only needed if you want to use frecency sorting
  requires = { "kkharji/sqlite.lua" },
  config = function()
    require("config.legendary").setup()
  end,
}

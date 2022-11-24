-- https://github.com/windwp/nvim-autopairs

-- Description:
-- Insert or delete brackets, parens, quotes in pair.

return {
  "windwp/nvim-autopairs",
  opt = true,
  event = "InsertEnter",
  module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
  config = function()
    require("config.autopairs").setup()
  end,
}
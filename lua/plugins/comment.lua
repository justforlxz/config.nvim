-- https://github.com/preservim/nerdcommenter

-- Description:
-- quick comment plugin

return {
  "preservim/nerdcommenter",
  dependencies = { "folke/which-key.nvim" },
  init = function()
    vim.g.NERDCreateDefaultMappings = 0
    vim.g.NERDSpaceDelims = 1
  end,
  keys = {
    {
      "<C-/>",
      "<Plug>NERDCommenterToggle",
      desc = "Toggle comment",
      mode = "n",
    },
    {
      "<C-/>",
      "<Plug>NERDCommenterToggle",
      desc = "Toggle comment",
      mode = "v",
    },
  },
}

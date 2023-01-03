-- https://github.com/preservim/nerdcommenter

-- Description:
-- quick comment plugin

local function config()
  local wk = require("which-key")

  wk.register({
    ["<C-/>"] = { "<Plug>NERDCommenterToggle", "Toggle comment", mode = "n" },
  })

  wk.register({
    ["<C-/>"] = { "<Plug>NERDCommenterToggle", "Toggle comment", mode = "v" },
  })
end

local M = {
  "preservim/nerdcommenter",
  config = config,
  dependencies = { "folke/which-key.nvim" },
  init = function()
    vim.g.NERDCreateDefaultMappings = 0
    vim.g.NERDSpaceDelims = 1
  end,
}

return M

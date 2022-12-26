local config = function()
  local od = require('onedark')
  od.setup({
    highlights = {
      TSConstructor = {fg = '$yellow', fmt = 'NONE'},
      TSPunctBracket = {fg = '$none'},
    },
    transparent = true,
  })
  od.load()
end

local M = {
  'navarasu/onedark.nvim',
  config = config,
  after = 'nvim-treesitter',
}

return M
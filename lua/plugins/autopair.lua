-- https://github.com/windwp/nvim-autopairs

-- Description:
-- Insert or delete brackets, parens, quotes in pair.

local function config()
  local opts = {}
  require('nvim-autopairs').setup(opts)
end

local M = {
  'windwp/nvim-autopairs',
  config = config,
  event = "BufRead",
}

return M

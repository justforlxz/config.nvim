local function config()

end

local M = {
  'iamcco/markdown-preview.nvim',
  config = config,
  build = 'cd app && yarn install',
  event = "BufRead",
}

return M

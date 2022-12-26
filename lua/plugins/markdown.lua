local function config()

end

local M = {
  'iamcco/markdown-preview.nvim',
  config = config,
  run = 'cd app && yarn install'
}

return M
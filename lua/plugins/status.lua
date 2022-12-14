-- https://github.com/nvim-lualine/lualine.nvim

-- Description:
-- status line plugin written in lua

local function config()
  local cfg = require('lualine').get_config()
  local disable = {
    'NvimTree',
    'packer',
  }
  for _, ft in ipairs(disable) do
    table.insert(cfg.options.disabled_filetypes, ft)
  end
  table.insert(cfg.sections.lualine_x,1, {
    'lsp_progress',
    spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },

  })
  require('lualine').setup(cfg)


end

local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    -- https://github.com/kyazdani42/nvim-web-devicons
    'kyazdani42/nvim-web-devicons',
    'arkav/lualine-lsp-progress',
  },
  config = config,
}

return M

-- https://github.com/romgrk/barbar.nvim
local function config()
  vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*',
    callback = function()
      if vim.bo.filetype == 'neo-tree' then
        require'bufferline.api'.set_offset(31, 'FileTree')
      end
    end
  })

  vim.api.nvim_create_autocmd('BufWinLeave', {
    pattern = '*',
    callback = function()
      if vim.fn.expand('<afile>'):match('neo-tree') then
        require'bufferline.api'.set_offset(0)
      end
    end
  })
end

local M = {
    "romgrk/barbar.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = config,
    lazy = false,
    keys = {{
        "<space>k",
        "<cmd>BufferPrevious<cr>",
        desc = "BAR:: previous buffer"
    }, {
        "<space>j",
        "<cmd>BufferNext<cr>",
        desc = "BAR:: next buffer"
    }, {
        "<space>h",
        "<cmd>BufferMovePrevious<cr>",
        desc = "BAR:: move buffer to previous"
    }, {
        "<space>l",
        "<cmd>BufferMoveNext<cr>",
        desc = "BAR:: move buffer to next"
    }, {
        "<space>d",
        "<cmd>BufferClose<cr>",
        desc = "BAR:: close buffer"
    }, {
        "<space>p",
        "<cmd>BufferPick<cr>",
        desc = "BAR:: buffer-picking mode"
    }}
}

return M

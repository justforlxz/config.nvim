-- https://github.com/norcalli/nvim-colorizer.lua

-- Description:
-- A high-performance color highlighter for Neovim

return function()
        vim.o.termguicolors = true
        require 'colorizer'.setup({
                ['*'] = {
                        names = false,
                }
        })
end

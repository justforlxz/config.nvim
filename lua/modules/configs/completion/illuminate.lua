-- https://github.com/RRethy/vim-illuminate

-- Description:
-- Vim plugin for automatically highlighting other uses of the current word under the cursor

return function()
        vim.cmd([[
                augroup illuminate_augroup
                        autocmd!
                        autocmd VimEnter * hi illuminatedWord
                        \ cterm=bold gui=bold
                augroup END]])
end
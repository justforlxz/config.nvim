-- https://github.com/MarcWeber/vim-addon-local-vimrc

-- Description:
-- kiss local vimrc with hash protection

return function()
        vim.g.local_vimrc = {
                names = {
                        '.vimrc'
                },
                hash_fun = 'LVRHashOfFile',
        }
end
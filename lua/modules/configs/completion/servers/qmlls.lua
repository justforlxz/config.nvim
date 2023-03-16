

-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/qmlls.lua
return {
    -- make 'qmlls' in your enviroment: export PATH=$PATH:/usr/lib/qt6/bin/
    cmd = { 'qmlls' },
    filetypes = { 'qmljs' },
    single_file_support = true,
}

-- https://github.com/gcmt/wildfire.vim
-- Description:
-- select text object
-- FIXME this plugin seems have some bug
local M = {
    'terryma/vim-expand-region',
    keys = {{
        "<space><space>",
        "<Plug>(expand_region_expand)<cr>",
        desc = "Expand region"
    }}
}

return M

-- https://github.com/preservim/nerdcommenter

-- Description:
-- quick comment plugin

return function()
        vim.g.NERDSpaceDelims = 1
        vim.g.NERDCreateDefaultMappings = 0

        local wk = require("which-key")

        wk.register({ [""] = {
                "<Plug>NERDCommenterToggle", "Toggle comment", mode = 'n' } })
        wk.register({ [""] = {
                "<Plug>NERDCommenterToggle", "Toggle comment", mode = 'v' } })
        wk.register({ ["<C-/>"] = {
                "<Plug>NERDCommenterToggle", "Toggle comment", mode = 'n' } })
        wk.register({ ["<C-/>"] = {
                "<Plug>NERDCommenterToggle", "Toggle comment", mode = 'v' } })
end
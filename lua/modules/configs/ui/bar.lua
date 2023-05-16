-- https://github.com/romgrk/barbar.nvim

return function()
        local wk = require("which-key")
        local key_opts = {
                mode    = "n",
                prefix  = "<space>",
                buffer  = nil, -- Global mappings.
                silent  = true,
                noremap = true,
        }

        wk.register({
                k = {
                        "<cmd>BufferPrevious<cr>",
                        "BAR:: previous buffer",
                },
                j = {
                        "<cmd>BufferNext<cr>",
                        "BAR:: next buffer",
                },
                h = {
                        "<cmd>BufferMovePrevious<cr>",
                        "BAR:: move buffer to previous",
                },
                l = {
                        "<cmd>BufferMoveNext<cr>",
                        "BAR:: move buffer to next",
                },
                d = {
                        "<cmd>BufferClose<cr>",
                        "BAR:: close buffer",
                },
                p = {
                        "<cmd>BufferPick<cr>",
                        "BAR:: buffer-picking mode",
                },
        }, key_opts)
end

return {
    "akinsho/toggleterm.nvim",
    keys = {{
        "<A-d>",
        "<cmd>ToggleTerm direction=float<cr>",
        {"n", "i"},
        desc = "Terminal: Toggle floating terminal"
    }, {
        "<A-d>",
        "<Cmd>ToggleTerm<CR>",
        "t",
        desc = "Terminal: Toggle terminal"
    }},
    version = "*",
    config = true
}

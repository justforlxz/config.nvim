local translator = {}

translator["voldikss/vim-translator"] = {
    enabled = true,
    lazy = true,
    cmd = {
        "TranslateW",
    },
    config = function()
        vim.g.translator_default_engines = { "google" }
        vim.g.translator_window_type = "preview"
    end,
}

return translator
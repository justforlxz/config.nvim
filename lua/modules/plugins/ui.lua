local ui = {}

ui["catppuccin/nvim"] = {
    lazy = false,
    name = "catppuccin",
    config = require("ui.catppuccin")
}

ui["romgrk/barbar.nvim"] = {
    dependencies = {'kyazdani42/nvim-web-devicons'},
    config = require("ui.bar")
}

ui["norcalli/nvim-colorizer.lua"] = {
    config = require("ui.colorizer")
}

ui["lukas-reineke/indent-blankline.nvim"] = {
    config = require("ui.indent")
}

ui["navarasu/onedark.nvim"] = {
    config = require("ui.onedark")
}

ui["luochen1990/rainbow"] = {
    config = require("ui.rainbow")
}

ui["nvim-lualine/lualine.nvim"] = {
    dependencies = { -- https://github.com/kyazdani42/nvim-web-devicons
    'kyazdani42/nvim-web-devicons', 'arkav/lualine-lsp-progress'},
    config = require("ui.status")
}

return ui

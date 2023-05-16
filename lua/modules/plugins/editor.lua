local editor = {}

editor["rainbowhxch/accelerated-jk.nvim"] = {
    lazy = true,
    event = "VeryLazy",
    config = require("editor.accelerated-jk")
}

editor['kevinhwang91/nvim-ufo'] = {
    lazy = true,
    event = {"BufReadPost", "BufAdd", "BufNewFile"},
    config = require("editor.fold"),
    dependencies = {'kevinhwang91/promise-async'}
}

editor['folke/which-key.nvim'] = {
    lazy = true,
    event = {"CursorHold", "CursorHoldI"}
}

editor['MarcWeber/vim-addon-local-vimrc'] = {
    lazy = true,
    config = require("editor.localrc")
}

editor["terryma/vim-expand-region"] = {
    lazy = true,
    config = require("editor.select")
}

editor["nvim-treesitter/nvim-treesitter"] = {
    lazy = true,
    event = {"CursorHold", "CursorHoldI"},
    config = require("editor.treesitter"),
    build = ':TSUpdate',
    dependencies = {'nvim-treesitter/playground'}
}

return editor

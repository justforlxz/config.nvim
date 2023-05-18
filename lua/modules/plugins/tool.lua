local tool = {}

tool["tpope/vim-fugitive"] = {
    lazy = true,
    cmd = { "Git", "G" },
}

tool["nvim-tree/nvim-tree.lua"] = {
    lazy = true,
    cmd = {
        "NvimTreeToggle",
        "NvimTreeOpen",
        "NvimTreeFindFile",
        "NvimTreeFindFileToggle",
        "NvimTreeRefresh",
    },
    config = require("tool.nvim-tree"),
}
tool["ibhagwan/smartyank.nvim"] = {
    lazy = true,
    event = "BufReadPost",
    config = require("tool.smartyank"),
}
tool["akinsho/toggleterm.nvim"] = {
    lazy = true,
    cmd = {
        "ToggleTerm",
        "ToggleTermSetName",
        "ToggleTermToggleAll",
        "ToggleTermSendVisualLines",
        "ToggleTermSendCurrentLine",
        "ToggleTermSendVisualSelection",
    },
    config = require("tool.toggleterm"),
}
tool["folke/trouble.nvim"] = {
    lazy = true,
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    config = require("tool.trouble"),
}
tool["folke/which-key.nvim"] = {
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    config = require("tool.which-key"),
}
tool["gelguy/wilder.nvim"] = {
    lazy = true,
    event = "CmdlineEnter",
    config = require("tool.wilder"),
    dependencies = { "romgrk/fzy-lua-native" },
}

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
tool["nvim-telescope/telescope.nvim"] = {
    lazy = true,
    cmd = "Telescope",
    config = require("tool.telescope"),
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-lua/plenary.nvim" },
        { "debugloop/telescope-undo.nvim" },
        {
            "ahmedkhalf/project.nvim",
            event = "BufReadPost",
            config = require("tool.project"),
        },
        { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
        {
            "nvim-telescope/telescope-frecency.nvim",
            dependencies = {
                { "kkharji/sqlite.lua" },
            }
        },
        { "jvgrootveld/telescope-zoxide" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
}

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
tool["mfussenegger/nvim-dap"] = {
    lazy = true,
    cmd = {
        "DapSetLogLevel",
        "DapShowLog",
        "DapContinue",
        "DapToggleBreakpoint",
        "DapToggleRepl",
        "DapStepOver",
        "DapStepInto",
        "DapStepOut",
        "DapTerminate",
    },
    config = require("tool.dap"),
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            config = require("tool.dap.dapui"),
        },
    },
}

tool["voldikss/vim-translator"] = {
    lazy = true,
    cmd = {
        "TranslateW",
    },
    config = function()
        vim.g.translator_default_engines = { 'google' }
        vim.g.translator_window_type = 'preview'
    end
}

tool["mrjones2014/legendary.nvim"] = {
    lazy = true,
    config = require("tool.legendary"),
    dependencies = {
        "stevearc/dressing.nvim",
    },
}

return tool

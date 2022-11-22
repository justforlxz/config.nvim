local M = {}

function M.setup(use)
    --- dashboard
    use {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        cond = firenvim_not_active,
        config = [[require('config.dashboard-nvim')]]
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "VimEnter",
        config = [[require('config.indent-blankline')]]
    }

    -- Highlight URLs inside vim
    use {
        "itchyny/vim-highlighturl",
        event = "VimEnter"
    }

    -- Notification
    use {
        "rcarriga/nvim-notify",
        event = "BufReadPre",
        config = function()
            require("config.notify").setup()
        end,
        disable = false
    }
    use {
        "simrat39/desktop-notify.nvim",
        config = function()
            require("desktop-notify").override_vim_notify()
        end,
        disable = true
    }
    use {
        "vigoux/notifier.nvim",
        config = function()
            require("notifier").setup {}
        end,
        disable = true
    }

    -- Colorscheme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
            require("catppuccin").setup()
            vim.cmd [[colorscheme catppuccin]]
        end,
        disable = true
    }

    use {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd.colorscheme [[tokyonight]]
        end,
        disable = false
    }
    use {
        "sainnhe/everforest",
        config = function()
            vim.g.everforest_better_performance = 1
            vim.cmd.colorscheme [[everforest]]
        end,
        disable = true
    }
    use {
        "projekt0n/github-nvim-theme",
        disable = true
    }
    use {
        "sainnhe/gruvbox-material",
        config = function()
            vim.cmd "colorscheme gruvbox-material"
        end,
        disable = true
    }
    use {
        "arcticicestudio/nord-vim",
        config = function()
            vim.cmd "colorscheme nord"
        end,
        disable = true
    }
    use {
        "nvchad/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = function()
            require("colorizer").setup()
        end
    }
    use {
        "rktjmp/lush.nvim",
        cmd = {"LushRunQuickstart", "LushRunTutorial", "Lushify", "LushImport"},
        disable = false
    }
    use {
        "max397574/colortils.nvim",
        cmd = "Colortils",
        config = function()
            require("colortils").setup()
        end
    }
    use {
        "ziontee113/color-picker.nvim",
        cmd = {"PickColor", "PickColorInsert"},
        config = function()
            require "color-picker"
        end
    }
    use {
        "lifepillar/vim-colortemplate",
        disable = true
    }
end

return M

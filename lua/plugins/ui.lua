local M = {}

function M.setup(use)
    --- dashboard
    use {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        cond = firenvim_not_active,
        config = [[require('config.dashboard-nvim')]]
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

    -- WhichKey
    use {
        "folke/which-key.nvim",
        event = "VimEnter",
        module = {"which-key"},
        -- keys = { [[<leader>]] },
        config = function()
            require("config.whichkey").setup()
        end,
        disable = false
    }

    -- IndentLine
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
        config = function()
            local g = vim.g
            g.indent_blankline_char = "┊"
            g.indent_blankline_filetype_exclude = { "help", "packer" }
            g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
            g.indent_blankline_show_trailing_blankline_indent = false
        end
    }

    -- Better icons
    use {
        "nvim-tree/nvim-web-devicons",
        module = "nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup {
                default = true
            }
        end
    }

    -- Better Comment
    use {
        "numToStr/Comment.nvim",
        keys = {"gc", "gcc", "gbc"},
        config = function()
            require("Comment").setup {
                ignore = "^$",
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
              }
        end,
        disable = false
    }
    use {
        "tpope/vim-commentary",
        keys = {"gc", "gcc", "gbc"},
        disable = true
    }

    -- Better surround
    use {
        "tpope/vim-surround",
        event = "BufReadPre"
    }
    use {
        "Matt-A-Bennett/vim-surround-funk",
        event = "BufReadPre",
        config = function()
            require("config.surroundfunk").setup()
        end,
        disable = true
    }
end

return M

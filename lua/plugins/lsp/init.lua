local M = {}

function M.setup(use)
    use {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({})
        end
    }
    use {
        "SmiteshP/nvim-navic",
        config = function()
            require("nvim-navic").setup({})
        end,
        module = {"nvim-navic"}
    }
    --- rust
    use {
        "simrat39/rust-tools.nvim",
        requires = {"nvim-lua/plenary.nvim", "rust-lang/rust.vim"},
        opt = true,
        module = "rust-tools",
        ft = {"rust"}
    }
    use {
        "saecki/crates.nvim",
        event = {"BufRead Cargo.toml"},
        requires = {{"nvim-lua/plenary.nvim"}},
        config = function()
            require("crates").setup {
                null_ls = {
                    enabled = true,
                    name = "crates.nvim"
                }
            }
        end,
        disable = false
    }
    --- go
    use {
        "ray-x/go.nvim",
        ft = {"go"},
        config = function()
            require("go").setup()
        end,
        disable = false
    }

    --- lsp
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require('config.lsp').setup()
        end,
        after = {"nvim-cmp"},
        wants = {"nvim-lsp-installer", "mason.nvim", "mason-lspconfig.nvim", "mason-tool-installer.nvim",
                 "null-ls.nvim", "schemastore.nvim", "typescript.nvim"},
        requires = {"williamboman/nvim-lsp-installer", ---only ccls
        "jose-elias-alvarez/null-ls.nvim", "MunifTanjim/prettier.nvim", "williamboman/mason.nvim",
                    "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim",
                    "b0o/schemastore.nvim", "jose-elias-alvarez/typescript.nvim", --- neovim dev
        "folke/neodev.nvim"}
    }

    --- lspkind
    use {
        'glepnir/lspsaga.nvim',
        branch = 'main',
        after = {'nvim-lspconfig'},
        config = function()
            local saga = require("lspsaga")
            saga.init_lsp_saga({
                -- Options with default value
                -- "single" | "double" | "rounded" | "bold" | "plus"
                border_style = "single",
                -- the range of 0 for fully opaque window (disabled) to 100 for fully
                -- transparent background. Values between 0-30 are typically most useful.
                saga_winblend = 0,
                -- when cursor in saga window you config these to move
                move_in_saga = {
                    prev = '<C-p>',
                    next = '<C-n>'
                },
                -- Error, Warn, Info, Hint
                -- use emoji like
                -- { "🙀", "😿", "😾", "😺" }
                -- or
                -- { "😡", "😥", "😤", "😐" }
                -- and diagnostic_header can be a function type
                -- must return a string and when diagnostic_header
                -- is function type it will have a param `entry`
                -- entry is a table type has these filed
                -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
                diagnostic_header = {" ", " ", " ", "ﴞ "},
                -- preview lines above of lsp_finder
                preview_lines_above = 0,
                -- preview lines of lsp_finder and definition preview
                max_preview_lines = 10,
                -- use emoji lightbulb in default
                code_action_icon = "💡",
                -- if true can press number to execute the codeaction in codeaction window
                code_action_num_shortcut = true,
                -- same as nvim-lightbulb but async
                code_action_lightbulb = {
                    enable = true,
                    enable_in_insert = true,
                    cache_code_action = true,
                    sign = true,
                    update_time = 150,
                    sign_priority = 20,
                    virtual_text = true
                },
                -- finder icons
                finder_icons = {
                    def = '  ',
                    ref = '諭 ',
                    link = '  '
                },
                -- finder do lsp request timeout
                -- if your project big enough or your server very slow
                -- you may need to increase this value
                finder_request_timeout = 1500,
                finder_action_keys = {
                    open = {'o', '<CR>'},
                    vsplit = 's',
                    split = 'i',
                    tabe = 't',
                    quit = {'q', '<ESC>'}
                },
                code_action_keys = {
                    quit = 'q',
                    exec = '<CR>'
                },
                definition_action_keys = {
                    edit = '<C-c>o',
                    vsplit = '<C-c>v',
                    split = '<C-c>i',
                    tabe = '<C-c>t',
                    quit = 'q'
                },
                rename_action_quit = '<C-c>',
                rename_in_select = true,
                -- show symbols in winbar must nightly
                -- in_custom mean use lspsaga api to get symbols
                -- and set it to your custom winbar or some winbar plugins.
                -- if in_cusomt = true you must set in_enable to false
                symbol_in_winbar = {
                    in_custom = false,
                    enable = true,
                    separator = ' ',
                    show_file = true,
                    -- define how to customize filename, eg: %:., %
                    -- if not set, use default value `%:t`
                    -- more information see `vim.fn.expand` or `expand`
                    -- ## only valid after set `show_file = true`
                    file_formatter = "",
                    click_support = false
                },
                -- show outline
                show_outline = {
                    win_position = 'right',
                    -- set special filetype win that outline window split.like NvimTree neotree
                    -- defx, db_ui
                    win_with = '',
                    win_width = 30,
                    auto_enter = true,
                    auto_preview = true,
                    virt_text = '┃',
                    jump_key = 'o',
                    -- auto refresh when change buffer
                    auto_refresh = true
                },
                -- custom lsp kind
                -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
                custom_kind = {},
                -- if you don't use nvim-lspconfig you must pass your server name and
                -- the related filetypes into this table
                -- like server_filetype_map = { metals = { "sbt", "scala" } }
                server_filetype_map = {}
            })
        end
    }
    use {
        'onsails/lspkind.nvim',
        after = {'nvim-lspconfig'},
        config = function()
            require('lspkind').init({
                -- DEPRECATED (use mode instead): enables text annotations
                --
                -- default: true
                -- with_text = true,

                -- defines how annotations are shown
                -- default: symbol
                -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
                mode = 'symbol_text',

                -- default symbol map
                -- can be either 'default' (requires nerd-fonts font) or
                -- 'codicons' for codicon preset (requires vscode-codicons font)
                --
                -- default: 'default'
                preset = 'codicons',

                -- override preset symbols
                --
                -- default: {}
                symbol_map = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "ﰠ",
                    Variable = "",
                    Class = "ﴯ",
                    Interface = "",
                    Module = "",
                    Property = "ﰠ",
                    Unit = "塞",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "פּ",
                    Event = "",
                    Operator = "",
                    TypeParameter = ""
                }
            })
        end
    }

    -- Refactoring
    use {
        "ThePrimeagen/refactoring.nvim",
        module = {"refactoring", "telescope"},
        keys = {[[<leader>r]]},
        config = function()
            require("config.refactoring").setup()
        end
    }
    use {
        "python-rope/ropevim",
        run = "pip install ropevim",
        disable = true
    }
    use {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        disable = false,
        config = function()
            require("bqf").setup()
        end
    }
    use {
        "kevinhwang91/nvim-hlslens",
        event = "BufReadPre",
        disable = true
    }
    use {
        "nvim-pack/nvim-spectre",
        module = "spectre",
        keys = {"<leader>s"}
    }
    use {
        "https://gitlab.com/yorickpeterse/nvim-pqf",
        event = "BufReadPre",
        config = function()
            require("pqf").setup()
        end
    }
    use {
        "andrewferrier/debugprint.nvim",
        module = {"debugprint"},
        keys = {"g?p", "g?P", "g?v", "g?V", "g?o", "g?O"},
        cmd = {"DeleteDebugPrints"},
        config = function()
            require("debugprint").setup()
        end
    }
end

return M

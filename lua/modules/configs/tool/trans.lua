return function()
    require'Trans'.setup {
        ---@type string the directory for database file and password file
        dir = require('core.global').home .. '/.vim/dict',
        query    = 'fallback',
        -- backend_order = {},
        ---@type 'default' | 'dracula' | 'tokyonight' global Trans theme [see lua/Trans/style/theme.lua]
        theme    = 'default', -- default | tokyonight | dracula
        strategy = {
            ---@type { frontend:string, backend:string | string[] } fallback strategy for mode
            default = {
                frontend = 'hover',
                backend = '*',
            },
        },
        ---@type table frontend options
        frontend = {
            ---@class TransFrontendOpts
            ---@field keymaps table<string, string>
            default = {
                ---@type boolean Whether to auto play the audio
                auto_play = true,
                border = 'rounded',
                title = title, -- need nvim-0.9
                ---@type {open: string | boolean, close: string | boolean, interval: integer} Hover Window Animation
                animation = {
                    open = 'slid', -- 'fold', 'slid'
                    close = 'slid',
                    interval = 12,
                },
                timeout = 2000,
            },
            ---@class TransHoverOpts : TransFrontendOpts
            hover = {
                ---@type integer Max Width of Hover Window
                width             = 37,
                ---@type integer Max Height of Hover Window
                height            = 27,
                ---@type string -- see: /lua/Trans/style/spinner
                spinner           = 'dots',
                ---@type string -- TODO :support replace with {{special word}}
                fallback_message  = '{{notfound}} 翻译超时或没有找到相关的翻译',
                auto_resize       = true,
                -- strict = false, -- TODO :No Width limit when str is a sentence
                padding           = 10, -- padding for hover window width
                keymaps           = {
                    pageup       = '[[',
                    pagedown     = ']]',
                    pin          = '<leader>[',
                    close        = 'q',
                    toggle_entry = '<leader>;',
                    -- play         = '_', -- Deprecated
                },
                ---@type string[] auto close events
                auto_close_events = {
                    'InsertEnter',
                    'CursorMoved',
                    'BufLeave',
                },
                ---@type table<string, string[]> order to display translate result
                order             = {
                    default = {
                        'str',
                        'translation',
                        'definition',
                    },
                    offline = {
                        'title',
                        'tag',
                        'pos',
                        'exchange',
                        'translation',
                        'definition',
                    },
                    youdao = {
                        'title',
                        'translation',
                        'definition',
                        'web',
                    }
                },
                ---@type table<string, string>
                icon              = {
                    -- or use emoji
                    list        = '●', -- ● | ○ | ◉ | ◯ | ◇ | ◆ | ▪ | ▫ | ⬤ | 🟢 | 🟡 | 🟣 | 🟤 | 🟦 | 🟨 | 🟧 | 🟥 | 🟪 | 🟫 | 🟩 | 🟠 | 🟦 | 🟨 | 🟧 | 🟥 | 🟪 | 🟫 | 🟩 | 🟠
                    star        = '', -- ⭐ | ✴ | ✳ | ✲ | ✱ | ✰ | ★ | ☆ | 🌟 | 🌠 | 🌙 | 🌛 | 🌜 | 🌟 | 🌠 | 🌌 | 🌙 |
                    notfound    = ' ', --❔ | ❓ | ❗ | ❕|
                    yes         = '✔', -- ✅ | ✔️ | ☑
                    no          = '', -- ❌ | ❎ | ✖ | ✘ | ✗ |
                    cell        = '■', -- ■  | □ | ▇ | ▏ ▎ ▍ ▌ ▋ ▊ ▉ █
                    web         = '󰖟', --🌍 | 🌎 | 🌏 | 🌐 |
                    tag         = ' ',
                    pos         = '',
                    translation = '󰊿',
                    definition  = '󰗊',
                    exchange    = '✳',
                },
            },
        },
    }
end

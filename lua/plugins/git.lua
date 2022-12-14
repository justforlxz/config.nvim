-- https://github.com/tpope/vim-fugitive

-- Description:
-- git setup

local function config()
        vim.g.fugitive_gitlab_domains = {
                'https://salsa.debian.org',
                'https://whgitlab.uniontech.com',
        }

        require('gitsigns').setup({
                current_line_blame = true,
                current_line_blame_opts = {
                        virt_text = true,
                        virt_text_pos = 'eol',
                        delay = 300,
                        ignore_whitespace = false,
                },
                keymaps = {},
                preview_config = {
                  -- Options passed to nvim_open_win
                  border = 'single',
                  style = 'minimal',
                  relative = 'cursor',
                  row = 0,
                  col = 1
                },
        })

        require('git').setup({
            default_mappings = true,
            target_branch = "master",
            keymaps = {
              -- Close blame window
                quit_blame = "q",
            }
        })

        local wk = require("which-key")
        local key_opts = {
                mode    = "n",
                prefix  = "<space>g",
                buffer  = nil, -- Global mappings.
                silent  = true,
                noremap = true,
        }

        wk.register({
                ["w"] = {
                        "<cmd>Gitsigns toggle_word_diff<cr>",
                        "GITS:: word diff mode" },
                ["j"] = {
                        "<cmd>Gitsigns next_hunk<cr>",
                        "GITS:: next hunk" },
                ["k"] = {
                        "<cmd>Gitsigns prev_hunk<cr>",
                        "GITS:: previous hunk" },
                ["u"] = {
                        "<cmd>Gitsigns undo_stage_hunk<cr>",
                        "GITS:: undo stage hunk" },
                ["s"] = {
                        "<cmd>Gitsigns stage_hunk<cr>",
                        "GITS:: stage hunk" },
        }, key_opts)
end

local M = {
        'tpope/vim-fugitive',
        dependencies = {
                -- GBrowser handlers
                {
                        -- https://github.com/tpope/vim-rhubarb
                        'tpope/vim-rhubarb', -- github
                        -- https://github.com/shumphrey/fugitive-gitlab.vim
                        'shumphrey/fugitive-gitlab.vim', -- gitlab
                },
                {
                        -- https://github.com/lewis6991/gitsigns.nvim
                        'lewis6991/gitsigns.nvim', -- sign column diff mark
                        dependencies = {
                                'nvim-lua/plenary.nvim',
                        },
                },
                'dinhhuy258/git.nvim',
  "folke/which-key.nvim",
        },
        config = config,
}

return M

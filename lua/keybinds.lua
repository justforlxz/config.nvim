local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better window navigation
keymap("n", "<leader>T", ":e term://.//zsh<cr>|", opts)
keymap("n", "<leader>vimrc", ":e ~/.config/nvim/init.lua<cr>", opts)
keymap("n", "<leader>lm", ":marks<cr>", opts)
keymap("t", "<c-q><c-q>", "<c-\\><c-n>", term_opts)
keymap("n", "<leader>r<tab>", "mc80A <esc>080lDgelD`cP", opts)

-- " move cursor up-and-down when line warpped
-- "    https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/clhv03p
-- nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
-- nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

map({ "n", "v" }, "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Dont copy replaced text" })

map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<A-f>", function()
  require("conform").format()
  vim.notify("Format successful!")
end, { desc = "Format buffer once" })

-- Plugin: toggleterm
map({ "n", "i" }, "<A-d>", "<cmd>ToggleTerm direction=float<cr>", { desc = "terminal: Toggle float" })
map("t", "<A-d>", "<Cmd>ToggleTerm<CR>", { desc = "terminal: Toggle float" })

-- Plugin: lspsaga
map("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", { desc = "Lsp: code action" })
map("n", "gh", "<Cmd>Lspsaga finder<CR>", { desc = "Lsp: peek definition" })

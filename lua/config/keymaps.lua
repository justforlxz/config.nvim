-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- spell check
map("n", "]s", "]s", { noremap = true, silent = true })
map("n", "[s", "[s", { noremap = true, silent = true })

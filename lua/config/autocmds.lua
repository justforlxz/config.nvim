-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- filetype for plantuml
vim.api.nvim_command("au BufNewFile,BufRead *.puml setfiletype plantuml")
vim.api.nvim_command("au BufNewFile,BufRead *.pu setfiletype plantuml")
vim.api.nvim_command("au BufNewFile,BufRead *.plantuml setfiletype plantuml")
vim.api.nvim_command("au BufNewFile,BufRead *.uml setfiletype plantuml")
vim.api.nvim_command("au BufNewFile,BufRead *.iuml setfiletype plantuml")

-- filetype for qml
vim.api.nvim_command("au BufNewFile,BufRead *.qml setfiletype qmljs")

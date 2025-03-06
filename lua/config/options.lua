-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local o = vim.o
local g = vim.g
local command = vim.api.nvim_command

-- disable lsp log
vim.lsp.log.set_level(vim.log.levels.OFF)

-- LazyVim auto format
g.autoformat = false

-- LazyVim cmp transparent
o.pumblend = 0

-- spell check
opt.spell = true
opt.spelllang = { "en_us", "cjk" }
opt.spelloptions = "camel"

-- filetype for plantuml
command("au BufNewFile,BufRead *.puml setfiletype plantuml")
command("au BufNewFile,BufRead *.pu setfiletype plantuml")
command("au BufNewFile,BufRead *.plantuml setfiletype plantuml")
command("au BufNewFile,BufRead *.uml setfiletype plantuml")
command("au BufNewFile,BufRead *.iuml setfiletype plantuml")
-- filetype for qml
command("au BufNewFile,BufRead *.qml setfiletype qmljs")
-- filetype for image
command("au BufNewFile,BufRead *.png setfiletype image")
command("au BufNewFile,BufRead *.jpg setfiletype image")
command("au BufNewFile,BufRead *.jpeg setfiletype image")
command("au BufNewFile,BufRead *.gif setfiletype image")
command("au BufNewFile,BufRead *.webp setfiletype image")
command("au BufNewFile,BufRead *.avif setfiletype image")

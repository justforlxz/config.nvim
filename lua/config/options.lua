-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/snips"
vim.o.cursorlineopt = "both" -- to enable cursorline!
vim.opt.termguicolors = true
-- vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度

-- avante.nvim recommanded options
vim.o.laststatus = 3
vim.o.splitkeep = "screen"
vim.opt.termguicolors = true

-- interval for writing swap file to disk, also used by gitsigns
vim.o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"

-- disable some default providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0


-- by groveer
local opt = vim.opt
local o = vim.o
local g = vim.g
local command = vim.api.nvim_command
local fn = vim.fn

-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add yours here!
o.cursorlineopt = "both" -- to enable cursorline!

-- avante.nvim recommanded options
o.laststatus = 3
o.splitkeep = "screen"

opt.termguicolors = true

-- filetype for plantuml
command("au BufNewFile,BufRead *.puml setfiletype plantuml")
command("au BufNewFile,BufRead *.pu setfiletype plantuml")
command("au BufNewFile,BufRead *.plantuml setfiletype plantuml")
command("au BufNewFile,BufRead *.uml setfiletype plantuml")
command("au BufNewFile,BufRead *.iuml setfiletype plantuml")
-- filetype for qml
command("au BufNewFile,BufRead *.qml setfiletype qmljs")

g.vscode_snippets_path = fn.stdpath("config") .. "/snips"


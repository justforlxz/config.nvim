-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/snips"
vim.o.cursorlineopt = "both" -- to enable cursorline!
vim.opt.termguicolors = true
-- vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度

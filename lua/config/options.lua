-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local o = vim.o
local g = vim.g
local command = vim.api.nvim_command
local fn = vim.fn

g.autoformat = false

-- filetype for qml
vim.api.nvim_command("au BufNewFile,BufRead *.qml setfiletype qmljs")

vim.g.vscode_snippets_path = fn.stdpath("config") .. "/snips"

o.cursorlineopt = "both" -- to enable cursorline!
-- filetype for plantuml
command("au BufNewFile,BufRead *.puml setfiletype plantuml")
command("au BufNewFile,BufRead *.pu setfiletype plantuml")
command("au BufNewFile,BufRead *.plantuml setfiletype plantuml")
command("au BufNewFile,BufRead *.uml setfiletype plantuml")
command("au BufNewFile,BufRead *.iuml setfiletype plantuml")

-- vscode theme for cmp
-- gray
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
-- blue
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
-- light blue
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
-- pink
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
-- front
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

vim.opt.termguicolors = true
vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度

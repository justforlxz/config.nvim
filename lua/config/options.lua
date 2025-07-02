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

g.lazyvim_blink_main = true

-- LazyVim cmp transparent
o.pumblend = 0

-- spell check
opt.spell = true
opt.spelllang = { "en_us", "cjk" }
opt.spelloptions = "camel"

vim.filetype.add({
  extension = {
    puml = "plantuml",
    pu = "plantuml",
    plantuml = "plantuml",
    uml = "plantuml",
    iuml = "plantuml",
    qml = "qmljs",
    png = "image",
    jpg = "image",
    jpeg = "image",
    gif = "image",
    webp = "image",
    avif = "image",
    wxml = "html",
    wxss = "css",
  },
})

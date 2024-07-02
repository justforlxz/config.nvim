require "nvchad.options"

local o = vim.o
local g = vim.g
local command = vim.api.nvim_command
local fn = vim.fn

-- add yours here!
o.cursorlineopt = "both" -- to enable cursorline!
-- filetype for plantuml
command "au BufNewFile,BufRead *.puml setfiletype plantuml"
command "au BufNewFile,BufRead *.pu setfiletype plantuml"
command "au BufNewFile,BufRead *.plantuml setfiletype plantuml"
command "au BufNewFile,BufRead *.uml setfiletype plantuml"
command "au BufNewFile,BufRead *.iuml setfiletype plantuml"
-- filetype for qml
command "au BufNewFile,BufRead *.qml setfiletype qmljs"

g.vscode_snippets_path = fn.stdpath "config" .. "/snips"

if g.neovide then
  o.guifont = "Maple Mono NF CN:h14"
  g.neovide_transparency = 1.0
  g.neovide_input_ime = false
  g.neovide_scroll_animation_length = 0.2
  g.neovide_hide_mouse_when_typing = true
  g.neovide_cursor_vfx_mode = "torpedo"
end

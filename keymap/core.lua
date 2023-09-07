return {
    ["x|p"] = require("keymap.bind").map_cr('p:let @+=@0<CR>:let @"=@0<CR>'):with_noremap():with_silent():with_desc("Dont copy replaced text")
}
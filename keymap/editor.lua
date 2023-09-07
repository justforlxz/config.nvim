return {
    ["nx|mm"] = require("keymap.bind").map_cr("Translate"):with_noremap():with_silent():with_desc(" Translate"),
    ["nx|mk"] = require("keymap.bind").map_cr("TransPlay"):with_noremap():with_silent():with_desc(" 自动发音"),
    ["n|mi"] = require("keymap.bind").map_cr("TranslateInput"):with_noremap():with_silent():with_desc(" Translate From Input"),
}
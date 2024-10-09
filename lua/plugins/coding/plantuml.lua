return {
  "https://gitlab.com/itaranto/plantuml.nvim",
  ft = { "plantuml" },
  opts = {
    renderer = {
      type = "image",
      options = {
        prog = "feh",
        dark_mode = false,
      },
    },
    render_on_write = true,
  },

  dependencies = {
    "javiorfo/nvim-nyctophilia",
  },
  enabled = require("configs").is_linux,
}

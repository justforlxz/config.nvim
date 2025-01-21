local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}
local vim_api = vim.api
local vim_g = vim.g

return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    scope = {
      highlight = highlight,
      char = "▏",
    },
    indent = {
      char = "▏",
    },
  },
  config = function(_, opts)
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim_api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim_api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim_api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim_api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim_api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim_api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim_api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    vim_g.rainbow_delimiters = { highlight = highlight }

    require("ibl").setup(opts)
  end,
}

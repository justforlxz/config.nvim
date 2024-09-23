return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  enabled = false,
  opts = {
    chunk = {
      chars = {
        horizontal_line = "─",
        vertical_line = "│",
        left_top = "╭",
        left_bottom = "╰",
        right_arrow = ">",
      },
      style = "#806d9c",
    },
  },
  config = function(_, opts)
    require("hlchunk").setup(opts)
  end,
}

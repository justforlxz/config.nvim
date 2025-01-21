return {
  "3rd/image.nvim",
  ft = { "image" },
  opts = {
    processor = "magick_cli", -- make sure you have imagemagick installed
  },
  config = function(_, opts)
    require("image").setup(opts)
  end,
}

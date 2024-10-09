return {
  "AckslD/nvim-neoclip.lua",
  event = "BufReadPost",
  keys = {
    {
      "<leader>fc",
      "<CMD>Telescope neoclip<CR>",
      mode = "n",
      desc = "Telescope Find clip",
    },
  },
  opts = {
    keys = {
      telescope = {
        n = {
          select = "s",
          paste = "<cr>",
          --- It is possible to map to more than one key.
          -- paste = { 'p', '<c-p>' },
          paste_behind = "P",
          replay = "q",
          delete = "d",
          edit = "e",
          custom = {},
        },
      },
    },
  },
  config = function(_, opts)
    require("neoclip").setup(opts)
  end,
}

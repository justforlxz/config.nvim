return {
  "echasnovski/mini.animate",
  event = { "CursorMoved", "WinNew", "WinClosed" },
  opts = {
    open = {
      enable = false,
    },
    close = {
      enable = false,
    },
  },
  config = function(_, opts)
    require("mini.animate").setup(opts)
  end,
}

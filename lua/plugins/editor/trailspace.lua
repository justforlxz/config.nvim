return {
  "echasnovski/mini.trailspace",
  keys = {
    {
      "<A-t>",
      function()
        require("mini.trailspace").trim()
      end,
      mode = {"n", "v"},
      desc = "Tarilspace Trim all",
    },
  },
  event = { "BufReadPost", "BufNewFile" },
  config = function(_, opts)
    require("mini.trailspace").setup(opts)
  end,
}

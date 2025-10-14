return {
  "MeanderingProgrammer/render-markdown.nvim",
  keys = {
    {
      "<leader>mg",
      function()
        require("render-markdown").toggle()
      end,
      mode = { "n" },
      desc = "Markdown render toggle",
    },
  },
  opts = {
    latex = { enabled = false },
    html = { enabled = true },
    yaml = { enabled = true },
    completions = {
      lsp = { enabled = true },
      blink = { enabled = true },
    },
    restart_highlighter = true,
    checkbox = {
      enabled = true,
    },
  },
}

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  keys = {
    {
      "<A-f>",
      function()
        if require("conform").format({ async = true }) then
          vim.notify("File format applied", vim.log.levels.INFO)
        end
      end,
      { "n", "i", "v" },
      desc = "File Format with conform",
    },
  },
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      ["qmljs"] = { "qmlformat" },
    },
    formatters = {
      qmlformat = {
        command = "qmlformat",
        args = { "$FILENAME" },
      },
      markdown = { "prettier" },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

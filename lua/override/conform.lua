return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<A-f>",
      function()
        if require("conform").format({ lsp_fallback = true }) then
          vim.notify("File format applied", vim.log.levels.INFO)
        end
      end,
      { "n", "i", "v" },
      desc = "File Format with conform",
    },
  },
  opts = {
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
}

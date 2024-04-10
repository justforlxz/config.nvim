return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["qmljs"] = { "qmlformat" },
    },
    formatters = {
      qmlformat = {
        command = "qmlformat",
        args = { "$FILENAME" },
      },
    },
  },
}

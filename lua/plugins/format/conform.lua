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
      mode = { "n", "i", "v" },
      desc = "File Format with conform",
    },
  },
  opts = {
    async = true,
    formatters_by_ft = {
      lua = { "stylua" },

      javascript = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },

      markdown = { "prettier" },

      sh = { "shfmt" },

      yaml = { "yamlfmt" },
      qmljs = { "qmlformat" },
    },
    formatters = {
      qmlformat = {
        -- Change where to find the command
        command = "qmlformat",
        args = { "$FILENAME" },
      },
    },
  },

  event = "BufWritePre",
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}

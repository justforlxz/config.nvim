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
    -- only format changed lines on save
    format_on_save = function(bufnr)
      local ignore_filetypes = { "lua" }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return { timeout_ms = 500, lsp_fallback = true }
      end
      local lines = vim.fn.system("git diff --unified=0 " .. vim.fn.bufname(bufnr)):gmatch "[^\n\r]+"
      local ranges = {}
      for line in lines do
        if line:find "^@@" then
          local line_nums = line:match "%+.- "
          if line_nums:find "," then
            local _, _, first, second = line_nums:find "(%d+),(%d+)"
            table.insert(ranges, {
              start = { tonumber(first), 0 },
              ["end"] = { tonumber(first) + tonumber(second), 0 },
            })
          else
            local first = tonumber(line_nums:match "%d+")
            table.insert(ranges, {
              start = { first, 0 },
              ["end"] = { first + 1, 0 },
            })
          end
        end
      end
      local format = require("conform").format
      for _, range in pairs(ranges) do
        format { range = range, lsp_fallback = true }
      end
    end,
  },

  event = "BufWritePre",
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}

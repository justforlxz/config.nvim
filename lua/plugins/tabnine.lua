local function config()
  local compare = require("cmp.config.compare")
  local tabnine = require("cmp_tabnine.config")

  tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = "..",
    ignored_file_types = {
      -- default is not to ignore
      -- uncomment to ignore in lua:
      -- lua = true
    },
    show_prediction_strength = false,
  })

  --require("cmp").setup({
  --  sources = {
  --    { name = "cmp_tabnine" },
  --  },
  --  sorting = {
  --    priority_weight = 2,
  --    comparators = {
  --      require("cmp_tabnine.compare"),
  --      compare.offset,
  --      compare.exact,
  --      compare.score,
  --      compare.recently_used,
  --      compare.kind,
  --      compare.sort_text,
  --      compare.length,
  --      compare.order,
  --    },
  --  },
  --})
  local prefetch = vim.api.nvim_create_augroup("prefetch", { clear = true })

  vim.api.nvim_create_autocmd("BufRead", {
    group = prefetch,
    callback = function()
      require("cmp_tabnine"):prefetch(vim.fn.expand("%:p"))
    end,
  })
end

local M = {
  "tzachar/cmp-tabnine",
  build = "./install.sh",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = config,
  event = "BufRead",
}

return M

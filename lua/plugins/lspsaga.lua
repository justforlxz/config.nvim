local function config()
  local saga = require("lspsaga")
  saga.init_lsp_saga({
    -- "single" | "double" | "rounded" | "bold" | "plus"
    border_style = "rounded",
  })
end

local M = {
  "glepnir/lspsaga.nvim",
  branch = "main",
  config = config,
  dependencies = { "neovim/nvim-lspconfig" },
}

return M


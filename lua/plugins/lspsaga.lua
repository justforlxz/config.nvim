local function config()
  require("lspsaga").setup({
    -- "single" | "double" | "rounded" | "bold" | "plus"
    border_style = "rounded",
    code_action_icon = "",
  })
end

local M = {
  "glepnir/lspsaga.nvim",
  config = config,
  dependencies = { {"neovim/nvim-lspconfig"}, {"nvim-tree/nvim-web-devicons"} },
  event = "BufRead",
}

return M

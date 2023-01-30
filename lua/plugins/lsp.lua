-- https://github.com/neovim/nvim-lspconfig

-- Description:
-- lsp configs for neovim builtin lsp

-- NOTE: In config() we are not allow to call other local functions, which
-- leads to a error. So we have to put all local functions at the start of
-- config()
local function config()
  require("config.lsp").setup()
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  event = "BufEnter",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    "MunifTanjim/prettier.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "jayp0521/mason-null-ls.nvim" },
    {
      "j-hui/fidget.nvim",
      config = function()
        require("fidget").setup({})
      end,
    },
    { "b0o/schemastore.nvim", module = { "schemastore" } },
    { "jose-elias-alvarez/typescript.nvim", module = { "typescript" } },
    {
      "SmiteshP/nvim-navic",
      -- "alpha2phi/nvim-navic",
      config = function()
        require("nvim-navic").setup({})
      end,
      module = { "nvim-navic" },
    },
    "folke/neodev.nvim",
    {
      "saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      dependencies = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("crates").setup({
          null_ls = {
            enabled = true,
            name = "crates.nvim",
          },
        })
      end,
    },
    --- go
    {
      "ray-x/go.nvim",
      ft = { "go" },
      config = function()
        require("go").setup()
      end,
    },
  },
}

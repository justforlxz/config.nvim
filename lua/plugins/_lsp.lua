-- https://github.com/neovim/nvim-lspconfig

-- Description:
-- lsp configs for neovim builtin lsp

Capabilities = vim.lsp.protocol.make_client_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
On_Attach_hooks = {}
function On_Attach(client, bufnr)
  local wk = require("which-key")
  local key_opts = {
    mode    = "n",
    buffer  = 0, -- local mappings
    silent  = true, -- use `silent ` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
  }

  wk.register({
    ["K"] = {
      "<cmd>lua vim.lsp.buf.hover()<CR>",
      "LSP:: hover"
    },
    ["<C-k>"] = {
      "<cmd>lua vim.lsp.buf.signature_help()<CR>",
      "LSP:: signature help"
    },
    ["<space>rn"] = {
      "<cmd>lua vim.lsp.buf.rename()<CR>",
      "LSP:: rename"
    },
    ["<space>f"] = {
      "<cmd>lua vim.lsp.buf.format { async = true }<CR>",
      "LSP:: format"
    },
    ["<space>a"] = {
      "<cmd>lua vim.lsp.buf.code_action()<CR>",
      "LSP:: code action"
    },
    ["<space>E"] = {
      "<cmd>lua vim.diagnostic.open_float()<CR>",
      "LSP:: float diagnostic"
    },
  }, key_opts)

  key_opts = {
    mode    = "n",
    buffer  = 0, -- local mappings
    silent  = true, -- use `silent ` when creating keymaps
    noremap = false, -- not use `noremap` when creating keymaps
  }

  wk.register({
    ["gd"] = {
      "<cmd>lua vim.lsp.buf.definition()<cr>",
      "LSP:: definition"
    },
    ["gr"] = {
      "<cmd>lua vim.lsp.buf.references()<cr>",
      "LSP:: reference"
    },
    ["gi"] = {
      "<cmd>lua vim.lsp.buf.implementation()<cr>",
      "LSP:: implementation"
    },
    ["gy"] = {
      "<cmd>lua vim.lsp.buf.type_definition()<cr>",
      "LSP:: type definition"
    },
  }, key_opts)

  for _, hook in ipairs(On_Attach_hooks) do
    if hook ~= nil then
      hook(client, bufnr)
    end
  end
end

-- NOTE: In config() we are not allow to call other local functions, which
-- leads to a error. So we have to put all local functions at the start of
-- config()
local function config()
  require('config.lsp').setup()
end

return {
  'neovim/nvim-lspconfig',
  config = config,
  after = {
    'nvim-cmp',
  },
  requires = {
    'jose-elias-alvarez/null-ls.nvim',
    'MunifTanjim/prettier.nvim',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  }
}

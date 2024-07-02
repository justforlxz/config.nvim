local M = {}
local lspconfig = require "lspconfig"

-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
  local map = vim.keymap.set
  local conf = require("nvconfig").lsp
  local tc_builtin = require "telescope.builtin"
  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true)
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Lsp Go to declaration")
  map("n", "gd", tc_builtin.lsp_definitions, opts "Lsp Go to definition")
  map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
  map("n", "gi", tc_builtin.lsp_implementations, opts "Lsp Go to implementation")
  map("n", "<C-k>", vim.lsp.buf.signature_help, opts "Lsp Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Lsp Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Lsp Remove workspace folder")
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "Lsp List workspace folders")

  if client.name == "clangd" then
    map("n", "gs", "<cmd>ClangdSwitchSourceHeader<CR>", opts "Lsp Switch C/C++ header source")
  end

  map("n", "gy", tc_builtin.lsp_type_definitions, opts "Lsp Go to type definition")
  map("n", "go", "<cmd>AerialToggle!<CR>", opts "Lsp Show outline")
  map("n", "[", "<cmd>AerialPrev<CR>", opts "Lsp Previous symbol")
  map("n", "]", "<cmd>AerialNext<CR>", opts "Lsp Next symbol")

  map("n", "gr", function()
    require "nvchad.lsp.renamer"()
  end, opts "Lsp NvRenamer")

  map({ "n", "v" }, "ga", function()
    if client.name == "rust_analyzer" then
      vim.cmd.RustLsp "codeAction"
    else
      require("actions-preview").code_actions()
    end
  end, opts "Lsp Code action")
  map("n", "gh", tc_builtin.lsp_references, opts "Lsp Show references")

  -- setup signature popup
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end

-- if you just want default config for the servers then put them in a table
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "html",
  "clangd",
  "pylsp",
  "bashls",
  "jsonls",
  "qmlls",
  "neocmake",
  "lua_ls",
  "rust_analyzer",
  "taplo",
  "tsserver",
}

M.defaults = function()
  local capabilities = require("nvchad.configs.lspconfig").capabilities
  local on_init = require("nvchad.configs.lspconfig").on_init
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = M.on_attach,
      capabilities = capabilities,
      on_init = on_init,
    }
  end
end

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "-j=24",
    "--enable-config",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    "--all-scopes-completion",
    "--completion-style=detailed",
    "--header-insertion=never",
    "--limit-references=3000",
    "--limit-results=350",
  },
  filetypes = { "c", "cpp" },
  single_file_support = false,
  root_dir = function()
    vim.loop.cwd()
  end,
  offsetEncoding = { "utf-8", "utf-16" },
}

return M

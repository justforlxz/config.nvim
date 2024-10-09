-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

require("lazyvim.util").lsp.on_attach(function(client, buffer)
  local function opts(desc)
    return { buffer = buffer, desc = desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts("Lsp Go to declaration"))
  map("n", "gd", require("telescope.builtin").lsp_definitions, opts("Lsp Go to definition"))
  map("n", "K", function()
    if client.name == "rust-analyzer" then
      vim.cmd.RustLsp({ "hover", "actions" })
    else
      vim.lsp.buf.hover()
    end
  end, opts("Lsp hover information"))
  map("n", "gi", require("telescope.builtin").lsp_implementations, opts("Lsp Go to implementation"))
  map("n", "gl", function()
    vim.lsp.codelens.run()
  end, opts("Lsp CodeLens action"))
  map("n", "<C-k>", vim.lsp.buf.signature_help, opts("Lsp Show signature help"))
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Lsp Add workspace folder"))
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Lsp Remove workspace folder"))
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("Lsp List workspace folders"))

  if client.name == "clangd" then
    map("n", "gs", "<cmd>ClangdSwitchSourceHeader<CR>", opts("Lsp Switch C/C++ header source"))
  end

  if client.name == "rust-analyzer" then
    map("n", "ge", function()
      vim.cmd.RustLsp({ "explainError", "current" })
    end, opts("Lsp RustLsp explain error"))
  end

  map("n", "gy", require("telescope.builtin").lsp_type_definitions, opts("Lsp Go to type definition"))
  map("n", "go", "<cmd>AerialToggle!<CR>", opts("Lsp Show outline"))
  map("n", "[", "<cmd>AerialPrev<CR>", opts("Lsp Previous symbol"))
  map("n", "]", "<cmd>AerialNext<CR>", opts("Lsp Next symbol"))

  map("n", "gr", function()
    local has_nvchad, renamer = pcall(require, "nvchad.lsp.renamer")
    if has_nvchad then
      renamer()
    else
      vim.lsp.buf.rename()
    end
  end, opts("Lsp Renamer"))

  map({ "n", "v" }, "ga", function()
    if client.name == "rust-analyzer" then
      vim.cmd.RustLsp("codeAction")
    else
      require("actions-preview").code_actions()
    end
  end, opts("Lsp Code action"))
  map("n", "gh", require("telescope.builtin").lsp_references, opts("Lsp Show references"))
end)

map({ "n", "v" }, "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Dont copy replaced text" })

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
  map("n", "gd", "<cmd>Glance definitions<CR>", opts("Lsp Go to definition"))
  map("n", "K", vim.lsp.buf.hover, opts("Lsp hover information"))
  map("n", "gi", "<cmd>Glance implementations<CR>", opts("Lsp Go to implementation"))
  map("n", "<C-k>", vim.lsp.buf.signature_help, opts("Lsp Show signature help"))
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Lsp Add workspace folder"))
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Lsp Remove workspace folder"))
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("Lsp List workspace folders"))

  if client.name == "clangd" then
    map("n", "gs", "<cmd>ClangdSwitchSourceHeader<CR>", opts("Lsp Switch C/C++ header source"))
  end

  map("n", "gy", "<cmd>Glance type_definitions<CR>", opts("Lsp Go to type definition"))
  map("n", "go", "<cmd>AerialToggle!<CR>", opts("Lsp Show outline"))
  map("n", "[", "<cmd>AerialPrev<CR>", opts("Lsp Previous symbol"))
  map("n", "]", "<cmd>AerialNext<CR>", opts("Lsp Next symbol"))

  map("n", "gr", "<cmd>Lspsaga rename<CR>", opts("Lsp Rename"))

  map({ "n", "v" }, "ga", function()
    require("actions-preview").code_actions()
  end, opts("Lsp Code action"))
  map("n", "gh", "<cmd>Glance references<CR>", opts("Lsp Show references"))
end)

map({ "n", "v" }, "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Dont copy replaced text" })

-- map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<A-f>", function()
  if require("conform").format({ lsp_fallback = true }) then
    vim.notify("File format applied", vim.log.levels.INFO)
  end
end, { desc = "Format buffer once" })

-- Plugin: toggleterm
map({ "n", "i" }, "<A-d>", "<cmd>ToggleTerm direction=float<cr>", { desc = "terminal: Toggle float" })
map("t", "<A-d>", "<Cmd>ToggleTerm<CR>", { desc = "terminal: Toggle float" })

-- Plugin: smart-split
-- recommended mappings
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

map("n", "fs", "<CMD>Telescope grep_string<CR>", { desc = "Telescope Find current word" })
map("n", "fd", "<CMD>Telescope diagnostics<CR>", { desc = "Telescope Find workspace diagnostics" })
map("n", "fr", "<CMD>Telescope resume<CR>", { desc = "Telescope Resume" })
map("n", "fk", "<CMD>Telescope keymaps<CR>", { desc = "Telescope Find keymaps" })
map("n", "ff", "<CMD>Telescope find_files<CR>", { desc = "Telescope Find files" })
map("n", "fw", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Telescope Live grep" })

-- copilot
local chat = require("CopilotChat")

map("n", "cc", function()
  chat.toggle()
end, { desc = "Copilot Chat" })
map("n", "cq", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "Copilot Quit" })

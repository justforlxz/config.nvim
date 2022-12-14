local M = {}

local whichkey = require("which-key")

-- local keymap = vim.api.nvim_set_keymap
-- local buf_keymap = vim.api.nvim_buf_set_keymap
local keymap = vim.keymap.set

local function keymappings(client, bufnr)
  local opts = {
    noremap = true,
    silent = true,
  }

  -- Key mappings
  -- buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", {
    buffer = bufnr,
  })
  keymap("n", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)

  keymap("n", "[w", function()
    require("lspsaga.diagnostic").goto_prev({
      severity = vim.diagnostic.severity.WARNING,
    })
  end, opts)
  keymap("n", "]w", function()
    require("lspsaga.diagnostic").goto_next({
      severity = vim.diagnostic.severity.WARNING,
    })
  end, opts)
  keymap("n", "[e", function()
    require("lspsaga.diagnostic").goto_prev({
      severity = vim.diagnostic.severity.ERROR,
    })
  end, opts)
  keymap("n", "]e", function()
    require("lspsaga.diagnostic").goto_next({
      severity = vim.diagnostic.severity.ERROR,
    })
  end, opts)

  -- Whichkey
  local builtin = "<cmd>lua require('telescope.builtin')."
  local lsp_prefix = "TELE::LSP:: "
  local keymap_l = {
    l = {
      name = "LSP",
      R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
      a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
      d = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
      f = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
      i = { "<cmd>LspInfo<CR>", "Lsp Info" },
      n = { "<cmd>Lspsaga rename<CR>", "Rename" },
      r = { "<cmd>Lspsaga lsp_finder<CR>", "References" },
      s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
      t = { "<cmd>TroubleToggle document_diagnostics<CR>", "Trouble" },
      L = { "<cmd>lua vim.lsp.codelens.refresh()<CR>", "Refresh CodeLens" },
      l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "Run CodeLens" },
      D = { "<cmd>lua require('config.lsp').toggle_diagnostics()<CR>", "Toggle Inline Diagnostics" },
      o = { "<cmd>LSoutlineToggle<CR>", "Symbol" },
    },
    e = {
      builtin .. "diagnostics()<cr>",
      lsp_prefix .. "diagnostics",
    },
    E = {
      "<cmd>lua vim.diagnostic.open_float()<CR>",
      lsp_prefix .. "float diagnostic",
    },
    s = {
      builtin .. "lsp_document_symbols()<cr>",
      lsp_prefix .. "document symbol",
    },
    S = {
      "<cmd>Telescope aerial<cr>",
      lsp_prefix .. "document symbol",
    },
    H = {
      builtin .. "jumplist()<cr>",
      lsp_prefix .. "jump list",
    },
    M = {
      builtin .. "marks()<cr>",
      lsp_prefix .. "mark list",
    },
  }

  if client.server_capabilities.documentFormattingProvider then
    keymap_l.l.F = { "<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format Document" }
  end

  local keymap_g = {
    name = "Goto",
    d = { "<cmd>Lspsaga lsp_finder<CR>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    I = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
    b = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
    p = { "<cmd>Lspsaga peek_definition<CR>", "Preview Definition" },
    f = { "<cmd>Telescope lsp_references()<CR>", "TELE::LSP:: reference" },
  }

  local keymap_v_l = {
    l = {
      name = "LSP",
      a = { "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", "Code Action" },
    },
  }

  local o = {
    buffer = bufnr,
    prefix = "<space>",
  }
  whichkey.register(keymap_l, o)

  o = {
    mode = "v",
    buffer = bufnr,
    prefix = "<space>",
  }
  whichkey.register(keymap_v_l, o)

  o = {
    buffer = bufnr,
    prefix = "g",
  }
  whichkey.register(keymap_g, o)
end

-- local function signature_help(client, bufnr)
--   local trigger_chars = client.server_capabilities.signatureHelpProvider.triggerCharacters
--   for _, char in ipairs(trigger_chars) do
--     vim.keymap.set("i", char, function()
--       vim.defer_fn(function()
--         pcall(vim.lsp.buf.signature_help)
--       end, 0)
--       return char
--     end, {
--       buffer = bufnr,
--       noremap = true,
--       silent = true,
--       expr = true,
--     })
--   end
-- end

function M.setup(client, bufnr)
  keymappings(client, bufnr)
  -- signature_help(client, bufnr) -- use cmp-nvim-lsp-signature-help
end

return M

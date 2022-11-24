local M = {}

local whichkey = require("which-key")
local legendary = require("legendary")

-- local keymap = vim.api.nvim_set_keymap
-- local buf_keymap = vim.api.nvim_buf_set_keymap
local keymap = vim.keymap.set

local function keymappings(client, bufnr)
    local opts = {
        noremap = true,
        silent = true
    }

    -- Key mappings
    -- buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", {
        buffer = bufnr
    })
    keymap("n", '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

    keymap("n", "[w", function()
        require("lspsaga.diagnostic").goto_prev({
            severity = vim.diagnostic.severity.WARNING
        })
    end, opts)
    keymap("n", "]w", function()
        require("lspsaga.diagnostic").goto_next({
            severity = vim.diagnostic.severity.WARNING
        })
    end, opts)
    keymap("n", "[e", function()
        require("lspsaga.diagnostic").goto_prev({
            severity = vim.diagnostic.severity.ERROR
        })
    end, opts)
    keymap("n", "]e", function()
        require("lspsaga.diagnostic").goto_next({
            severity = vim.diagnostic.severity.ERROR
        })
    end, opts)

    -- Whichkey
    local keymap_l = {
        l = {
            name = "LSP",
            R = {"<cmd>Trouble lsp_references<cr>", "Trouble References"},
            a = {"<cmd>Lspsaga code_action<CR>", "Code Action"},
            d = {"<cmd>Telescope diagnostics<CR>", "Diagnostics"},
            f = {"<cmd>Lspsaga lsp_finder<CR>", "Finder"},
            i = {"<cmd>LspInfo<CR>", "Lsp Info"},
            n = {"<cmd>Lspsaga rename<CR>", "Rename"},
            r = {"<cmd>Lspsaga lsp_finder<CR>", "References"},
            s = {"<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols"},
            t = {"<cmd>TroubleToggle document_diagnostics<CR>", "Trouble"},
            L = {"<cmd>lua vim.lsp.codelens.refresh()<CR>", "Refresh CodeLens"},
            l = {"<cmd>lua vim.lsp.codelens.run()<CR>", "Run CodeLens"},
            D = {"<cmd>lua require('config.lsp').toggle_diagnostics()<CR>", "Toggle Inline Diagnostics"},
            o = {"<cmd>LSoutlineToggle<CR>", "Symbol"}
        }
    }
    if client.server_capabilities.documentFormattingProvider then
        keymap_l.l.F = {"<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format Document"}
    end

    local keymap_g = {
        name = "Goto",
        d = {"<cmd>Lspsaga lsp_finder<CR>", "Definition"},
        D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration"},
        h = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help"},
        I = {"<cmd>Telescope lsp_implementations<CR>", "Goto Implementation"},
        b = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition"},
        p = {'<Cmd>Lspsaga peek_definitaion<CR>', "Preview Definition"}
    }

    local keymap_v_l = {
        l = {
            name = "LSP",
            a = {"<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", "Code Action"}
        }
    }

    local o = {
        buffer = bufnr,
        prefix = "<space>"
    }
    whichkey.register(keymap_l, o)
    require("legendary.integrations.which-key").bind_whichkey(keymap_l, o, false)

    o = {
        mode = "v",
        buffer = bufnr,
        prefix = "<space>"
    }
    whichkey.register(keymap_v_l, o)
    require("legendary.integrations.which-key").bind_whichkey(keymap_v_l, o, false)

    o = {
        buffer = bufnr,
        prefix = "g"
    }
    whichkey.register(keymap_g, o)
    require("legendary.integrations.which-key").bind_whichkey(keymap_g, o, false)
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

local function config()
  local saga = require('lspsaga')
  saga.init_lsp_saga({
    -- Error, Warn, Info, Hint
    -- use emoji like
    -- { "🙀", "😿", "😾", "😺" }
    -- or
    -- { "😡", "😥", "😤", "😐" }
    -- and diagnostic_header can be a function type
    -- must return a string and when diagnostic_header
    -- is function type it will have a param `entry`
    -- entry is a table type has these filed
    -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
    diagnostic_header = { " ", " ", " ", "ﴞ " },
    -- show diagnostic source
    show_diagnostic_source = true,
    -- add bracket or something with diagnostic source, just have 2 elements
    diagnostic_source_bracket = {},
    -- use emoji lightbulb in default
    code_action_icon = "💡",
    -- if true can press number to execute the codeaction in codeaction window
    code_action_num_shortcut = true,
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = true
    },
    -- separator in finder
    finder_separator = "  ",
    -- preview lines of lsp_finder and definition preview
    max_preview_lines = 40,
    finder_action_keys = {
      open = "o",
      vsplit = "s",
      split = "i",
      quit = "q",
      scroll_down = "<C-f>",
      scroll_up = "<C-b>" -- quit can be a table
    },
    code_action_keys = {
      quit = "q",
      exec = "<CR>"
    },
    rename_action_quit = "<C-c>",
    move_in_saga = {
      prev = 'j',
      next = 'k'
    },
    definition_preview_icon = "  ",
    -- "single" | "double" | "rounded" | "bold" | "plus"
    border_style = "plus",
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {}
  })

  local function hook()
    local action = require("lspsaga.action")

    local wk = require("which-key")

    wk.register({
      g = {
        f = { "<cmd>Lspsaga lsp_finder<CR>", "LSP:: finder" },
        s = { require('lspsaga.signaturehelp').signature_help, "LSP:: signature help" },
      },
      K = { require('lspsaga.hover').render_hover_doc, "LSP:: hover" },
      ["<leader>"] = {
        c = {
          name = "Code::",
          r = { require('lspsaga.rename').lsp_rename, "LSP:: rename" }
        }
      },
      ["<space>"] = {
        e = { require('lspsaga.diagnostic').show_line_diagnostics, "LSP:: diagnostic" },
        c = {
          name = "Code::",
          a = { "<cmd>Lspsaga code_action<CR>", "LSP:: code action" },
          p = { require('lspsaga.definition').preview_definition, "LSP:: float diagnostic" }
        }
      }
    })

    -- jump diagnostic
    -- map("n", "[e", require("lspsaga.diagnostic").goto_prev, { silent = true })
    -- map("n", "]e", require("lspsaga.diagnostic").goto_next, { silent = true })

    -- scroll down hover doc or scroll in definition preview
    -- map("n", "<C-f>", function()
    -- action.smart_scroll_with_saga(1)
    -- end, { silent = true })

    -- scroll up hover doc
    -- map("n", "<C-b>", function()
    -- action.smart_scroll_with_saga(-1)
    -- end, { silent = true })

    -- map("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

  end

  table.insert(On_Attach_hooks, hook)
end

return {
  "glepnir/lspsaga.nvim",
  branch = "main",
  config = config,
  after = { 'nvim-lspconfig' }
}

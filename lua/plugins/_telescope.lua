-- https://github.com/nvim-telescope/telescope.nvim

-- Description:
-- telescope.nvim is a highly extendable fuzzy finder over lists.
-- Built on the latest awesome features from neovim core.
-- Telescope is centered around modularity, allowing for easy customization.

local function config()
  local actions = require("telescope.actions")
  require('telescope').setup({
    defaults = { mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
      }
    } },
    pickers = {
      find_files = {
        require("telescope.themes").get_dropdown {}
      }
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      },
      aerial = {
        -- Display symbols as <root>.<parent>.<symbol>
        show_nesting = true
      },
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      }
    }
  })

  local builtin = "<cmd>lua require('telescope.builtin')."
  local lsp_prefix = "TELE::LSP:: "

  local function hook()
    local wk = require("which-key")
    local key_opts = {
      -- mode   Help        Affected                              Equivalent
      -- ''     mapmode-nvo Normal/Visual/Select/Operator-pending :map
      -- 'n'    mapmode-n	  Normal                                :nmap
      -- 'v'    mapmode-v   Visual/Select                         :vmap
      -- 's'    mapmode-s	  Select                                :smap
      -- 'x'    mapmode-x	  Visual                                :xmap
      -- 'o'    mapmode-o   Operator-pending                      :omap
      -- '!'    mapmode-ic  Insert/Command-line                   :map!
      -- 'i'    mapmode-i   Insert                                :imap
      -- 'l'    mapmode-l   Insert/Command-line/Lang-Arg          :lmap
      -- 'c'    mapmode-c   Command-line                          :cmap
      -- 't'    mapmode-t   Terminal                              :tmap
      mode    = "n",
      buffer  = 0, -- local mappings
      silent  = true, -- use `silent ` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
    }

    wk.register({
      ["gd"] = {
        builtin .. "lsp_definitions()<cr>",
        lsp_prefix .. "definition"
      },
      ["gf"] = {
        builtin .. "lsp_references()<cr>",
        lsp_prefix .. "reference"
      },
      ["<space>e"] = {
        builtin .. "diagnostics()<cr>",
        lsp_prefix .. "diagnostics"
      },
      ["<space>s"] = {
        builtin .. "lsp_document_symbols()<cr>",
        lsp_prefix .. "document symbol"
      },
      ["<space>S"] = {
        "<cmd>Telescope aerial<cr>",
        lsp_prefix .. "document symbol"
      },
      ["<space>H"] = {
        builtin .. "jumplist()<cr>",
        lsp_prefix .. "jump list"
      },
      ["<space>M"] = {
        builtin .. "marks()<cr>",
        lsp_prefix .. "mark list"
      },
    },
      key_opts
    )
  end

  table.insert(On_Attach_hooks, hook)

  local wk = require("which-key")
  local key_opts = {
    mode    = "n",
    buffer  = nil, -- Global
    silent  = true, -- use `silent ` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
  }

  wk.register(
    {
      ["<leader>E"] = {
        "<cmd>lua require('telescope.builtin').find_files()<cr>",
        "TELE:: search filename"
      },
      ["<leader>R"] = {
        "<cmd>lua require('telescope.builtin').live_grep()<cr>",
        "TELE:: search in files"
      },
      ["<leader>B"] = {
        "<cmd>lua require('telescope.builtin').buffers()<cr>",
        "TELE:: buffer list"
      },
      ["<leader>?"] = {
        "<cmd>lua require('telescope.builtin').help_tags()<cr>",
        "TELE:: helps"
      },
    },
    key_opts
  )

  require("telescope").load_extension("ui-select")
  require('telescope').load_extension('aerial')
  require('telescope').load_extension('fzf')
end

return {
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
  },
  after = {
    'nvim-lspconfig',
  },
  config = config,
}

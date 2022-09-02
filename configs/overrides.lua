local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "cpp",
    "markdown",
    "markdown_inline",
    "python",
    "qmljs",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    "vue-language-server",

    -- c/cpp stuff
    "clangd",

    -- rust stuff
    "rust-analyzer",

    -- bash stuff
    "bash-language-server",
    "shfmt",

    -- json stuff
    "json-lsp",

    -- python stuff
    "python-lsp-server",

    -- latex stuff
    "latexindent", -- formatter
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        row = 0,
        col = 0,
        width = 1,
        height = 1,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = 0.3 },
      vertical = { location = "rightbelow", split_ratio = 0.5 },
    },
  },
}

M.cmp = {
  sources = {
    { name = "codeium" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

M.telescope = {
  extensions_list = { "themes", "terms", "noice" },
}
return M

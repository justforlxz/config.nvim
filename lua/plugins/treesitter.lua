-- https://github.com/nvim-treesitter/nvim-treesitter

-- Description:
-- better syntax highlight

local function config()
  local extra_parsers = {
    "go",
    "gomod",
    "gowork",
    "gitignore",
    "gitcommit",
    "dockerfile",
    "c",
    "cpp",
    "cmake",
    "css",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "latex",
    "lua",
    "python",
    "rust",
    "typescript",
    "yaml",
    "tsx",
    "vue",
    "qmljs",
    "bash",
    "glsl",
    "hlsl",
    "graphql",
    "vala",
  }
  local parsers = {}
  for _, parser in ipairs(extra_parsers) do
    table.insert(parsers, parser)
  end
  require("nvim-treesitter.configs").setup({
    -- One of "all", or a list of languages
    ensure_installed = parsers,

    -- List of parsers to ignore installing
    ignore_install = {},

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- list of language that will be disabled
      disable = {},

      -- Setting this to true will run `:h syntax` and
      -- tree-sitter at the same time. Set this to `true` if
      -- you depend on 'syntax' being enabled (like for
      -- indentation). Using this option may slow down your
      -- editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  })
end

local M = {
        'nvim-treesitter/nvim-treesitter',
        build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        config = config,
        dependencies = {
                'nvim-treesitter/playground',
        },
        event = "BufRead",
}

return M

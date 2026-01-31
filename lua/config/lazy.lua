require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        news = {
          lazyvim = true,
          neovim = true,
        },
      },
    },

    -- import/override with your plugins
    { import = "plugins.ai.sidekick" },
    { import = "plugins.coding.blink" },
    { import = "plugins.coding.yanky" },
    { import = "plugins.coding.crates" },
    { import = "plugins.editor.edgy" },
    { import = "plugins.editor.blink" },
    { import = "plugins.editor.fzf-lua" },
    { import = "plugins.editor.render-markdown" },
    { import = "plugins.editor.checkmate" },
    { import = "plugins.editor.smartyank" },
    { import = "plugins.editor.diffview" },
    { import = "plugins.editor.snacks" },
    { import = "plugins.lsp.clangd" },
    { import = "plugins.lsp.qml" },
    { import = "plugins.ui.colorscheme" },
    { import = "plugins.ui.noice" },
    { import = "plugins.ui.dashboard" },
    { import = "plugins.ui.glimmer" },
    { import = "plugins.ui.mason" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  ui = {
    border = "rounded",
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})

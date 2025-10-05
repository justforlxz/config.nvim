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
    { import = "lxz.plugins.coding.blink" },
    { import = "lxz.plugins.coding.yanky" },
    { import = "lxz.plugins.coding.crates" },
    { import = "lxz.plugins.editor.blink" },
    { import = "lxz.plugins.editor.fzf-lua" },
    { import = "lxz.plugins.editor.render-markdown" },
    { import = "lxz.plugins.lsp.mason" },
    { import = "lxz.plugins.ui.colorscheme" },
    { import = "lxz.plugins.ui.noice" },

    -- { import = "lxz.plugins.ai.avante" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
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
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

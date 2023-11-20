-- customize mason plugins

local function servers()
    local result = {
        "bashls",
        "clangd",
        "html",
        "jsonls",
        "lua_ls",
        "pyright",
        "gopls",
        "cmake",
        "rust_analyzer",
        "eslint",
        "tsserver",
        "tailwindcss",
        "volar",
    }

    local jit = require("jit")

    local function table_indexOf(t, value)
        for i, v in ipairs(t) do
            if v == value then
                return i
            end
        end
    end

    if jit.os == "Linux" and jit.arch == "arm64" then
        local index = table_indexOf(result, "clangd")
        if index then
            table.remove(result, index)
        end
    end

    return result
end

return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, servers())
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "prettier",
        -- "stylua",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "python",
      })
    end,
  },
}

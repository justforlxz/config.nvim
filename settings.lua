-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = true

settings["colorscheme"] = "catppuccin"

settings["format_on_save"] = false
settings["transparent_background"] = true

-- Servers in this list will skip setting formatting capabilities if rhs is true.
---@type table<string, boolean>
settings["server_formatting_block_list"] = {
    lua_ls = true,
    tsserver = true,
    clangd = true,
    pylsp = true,
}

-- Set the language servers that will be installed during bootstrap here.
-- check the below link for all the supported LSPs:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
---@type string[]
settings["lsp_deps"] = function(defaults)
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

-- Set the general-purpose servers that will be installed during bootstrap here
-- check the below link for all supported sources
-- in `code_actions`, `completion`, `diagnostics`, `formatting`, `hover` folders:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins
---@type string[]
settings["null_ls_deps"] = {
    "prettier",
    "rustfmt",
    "cmakelang",
    "beautysh",
    "shfmt",
    "clang_format",
}

settings["treesitter_deps"] = function(defaults)
    return {
        "bash",
        "c",
        "cpp",
        "css",
        "cmake",
        "glsl",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "hlsl",
        "javascript",
        "json",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "qmljs",
        "typescript",
        "vimdoc",
        "vue",
        "yaml",
    }
end

return settings

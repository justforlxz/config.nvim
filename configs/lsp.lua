local jit = require("jit")

local opts = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

-- aarch64 not has clangd
if jit.os == "Linux" and jit.arch == "arm64" then
    require("modules.configs.completion.servers.clangd")(opts)
end

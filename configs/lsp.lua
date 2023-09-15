local jit = require("jit")

-- aarch64 not has clangd
if jit.os == "Linux" and jit.arch == "arm64" then
	local opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}

	require("modules.configs.completion.servers.clangd")(opts)
end

if vim.fn.executable("qmlls") then
	local opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}

	require("user.configs.lsp-servers.qmlls")(opts)
end

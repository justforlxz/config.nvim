local lspconfig = require("lspconfig")

return function(options)
	require("lspconfig").qmlls.setup({
		cmd = { "qmlls" },
		filetypes = { "qmljs" },
		root_dir = function(fname)
			return lspconfig.util.find_git_ancestor(fname)
		end,
		single_file_support = true,
		on_attach = options.on_attach,
	})
end

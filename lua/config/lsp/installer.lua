local M = {}

function M.setup(servers, options)
	local lspconfig = require("lspconfig")
	local icons = require("config.icons")

	require("mason").setup({
		ui = {
			icons = {
				package_installed = icons.server_installed,
				package_pending = icons.server_pending,
				package_uninstalled = icons.server_uninstalled,
			},
		},
	})

	require("mason-tool-installer").setup({
		ensure_installed = {
			"codelldb",
			"stylua",
			"shfmt",
			"shellcheck",
			"black",
			"isort",
			"prettierd",
			"debugpy",
      "clangd",
			"clang-format",
      "cmake-language-server",
      "eslint-lsp",
      "cspell",
      "eslint_d",
      "flake8",
      "codespell",
      "shellharden",
      "ltex-ls",
		},
		auto_update = true,
		run_on_start = true,
	})

	require("mason-lspconfig").setup({
		ensure_installed = vim.tbl_keys(servers),
		automatic_installation = true,
	})

	-- Package installation folder
	local install_root_dir = vim.fn.stdpath("data") .. "/mason"

	require("mason-lspconfig").setup_handlers({
		function(server_name)
			local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})
			lspconfig[server_name].setup({ opts })
		end,
		["sumneko_lua"] = function()
			local opts = vim.tbl_deep_extend("force", options, servers["sumneko_lua"] or {})
			require("neodev").setup({ opts })
			-- then setup your lsp server as usual
			lspconfig.sumneko_lua.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})
		end,
		["rust_analyzer"] = function()
			local opts = vim.tbl_deep_extend("force", options, servers["rust_analyzer"] or {})

			-- DAP settings - https://github.com/simrat39/rust-tools.nvim#a-better-debugging-experience
			local extension_path = install_root_dir .. "/packages/codelldb/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
			require("rust-tools").setup({
				tools = {
					autoSetHints = false,
					executor = require("rust-tools/executors").toggleterm,
					hover_actions = {
						border = "solid",
					},
					on_initialized = function()
						vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
							pattern = { "*.rs" },
							callback = function()
								vim.lsp.codelens.refresh()
							end,
						})
					end,
				},
				server = opts,
				dap = {
					adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			})
		end,
		["tsserver"] = function()
			local opts = vim.tbl_deep_extend("force", options, servers["tsserver"] or {})
			require("typescript").setup({
				disable_commands = false,
				debug = false,
				server = opts,
			})
		end,
	})
end

return M

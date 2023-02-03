local formatting = require("modules.completion.formatting")

local nvim_lsp = require("lspconfig")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local util = require("lspconfig.util")

require("lspconfig.ui.windows").default_options.border = "single"

local icons = {
	ui = require("modules.ui.icons").get("ui", true),
	misc = require("modules.ui.icons").get("misc", true),
}

mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_pending = icons.ui.Modified_alt,
			package_installed = icons.ui.Check,
			package_uninstalled = icons.misc.Ghost,
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},
})

local servers = {
	clangd = {
		root_dir = util.root_pattern(
			".clangd",
			".clang-tidy",
			".clang-format",
			"compile_commands.json",
			"compile_flags.txt",
			"configure.ac",
			".git",
			"build"
		),
	},
	gopls = {},
	html = {},
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
			},
		},
	},
	pyright = {
		analysis = {
			typeCheckingMode = "off",
		},
	},
	-- pylsp = {}, -- Integration with rope for refactoring - https://github.com/python-rope/pylsp-rope
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				cargo = { allFeatures = true },
				checkOnSave = {
					command = "clippy",
					extraArgs = { "--no-deps" },
				},
			},
		},
	},
	sumneko_lua = {},
	tsserver = {
		disable_formatting = true,
		init_options = {
			preferences = {
				importModuleSpecifierPreference = "project-relative",
			},
		},
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
	},
	vimls = {},
	tailwindcss = {},
	yamlls = {
		schemastore = {
			enable = true,
		},
		settings = {
			yaml = {
				hover = true,
				completion = true,
				validate = true,
				schemas = require("schemastore").json.schemas(),
			},
		},
	},
	bashls = {},
}

local function custom_attach(client, bufnr)
	require("lsp_signature").on_attach({
		bind = true,
		use_lspsaga = false,
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hi_parameter = "Search",
		handler_opts = {
			border = "rounded",
		},
	})
end

local function switch_source_header_splitcmd(bufnr, splitcmd)
	bufnr = nvim_lsp.util.validate_bufnr(bufnr)
	local clangd_client = nvim_lsp.util.get_active_client_by_name(bufnr, "clangd")
	local params = { uri = vim.uri_from_bufnr(bufnr) }
	if clangd_client then
		clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
			if err then
				error(tostring(err))
			end
			if not result then
				vim.notify("Corresponding file can’t be determined", vim.log.levels.ERROR, { title = "LSP Error!" })
				return
			end
			vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
		end)
	else
		vim.notify(
			"Method textDocument/switchSourceHeader is not supported by any active server on this buffer",
			vim.log.levels.ERROR,
			{ title = "LSP Error!" }
		)
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Override server settings here
local options = {
	on_attach = custom_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}

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
		--"cspell",
		"eslint_d",
		"flake8",
		--"codespell",
		"shellharden",
		"ltex-ls",
	},
	auto_update = true,
	run_on_start = true,
})

mason_lsp.setup({
	ensure_installed = vim.tbl_keys(servers),
	automatic_installation = true,
})

mason_lsp.setup_handlers({
	function(server_name)
		local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})
		nvim_lsp[server_name].setup({ opts })
	end,
	["sumneko_lua"] = function()
		local opts = vim.tbl_deep_extend("force", options, servers["sumneko_lua"] or {})
		require("neodev").setup({ opts })
		-- then setup your lsp server as usual
		nvim_lsp.sumneko_lua.setup({
			capabilities = capabilities,
			on_attach = custom_attach,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Setup your lua path
						path = vim.split(package.path, ";", {}),
					},
					completion = {
						callSnippet = "Replace",
					},
					diagnostics = { globals = { "vim", "describe", "it", "before_each", "after_each" } },
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
						checkThirdParty = false, --  https://github.com/neovim/nvim-lspconfig/issues/1700#issuecomment-1033127328
					},
					telemetry = { enable = false },
				},
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
	["gopls"] = function()
		nvim_lsp.gopls.setup({
			on_attach = custom_attach,
			flags = { debounce_text_changes = 500 },
			capabilities = capabilities,
			cmd = { "gopls", "-remote=auto" },
			settings = {
				gopls = {
					usePlaceholders = true,
					analyses = {
						nilness = true,
						shadow = true,
						unusedparams = true,
						unusewrites = true,
					},
				},
			},
		})
	end,
	["clangd"] = function()
		nvim_lsp.clangd.setup({
			capabilities = vim.tbl_deep_extend("keep", { offsetEncoding = { "utf-16", "utf-8" } }, capabilities),
			single_file_support = true,
			on_attach = custom_attach,
			cmd = {
				"clangd",
				"--background-index",
				"--pch-storage=memory",
				-- You MUST set this arg ↓ to your c/cpp compiler location (if not included)!
				"--query-driver=/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
				"--clang-tidy",
				"--all-scopes-completion",
				"--completion-style=detailed",
				"--header-insertion-decorators",
				"--header-insertion=iwyu",
			},
			commands = {
				ClangdSwitchSourceHeader = {
					function()
						switch_source_header_splitcmd(0, "edit")
					end,
					description = "Open source/header in current buffer",
				},
				ClangdSwitchSourceHeaderVSplit = {
					function()
						switch_source_header_splitcmd(0, "vsplit")
					end,
					description = "Open source/header in a new vsplit",
				},
				ClangdSwitchSourceHeaderSplit = {
					function()
						switch_source_header_splitcmd(0, "split")
					end,
					description = "Open source/header in a new split",
				},
			},
		})
	end,
	["jsonls"] = function()
		nvim_lsp.jsonls.setup({
			flags = { debounce_text_changes = 500 },
			capabilities = capabilities,
			on_attach = custom_attach,
			settings = {
				json = {
					-- Schemas https://www.schemastore.org
					schemas = {
						{
							fileMatch = { "package.json" },
							url = "https://json.schemastore.org/package.json",
						},
						{
							fileMatch = { "tsconfig*.json" },
							url = "https://json.schemastore.org/tsconfig.json",
						},
						{
							fileMatch = {
								".prettierrc",
								".prettierrc.json",
								"prettier.config.json",
							},
							url = "https://json.schemastore.org/prettierrc.json",
						},
						{
							fileMatch = { ".eslintrc", ".eslintrc.json" },
							url = "https://json.schemastore.org/eslintrc.json",
						},
						{
							fileMatch = {
								".babelrc",
								".babelrc.json",
								"babel.config.json",
							},
							url = "https://json.schemastore.org/babelrc.json",
						},
						{
							fileMatch = { "lerna.json" },
							url = "https://json.schemastore.org/lerna.json",
						},
						{
							fileMatch = {
								".stylelintrc",
								".stylelintrc.json",
								"stylelint.config.json",
							},
							url = "http://json.schemastore.org/stylelintrc.json",
						},
						{
							fileMatch = { "/.github/workflows/*" },
							url = "https://json.schemastore.org/github-workflow.json",
						},
					},
				},
			},
		})
	end,
	["html"] = function()
		-- https://github.com/vscode-langservers/vscode-html-languageserver-bin
		nvim_lsp.html.setup({
			cmd = { "html-languageserver", "--stdio" },
			filetypes = { "html" },
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embeddedLanguages = { css = true, javascript = true },
			},
			settings = {},
			single_file_support = true,
			flags = { debounce_text_changes = 500 },
			capabilities = capabilities,
			on_attach = custom_attach,
		})
	end,
})

-- TODO not working on react
-- https://github.com/neovim/neovim/issues/20457#issuecomment-1266782345
-- notify always show No information available
-- vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
-- 	local function notify_filter()
-- 		local banned_messages = { "No information available" }
-- 		vim.notify = function(msg, ...)
-- 			for _, banned in ipairs(banned_messages) do
-- 				if msg == banned then
-- 					return
-- 				end
-- 			end
-- 			require("notify")(msg, ...)
-- 		end
-- 	end
--
-- 	config = config or {}
-- 	config.focus_id = ctx.method
-- 	if not (result and result.contents) then
-- 		return
-- 	end
-- end

require("modules.completion.null-ls").setup(options)
require("modules.completion.inlay-hints").setup()

formatting.configure_format_on_save()

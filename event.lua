vim.api.nvim_command("au BufNewFile,BufRead *.qml setfiletype qmljs")

local definitions = {
	-- Example
	bufs = {
		{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
	},
}

return definitions

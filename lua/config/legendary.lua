local M = {}

local keymap = vim.keymap.set
local default_opts = {
	noremap = true,
	silent = true,
}

function M.setup()
	require("legendary").setup({
		include_builtin = true,
		auto_register = true,
	})
	keymap("n", "<A-p>", "<cmd>lua require('legendary').find()<CR>", default_opts)
end

return M

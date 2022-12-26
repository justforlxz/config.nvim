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
    commands = {
       { ':SayHello', function() print('hello world!') end, description = 'Say hello as a command' },
    },
	})
	keymap("n", "<C-h>", "<cmd>lua require('legendary').find()<CR>", default_opts)
end

return M

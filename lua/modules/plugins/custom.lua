local custom = {}

custom["lambdalisue/suda.vim"] = {
	cmd = {
		"SudaRead",
		"SudaWrite",
	},
}

custom["preservim/nerdcommenter"] = {
	config = require("custom.commenter"),
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
}

return custom

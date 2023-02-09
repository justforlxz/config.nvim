local custom = {}

custom["iamcco/markdown-preview.nvim"] = {
	build = "cd app && yarn install",
	ft = "md",
}

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

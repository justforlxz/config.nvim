local plugin = {}

plugin["mrjones2014/smart-splits.nvim"] = {
	build = "./kitty/install-kittens.bash",
	config = function()
		require("smart-splits").setup({})
	end,
}

return plugin

--- 命令提示框

return {
	"mrjones2014/legendary.nvim",
	opt = true,
	--	keys = { [[<C-p>]] },
	wants = { "dressing.nvim" },
	module = { "legendary" },
	cmd = { "Legendary" },
	config = function()
		require("config.legendary").setup()
	end,
	requires = { "stevearc/dressing.nvim" },
}

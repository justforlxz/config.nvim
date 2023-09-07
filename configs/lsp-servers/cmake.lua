-- https://kgithub.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/cmake.lua
return {
	cmd = { "cmake-language-server" },
	filetypes = { "cmake" },
	single_file_support = true,
	init_options = {
		buildDirectory = "build",
	},
}

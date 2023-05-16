local tool = {}

tool["preservim/nerdcommenter"] = {
    config = require("tool.comment")
}

tool["tpope/vim-fugitive"] = {
    config = require("tool.git"),
    dependencies = { -- GBrowser handlers
    { -- https://github.com/tpope/vim-rhubarb
    'tpope/vim-rhubarb', -- github
    -- https://github.com/borissov/fugitive-gitea
    'borissov/fugitive-gitea', -- gitea
    -- https://github.com/shumphrey/fugitive-gitlab.vim
    'shumphrey/fugitive-gitlab.vim' -- gitlab
    }, {
        -- https://github.com/lewis6991/gitsigns.nvim
        'lewis6991/gitsigns.nvim', -- sign column diff mark
        requires = {'nvim-lua/plenary.nvim'}
    }}
}

tool["lambdalisue/suda.vim"] = {}

tool["nvim-telescope/telescope.nvim"] = {
    lazy = true,
    cmd = "Telescope",
    config = require("tool.telescope"),
    dependencies = {'nvim-lspconfig', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim'}
}

tool["folke/todo-comments.nvim"] = {
    lazy = true,
    dependencies = {"nvim-lua/plenary.nvim"}
}

tool["voldikss/vim-translator"] = {
    lazy = true,
    config = require("tool.translator")
}

tool["nvim-neo-tree/neo-tree.nvim"] = {
    config = require("tool.tree"),
    branch = "v2.x",
    dependencies = { -- https://github.com/kyazdani42/nvim-web-devicons
    'kyazdani42/nvim-web-devicons', -- icon
    'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim'}
}

tool["itchyny/vim-highlighturl"] = {}

tool["akinsho/toggleterm.nvim"] = {
	lazy = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
	config = require("tool.toggleterm"),
}

tool["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("tool.trouble"),
}

return tool

-- https://github.com/nvim-treesitter/nvim-treesitter
-- Description:
-- better syntax highlight
return {
    "nvim-treesitter/nvim-treesitter",
    run = function()
        require("nvim-treesitter.install").prefer_git = true
        require("nvim-treesitter.install").update({
            with_sync = true
        })
    end,
    config = function()
        require("config.treesitter").setup()
    end,
    requires = {
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "BufReadPre"
    }, {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter"
    }, {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "BufReadPre"
    }, {
        "p00f/nvim-ts-rainbow",
        event = "BufReadPre"
    }, {
        "RRethy/nvim-treesitter-textsubjects",
        event = "BufReadPre"
    },
     {
        "nvim-treesitter/playground",
        cmd = {"TSPlaygroundToggle"}
    },
    {
      "lewis6991/spellsitter.nvim",
      config = function()
        require("spellsitter").setup()
      end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPre",
    }, {
        "mfussenegger/nvim-treehopper",
        module = {"tsht"},
    }, {
        "m-demare/hlargs.nvim",
        config = function()
            require("config.hlargs").setup()
        end,
    }, {
        "AckslD/nvim-FeMaco.lua",
        config = function()
            require("femaco").setup()
        end,
        ft = {"markdown"},
        cmd = {"Femaco"},
        module = {"femaco_edit"},
    }, {
        "yioneko/nvim-yati",
        event = "BufReadPre",
    }}
}

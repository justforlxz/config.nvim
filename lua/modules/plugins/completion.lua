local completion = {}

completion["neovim/nvim-lspconfig"] = {
    lazy = true,
    event = {"BufReadPost", "BufAdd", "BufNewFile"},
    config = require("completion.lsp"),
    dependencies = {{"ray-x/lsp_signature.nvim"}, {"williamboman/mason.nvim"}, {"williamboman/mason-lspconfig.nvim"}, {
        "nvimdev/lspsaga.nvim",
        config = require("completion.lspsaga"),
        cmd = "Lspsaga"
    }}
}
completion["jose-elias-alvarez/null-ls.nvim"] = {
    lazy = true,
    event = {"CursorHold", "CursorHoldI"},
    config = require("completion.null-ls"),
    dependencies = {"nvim-lua/plenary.nvim", "jay-babu/mason-null-ls.nvim"}
}
completion["hrsh7th/nvim-cmp"] = {
    lazy = true,
    event = "InsertEnter",
    config = require("completion.cmp"),
    dependencies = {{
        "L3MON4D3/LuaSnip",
        dependencies = {"rafamadriz/friendly-snippets"},
        config = require("completion.luasnip")
    }, {"lukas-reineke/cmp-under-comparator"}, {"saadparwaiz1/cmp_luasnip"}, {"hrsh7th/cmp-nvim-lsp"},
                    {"hrsh7th/cmp-nvim-lua"}, {"andersevenrud/cmp-tmux"}, {"hrsh7th/cmp-path"}, {"f3fora/cmp-spell"},
                    {"hrsh7th/cmp-buffer"}, {"kdheepak/cmp-latex-symbols"}, {"ray-x/cmp-treesitter"}}
}
completion["zbirenbaum/copilot.lua"] = {
    lazy = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = require("completion.copilot"),
    dependencies = {{
        "zbirenbaum/copilot-cmp",
        config = require("completion.copilot-cmp")
    }}
}

completion["RRethy/vim-illuminate"] = {
    lazy = true,
    config = require("completion.illuminate"),
    dependencies = {'neovim/nvim-lspconfig'}
}

completion["aklt/plantuml-syntax"] = {
    lazy = true
}

completion["SirVer/ultisnips"] = {
    lazy = true,
    dependencies = 'honza/vim-snippets'
}

return completion

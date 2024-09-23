return {
    "mrjones2014/smart-splits.nvim",
    keys = {
        {
            "<A-h>",
            function() require("smart-splits").resize_left() end,
            "n",
            desc = "Resize window to the left"
        },
        {
            "<A-j>",
            function() require("smart-splits").resize_down() end,
            "n",
            desc = "Resize window downward"
        },
        {
            "<A-k>",
            function() require("smart-splits").resize_up() end,
            "n",
            desc = "Resize window upward"
        },
        {
            "<A-l>",
            function() require("smart-splits").resize_right() end,
            "n",
            desc = "Resize window to the right"
        },
        {
            "<C-h>",
            function() require("smart-splits").move_cursor_left() end,
            "n",
            desc = "Move cursor to the left window"
        },
        {
            "<C-j>",
            function() require("smart-splits").move_cursor_down() end,
            "n",
            desc = "Move cursor to the lower window"
        },
        {
            "<C-k>",
            function() require("smart-splits").move_cursor_up() end,
            "n",
            desc = "Move cursor to the upper window"
        },
        {
            "<C-l>",
            function() require("smart-splits").move_cursor_right() end,
            "n",
            desc = "Move cursor to the right window"
        },
        {
            "<C-\\>",
            function() require("smart-splits").move_cursor_previous() end,
            "n",
            desc = "Move cursor to the previous window"
        },
        {
            "<leader><leader>h",
            function() require("smart-splits").swap_buf_left() end,
            "n",
            desc = "Swap buffer with left window"
        },
        {
            "<leader><leader>j",
            function() require("smart-splits").swap_buf_down() end,
            "n",
            desc = "Swap buffer with lower window"
        },
        {
            "<leader><leader>k",
            function() require("smart-splits").swap_buf_up() end,
            "n",
            desc = "Swap buffer with upper window"
        },
        {
            "<leader><leader>l",
            function() require("smart-splits").swap_buf_right() end,
            "n",
            desc = "Swap buffer with right window"
        }
    },
    build = "./kitty/install-kittens.bash"
}

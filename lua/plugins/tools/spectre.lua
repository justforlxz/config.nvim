return {
  "nvim-pack/nvim-spectre",
  keys = {
    {
      "<leader>s",
      function()
        require("spectre").toggle()
      end,
      mode = "n",
      desc = "Toggle Spectre",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      mode = "n",
      desc = "Search current word",
    },
    {
      "<leader>sw",
      '<esc><cmd>lua require("spectre").open_visual()<CR>',
      mode = "v",
      desc = "Search current word",
    },
    {
      "<leader>sp",
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      mode = "n",
      desc = "Search on current file",
    },
  },
  opts = {
    find_engine = {
      -- rg is map with finder_cmd
      ["rg"] = {
        cmd = "rg",
        -- default args
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        options = {
          ["ignore-case"] = {
            value = "--ignore-case",
            icon = "[I]",
            desc = "ignore case",
          },
          ["hidden"] = {
            value = "--hidden",
            desc = "hidden file",
            icon = "[H]",
          },
          ["word"] = {
            value = "--word-regexp",
            desc = "word regexp",
            icon = "[W]",
          },
          -- you can put any rg search option you want here it can toggle with
          -- show_option function
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

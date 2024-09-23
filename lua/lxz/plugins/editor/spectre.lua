return {
  "nvim-pack/nvim-spectre",
  keys = {
    {
      "<leader>s",
      function()
        require("spectre").toggle()
      end,
      "n",
      desc = "Toggle Spectre",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({
          select_word = true,
        })
      end,
      "n",
      desc = "Search current word",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual()
      end,
      "v",
      desc = "Search current word",
    },
    {
      "<leader>sp",
      function()
        require("spectre").open_file_search({
          select_word = true,
        })
      end,
      "n",
      desc = "Search on current file",
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
}

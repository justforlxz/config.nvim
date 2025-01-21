vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

return {
  {
    "NvChad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  "nvchad/volt",
  "nvchad/minty",
  {
    "NvChad/ui",
    event = "UIEnter",
    config = function()
      for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
        dofile(vim.g.base46_cache .. v)
      end

      local map = vim.keymap.set
      map("n", "<leader>ch", "<CMD>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })
      map({ "n", "t" }, "<A-d>", function()
        require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
      end, { desc = "Terminal Toggle floating term" })
      map("n", "<S-l>", function()
        require("nvchad.tabufline").next()
      end, { desc = "Buffer goto next" })

      map("n", "<S-h>", function()
        require("nvchad.tabufline").prev()
      end, { desc = "Buffer goto prev" })

      map({ "n", "i" }, "<A-q>", function()
        require("nvchad.tabufline").close_buffer()
      end, { desc = "Buffer Close" })

      map("n", "<leader>th", function()
        require("nvchad.themes").open()
      end, { desc = "telescope nvchad themes" })

      map("n", "<leader>cp", function()
        require("minty.huefy").open({ border = true })
      end)

      require("nvchad")
    end,
  },
}

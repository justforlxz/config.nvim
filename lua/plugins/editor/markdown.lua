return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    file_types = { "markdown", "vimwiki" },
    latex = { enabled = false },
  },
  ft = { "markdown", "vimwiki" },
  config = function(_, opts)
    vim.treesitter.language.register("markdown", "vimwiki")
  end,
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
}

return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    file_types = { "markdown", "vimwiki", "Avante" },
    latex = { enabled = false },
  },
  ft = { "markdown", "vimwiki", "Avante" },
  config = function(_, opts)
    vim.treesitter.language.register("markdown", "vimwiki")
  end,
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
}

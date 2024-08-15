local M = {
  "qmljs",
  "markdown",
  "markdown_inline",
  "lua",
  "python",
  "rust",
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, M)
    end
  end,
}

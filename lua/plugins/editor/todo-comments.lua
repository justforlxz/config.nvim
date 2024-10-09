return {
  "folke/todo-comments.nvim",
  event = "BufReadPost",
  config = function(_, opts)
    local cache_dir = vim.g.base46_cache .. "todo"
    if vim.g.base46_cache and vim.uv.fs_stat(cache_dir) then
      dofile(cache_dir)
    end

    require("todo-comments").setup(opts)
  end,
}

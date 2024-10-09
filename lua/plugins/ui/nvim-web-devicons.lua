return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      local cache_dir = vim.g.base46_cache .. "devicons"
      if vim.g.base46_cache and vim.uv.fs_stat(cache_dir) then
        dofile(cache_dir)
      end

      return { override = require("nvchad.icons.devicons") }
    end,
  },
}

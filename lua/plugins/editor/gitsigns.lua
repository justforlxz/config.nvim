return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    preview_config = {
      border = "rounded",
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end
      map("n", "]g", gs.next_hunk, "Gitsigns Next Hunk")
      map("n", "[g", gs.prev_hunk, "Gitsigns Prev Hunk")
      map("n", "<leader>gs", gs.stage_hunk, "Gitsigns Stage Hunk")
      map("n", "<leader>gu", gs.undo_stage_hunk, "Gitsigns Undo Stage Hunk")
      map("n", "<leader>gr", gs.reset_hunk, "Gitsigns Reset Hunk")
      map("n", "<leader>gR", gs.reset_buffer, "Gitsigns Reset Buffer")
      map("n", "<leader>gp", gs.preview_hunk, "Gitsigns Preview Hunk")
      map("n", "<leader>gb", gs.blame_line, "Gitsigns Blame Line")
      map("n", "<leader>td", gs.toggle_deleted, "Gitsigns Toggle deleted")
      map("v", "<leader>gr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Gitsigns Reset Hunk")
      map("v", "<leader>gs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Gitsigns Stage Hunk")
    end,
  },
  config = function(_, opts)
    local cache_dir = vim.g.base46_cache .. "git"
    if vim.g.base46_cache and vim.uv.fs_stat(cache_dir) then
      dofile(cache_dir)
    end

    require("gitsigns").setup(opts)
  end,
}

local options = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "󰍵" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "│" },
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    local map = vim.keymap.set

    map("n", "]g", gs.next_hunk, opts "Gitsigns Next Hunk")
    map("n", "[g", gs.prev_hunk, opts "Gitsigns Prev Hunk")
    map("n", "<leader>gs", gs.stage_hunk, opts "Gitsigns Stage Hunk")
    map("n", "<leader>gu", gs.undo_stage_hunk, opts "Gitsigns Undo Stage Hunk")
    map("n", "<leader>gr", gs.reset_hunk, opts "Gitsigns Reset Hunk")
    map("n", "<leader>gR", gs.reset_buffer, opts "Gitsigns Reset Buffer")
    map("n", "<leader>gp", gs.preview_hunk, opts "Gitsigns Preview Hunk")
    map("n", "<leader>gb", gs.blame_line, opts "Gitsigns Blame Line")
    map("n", "<leader>td", gs.toggle_deleted, opts "Gitsigns Toggle deleted")
    map("v", "<leader>gr", function()
      gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, opts "Gitsigns Reset Hunk")
    map("v", "<leader>gs", function()
      gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, opts "Gitsigns Stage Hunk")
  end,
}

return options

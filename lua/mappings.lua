require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n", "<A-i>")
unmap("t", "<A-i>")
unmap("n", "<leader>x")
unmap("n", "<leader>h")
unmap("n", "<leader>v")
unmap("n", "<leader>fm")
unmap("n", "<leader>fw")
unmap("n", "<leader>fa")
unmap("n", "<leader>fb")
unmap("n", "<leader>ff")
unmap("n", "<leader>fh")
unmap("n", "<leader>fo")
unmap("n", "<leader>fz")
unmap("n", "<leader>ds")

-- general
map("i", "jk", "<ESC>")
map({ "n", "v" }, ";", ":", { desc = "Nvim CMD enter command mode" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Nvim Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Nvim Move line up" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "<C-s>", "<Esc><CMD>w!<CR>", { desc = "File Save file" })
map("n", "<A-S-q>", "<CMD>q!<CR>", { desc = "Nvim Force quit" })
map("i", "<A-S-q>", "<Esc><CMD>q!<CR>", { desc = "Nvim Force quit" })

map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
-- plugins
-- fonform
map({ "n", "i", "v" }, "<A-f>", function()
  if require("conform").format { lsp_fallback = true } then
    vim.notify("File format applied", vim.log.levels.INFO)
  end
end, { desc = "File Format with conform" })

-- terminal
map({ "n", "t" }, "<A-d>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

-- bufline
map({ "n", "i" }, "<A-q>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

-- telescope
map("n", "fs", "<CMD>Telescope grep_string<CR>", { desc = "Telescope Find current word" })
map("n", "fd", "<CMD>Telescope diagnostics<CR>", { desc = "Telescope Find workspace diagnostics" })
map("n", "fr", "<CMD>Telescope resume<CR>", { desc = "Telescope Resume" })
map("n", "fk", "<CMD>Telescope keymaps<CR>", { desc = "Telescope Find keymaps" })
map("n", "ff", "<CMD>Telescope find_files<CR>", { desc = "Telescope Find files" })
map("n", "fw", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Telescope Live grep" })

-- suda
map("n", "<A-s>", "<CMD>SudaWrite<CR>", { desc = "Suda Save file using sudo" })
map("i", "<A-s>", "<Esc><CMD>SudaWrite<CR>", { desc = "Suda Save file using sudo" })

-- diffview
map("n", "dv", "<CMD>DiffviewOpen<CR>", { desc = "Diffview Open diff view" })
map("n", "dc", "<CMD>DiffviewClose<CR>", { desc = "Diffview Close diff view" })

-- markdown
map("n", "<F12>", function()
  require("render-markdown").toggle()
end, { desc = "Markdown Preview" })

-- trillspace
map("n", "<A-t>", function()
  require("mini.trailspace").trim()
end, { desc = "Tarilspace Trim all" })

-- spectre
map("n", "<leader>s", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

-- utf8

vim.api.nvim_set_option('ignorecase', true)
vim.opt.clipboard = vim.opt.clipboard + {'unnamedplus'}

-- tab size
-- FIXME use lua here
vim.cmd([[
  set updatetime=100
  set number
  set relativenumber
  set mouse=a
  set expandtab tabstop=2 shiftwidth=2 softtabstop=2
  au Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4
  au Filetype sh setlocal tabstop=4 shiftwidth=4 softtabstop=4
  au Filetype zsh setlocal tabstop=4 shiftwidth=4 softtabstop=4
  au Filetype c setlocal tabstop=8 shiftwidth=4 softtabstop=8
  au FileType json setlocal tabstop=4 shiftwidth=4 softtabstop=4
  au FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
  set cursorline " current line
  set hlsearch   " searched key word
  set colorcolumn=81
  set signcolumn=yes
  au Filetype gitcommit setlocal colorcolumn=72
  au Filetype go setlocal colorcolumn=""
]])

vim.g.python_path = "/opt/homebrew/opt/python/libexec/bin/python"
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

-- 设置 leader key
vim.g.mapleader = ";"

-- 新行对齐当前行，空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true
-- 使用增强状态栏后不再需要 vim 的模式提示
vim.o.showmode = true
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.o.wrap = true
vim.wo.wrap = true
-- 行结尾可以跳到下一行
vim.o.whichwrap = 'b,s,<,>,[,],h,l'

-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
-- 补全增强
vim.o.wildmenu = true

-- always show tabline
vim.o.showtabline = 2

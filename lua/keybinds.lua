-- FIXME use lua here

vim.keybinds = {
  gmap = vim.api.nvim_set_keymap,
  bmap = vim.api.nvim_buf_set_keymap,
  dgmap = vim.api.nvim_del_keymap,
  dbmap = vim.api.nvim_buf_del_keymap,
  opts = { noremap = true, silent = true }
}

vim.cmd([[
  let g:mapleader=";"
  " align to right                       https://unix.stackexchange.com/a/260277
  nnoremap <leader>r<tab> mc80A <esc>080lDgelD`cP
  " exit insert mode in terminal
  tnoremap <c-q><c-q> <c-\><c-n>
  " open terminal in new buffer
  noremap <silent> <leader>T :e term://.//zsh<cr>|
  " open global config file in new tab
  noremap <silent> <leader>vimrc :e ~/.config/nvim/init.lua<cr>
  " move cursor up-and-down when line warpped
  "    https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/clhv03p
  nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
  nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
  " mark
  nnoremap <silent> <leader>lm :marks<cr>
]])

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
vim.o.showmode = false
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.o.wrap = false
vim.wo.wrap = false
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

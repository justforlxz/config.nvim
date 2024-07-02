local autocmd = vim.api.nvim_create_autocmd

-- restore cursor position
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

autocmd("BufRead", {
  pattern = { "*.*" },
  callback = function(data)
    require("local-highlight").attach(data.buf)
  end,
})

autocmd("BufRead", {
  pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
  callback = function(data)
    local api = require "image"
    local pic_path = vim.api.nvim_buf_get_name(data.buf)
    local image = api.from_file(pic_path {
      buffer = data.buf, -- optional, binds image to a buffer (paired with window binding)
      with_virtual_padding = true, -- optional, pads vertically with extmarks, defaults to false

      -- optional, binds image to an extmark which it follows. Forced to be true when
      -- `with_virtual_padding` is true. defaults to false.
      inline = true,
    })
    image.render()
  end,
})

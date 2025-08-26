-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rust" },
  callback = function()
    vim.b.autoformat = true
  end,
})

-- Spell files auto-compilation
local function compile_spell_file(filepath)
  -- Only process .add files
  if not filepath:match("%.add$") then
    return
  end

  -- Compile the spell file
  vim.cmd("silent mkspell! " .. vim.fn.fnameescape(filepath))
end

-- Auto-compile spell files when written
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.add" },
  callback = function(ev)
    compile_spell_file(ev.file)
  end,
  desc = "Auto-compile spell files on save",
})

-- Auto-compile spell files when externally modified
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = { "*.add" },
  callback = function(ev)
    compile_spell_file(ev.file)
  end,
  desc = "Auto-compile spell files on external modification",
})

-- Check for missing .spl files on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    local spell_dir = vim.fn.stdpath("config") .. "/spell"
    if vim.fn.isdirectory(spell_dir) == 1 then
      local add_files = vim.fn.glob(spell_dir .. "/*.add", false, true)
      for _, add_file in ipairs(add_files) do
        local spl_file = add_file:gsub("%.add$", ".spl")
        if vim.fn.filereadable(spl_file) == 0 then
          compile_spell_file(add_file)
        end
      end
    end
  end,
  desc = "Generate missing .spl files for existing .add files",
})

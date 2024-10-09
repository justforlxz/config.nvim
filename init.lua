-- fuck arm64
-- 检查路径是否存在
local function path_exists(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "directory" or stat and stat.type == "file"
end

-- 创建软链
local function create_symlink(source, target)
  os.execute("ln -s " .. source .. " " .. target)
end

-- 创建目录
local function create_directory(directory)
  os.execute("mkdir -p " .. directory)
end

-- 启动时执行操作
local function setup_clangd()
  local clangd_path = "/usr/bin/clangd"
  local symlink_path = vim.fn.expand("~/.local/share/nvim/mason/bin/clangd")
  local directory_path = vim.fn.expand("~/.local/share/nvim/mason/packages/clangd")

  if path_exists(clangd_path) then
    if not path_exists(symlink_path) then
      create_symlink(clangd_path, symlink_path)
      vim.notify("Created symlink to clangd.")
    end

    if not path_exists(directory_path) then
      create_directory(directory_path)
      vim.notify("Created directory for clangd packages.")
    end
  else
    vim.notify("clangd is not installed.")
  end
end
-- 在启动时调用
local jit = require("jit")
if jit.os == "Linux" and jit.arch == "arm64" then
  setup_clangd()
end

-- bootstrap lazy.nvim, LazyVim and your plugins
vim.uv = vim.uv or vim.loop

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.api.nvim_echo({ { "Initializing, please wait..." } }, true, {})
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("configs.options")
require("configs.autocmds")
require("configs.mappings")

require("lazy").setup(require("configs").lazy_config)

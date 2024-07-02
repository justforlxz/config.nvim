local global = {}
local os_name = vim.loop.os_uname().sysname

function global:load_variables()
  self.is_mac = os_name == "Darwin"
  self.is_linux = os_name == "Linux"
  self.is_windows = os_name == "Windows_NT"
  self.is_wsl = vim.fn.has "wsl" == 1
  self.vim_path = vim.fn.stdpath "config"
  local home = self.is_windows and os.getenv "USERPROFILE" or os.getenv "HOME"
  self.home = home
end

global:load_variables()

return global

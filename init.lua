-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local function filetype_config()
  -- filetype for plantuml
  vim.api.nvim_command "au BufNewFile,BufRead *.puml setfiletype puml"
  vim.api.nvim_command "au BufNewFile,BufRead *.pu setfiletype puml"
  vim.api.nvim_command "au BufNewFile,BufRead *.plantuml setfiletype puml"
  vim.api.nvim_command "au BufNewFile,BufRead *.uml setfiletype puml"
  vim.api.nvim_command "au BufNewFile,BufRead *.iuml setfiletype puml"
  -- filetype for qml
  vim.api.nvim_command "au BufNewFile,BufRead *.qml setfiletype qmljs"
end

local function platform_config()
  local uname = vim.loop.os_uname().sysname

  if uname == "Windows_NT" then
    vim.g.sqlite_clib_path = vim.fn.stdpath "config" .. "\\lib\\sqlite3.dll"
    local basecmd = "-NoLogo -MTA -ExecutionPolicy RemoteSigned"
    local ctrlcmd = "-Command [console]::InputEncoding = [console]::OutputEncoding = [System.Text.Encoding]::UTF8"
    vim.api.nvim_set_option_value("shell", vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell", {})
    vim.api.nvim_set_option_value("shellcmdflag", string.format("%s %s;", basecmd, ctrlcmd), {})
    vim.api.nvim_set_option_value("shellredir", "-RedirectStandardOutput %s -NoNewWindow -Wait", {})
    vim.api.nvim_set_option_value("shellpipe", "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode", {})
    vim.api.nvim_set_option_value("shellquote", nil, {})
    vim.api.nvim_set_option_value("shellxquote", nil, {})
  end
end

local function autocmd_config()
  function RestoreCursorPosition()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end

  if vim.fn.has "autocmd" then
    vim.cmd [[
    autocmd BufReadPost * lua RestoreCursorPosition()
  ]]
  end
end

local function load_core()
  platform_config()
  filetype_config()
  autocmd_config()
  require("custom.configs.format").configure_format_on_save()
  vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snips"
end

load_core()

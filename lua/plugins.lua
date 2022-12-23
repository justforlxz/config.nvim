local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "--single-branch", "https://github.com/folke/lazy.nvim.git",
                   lazypath})
end
vim.opt.runtimepath:prepend(lazypath)

local function init(dir)
    local use = require('packer').use
    local home = os.getenv('HOME')
    local plugins = io.popen('find ' .. '"' .. home .. '/.config/nvim/lua/' .. dir .. '"' .. ' -type f')
    if plugins == nil then
        return
    end

    local result = {}
    for plugin in plugins:lines() do
        local part1, part2 = string.match(plugin, home .. "/[.]config/nvim/lua/(.*)_(.*)[.]lua")
        if part1 ~= nil and part2 ~= nil then
            plugin = part1 .. '_' .. part2
        else
            plugin = ''
        end
        if plugin ~= '' then
            table.insert(result, require(plugin))
        end
    end

    return result
end

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

local steal = init('steal')
local plugins = init('plugins')
local result = {}

for _, v in pairs(steal) do
    table.insert(result, v)
end

for _, v in pairs(plugins) do
    table.insert(result, v)
end

require("lazy").setup(result)

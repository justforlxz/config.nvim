local M = {}

function M.setup()
    -- Indicate first time installation
    local packer_bootstrap = false

    -- packer.nvim configuration
    local conf = {
        profile = {
            enable = true,
            threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
        },

        display = {
            open_fn = function()
                return require("packer.util").float {
                    border = "rounded"
                }
            end
        }
    }

    -- Check if packer.nvim is installed
    -- Run PackerCompile if there are changes in this file
    local function packer_init()
        local fn = vim.fn
        local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
            packer_bootstrap = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                          install_path}
            vim.cmd [[packadd packer.nvim]]
        end

        -- Run PackerCompile if there are changes in this file
        -- vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
        local packer_grp = vim.api.nvim_create_augroup("packer_user_config", {
            clear = true
        })
        vim.api.nvim_create_autocmd({"BufWritePost"}, {
            pattern = "init.lua",
            command = "source <afile> | PackerCompile",
            group = packer_grp
        })
    end

    local function init(dir)
        local use = require("packer").use
        local home = os.getenv("HOME")
        local plugins = io.popen("find " .. '"' .. home .. "/.config/nvim/lua/" .. dir .. '"' .. " -type f")
        if plugins == nil then
            return
        end

        for plugin in plugins:lines() do
            local part1, part2 = string.match(plugin, home .. "/[.]config/nvim/lua/(.*)_(.*)[.]lua")
            if part1 ~= nil and part2 ~= nil then
                plugin = part1 .. "_" .. part2
            else
                plugin = ""
            end
            if plugin ~= "" then
                use(require(plugin))
            end
        end
        if packer_bootstrap then
            require("packer").sync()
        end
    end
    -- Init and start packer
    packer_init()
    local packer = require "packer"

    -- Performance
    -- pcall(require, "impatient")
    -- pcall(require, "packer_compiled")

    -- Plugins
    local function plugins(use)
        init("steal")
        init("plugins")
        require('plugins.lsp').setup(use)
        require('plugins.dap').setup(use)
        require('plugins.ui').setup(use)
        require('plugins.session').setup(use)
    end

    packer.init(conf)
    return packer.startup(plugins)
end

return M

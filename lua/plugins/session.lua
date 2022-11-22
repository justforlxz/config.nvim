local M = {}

function M.setup(use)
    use {
        "rmagatti/auto-session",
        opt = true,
        cmd = { "SaveSession", "RestoreSession" },
        requires = { "rmagatti/session-lens" },
        config = function()
          require("bad_practices").setup()
        end,
        disable = false,
      }
      use {
        "jedrzejboczar/possession.nvim",
        config = function()
          require("config.possession").setup()
        end,
        cmd = { "PossessionSave", "PosessionLoad", "PosessionShow", "PossessionList" },
        disable = true,
      }
      use {
        "tpope/vim-obsession",
        cmd = { "Obsess" },
        config = function()
          require("config.obsession").setup()
        end,
        disable = true,
      }
end

return M
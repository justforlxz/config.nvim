local M = {}

local icons = require "config.icons"

function M.setup()
    local notify = require "notify"
    notify.setup {
        background_colour = "#000000",
        icons = {
            ERROR = icons.diagnostics.Error,
            WARN = icons.diagnostics.Warning,
            INFO = icons.diagnostics.Information,
            DEBUG = icons.ui.Bug,
            TRACE = icons.ui.Pencil
        },
        level = 2,
        max_width = 80,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 5000,
        top_down = true,
        fps = 30,
    }
    vim.notify = notify
end

return M

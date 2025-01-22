-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@class ChadrcConfig
local M = {}

M.ui = {
  cmp = {
    icons_left = true, -- only for non-atom styles!
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = true, -- will work for css lsp too
      icon = "󱓻",
    },
  },
  telescope = { style = "bordered" }, -- borderless / bordered
  statusline = {
    theme = "vscode_colored",
    order = { "mode", "file", "git", "navic", "%=", "diagnostics", "cursor", "lsp", "cwd" },
    modules = {
      navic = function()
        if next(vim.lsp.get_clients()) == nil then
          return ""
        end
        local ok, navic = pcall(require, "nvim-navic")
        if not ok then
          return ""
        end
        return " %#StText# " .. navic.get_location()
      end,
      lsp = function()
        if rawget(vim, "lsp") then
          for _, client in ipairs(vim.lsp.get_clients()) do
            if client.attached_buffers[vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)] then
              local ok, icons = pcall(require, "nvim-web-devicons")
              if not ok then
                return "%#St_Lsp#" .. "   " .. client.name .. " "
              end
              local icon, hl = icons.get_icon_by_filetype(vim.bo.filetype, { default = false })
              if not icon then
                return "%#St_Lsp#" .. "   " .. client.name .. " "
              end
              return "%#" .. hl .. "#" .. icon .. " " .. client.name .. " "
            end
          end
        end

        return ""
      end,
      cursor = "%#St_pos_text# %l:%c  ",
    },
  },
}

M.nvdash = {
  load_on_startup = true,
  buttons = {
    { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
    { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
    { txt = "󱥚  Themes", keys = "Spc t h", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "Spc c h", cmd = "NvCheatsheet" },

    { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashLazy",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
  },
}

M.base46 = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "tokyonight" },
  transparency = true,
  integrations = {
    "notify",
    "todo",
    "navic",
    "rainbowdelimiters",
    "avante",
    "diffview",
    "git-conflict",
  },
  hl_override = {
    NvDashButtons = { fg = "yellow" },
    LspInlayHint = { bg = "NONE" },
  },
}

M.lsp = {
  signature = false,
  hover = false,
  semantic_tokens = false,
}

M.term = {
  -- hl = "Normal:term,WinSeparator:WinSeparator",
  float = {
    relative = "editor",
    row = 0,
    col = 0,
    width = 1,
    height = 1,
    border = "rounded",
  },
}

return M

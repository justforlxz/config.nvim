return function()
    local icons = {
        ui = require("modules.utils.icons").get("ui"),
        diagnostics = require("modules.utils.icons").get("diagnostics")
    }

    local opts = {
        options = {
            mode = "buffers",                    -- set to "tabs" to only show tabpages instead
            themable = true,                     -- allows highlight groups to be overriden i.e. sets highlights as default
            numbers = "none",
            close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
            right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
            left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
            middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
            indicator = {
                icon = '▎',                    -- this should be omitted if indicator style is not 'icon'
                style = 'none',
            },
            modified_icon = icons.ui.Modified,
            buffer_close_icon = icons.ui.Close,
            left_trunc_marker = icons.ui.Left,
            right_trunc_marker = icons.ui.Right,
            max_name_length = 16,
            max_prefix_length = 13, -- prefix used when a buffer is de-duplicated
            truncate_names = true,  -- whether or not tab names should be truncated
            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = false,
            -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = ""
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and icons.diagnostics.Error_alt
                        or (e == "warning" and icons.diagnostics.Warning_alt or icons.diagnostics.Information_alt)
                    s = s .. n .. sym .. " "
                end
                return s
            end,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true
                }
            },
            color_icons = true, -- whether or not to add the filetype icon highlights
            get_element_icon = function(element)
                -- element consists of {filetype: string, path: string, extension: string, directory: string}
                -- This can be used to change how bufferline fetches the icon
                -- for an element e.g. a buffer or a tab.
                -- e.g.
                local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
                return icon, hl
            end,
            show_buffer_icons = true, -- disable filetype icons for buffers
            show_buffer_close_icons = false,
            show_close_icon = false,
            show_tab_indicators = false,
            show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
            persist_buffer_sort = true,   -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style = { '|', '|' },
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            hover = {
                enabled = true,
                delay = 200,
                reveal = { 'close' }
            },
        },
    }

	if vim.g.colors_name == "catppuccin" then
		local cp = require("modules.utils").get_palette() -- Get the palette.

		local catppuccin_hl_overwrite = {
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "italic", "bold" },
				custom = {
					mocha = {
						-- Hint
						hint = { fg = cp.rosewater },
						hint_visible = { fg = cp.rosewater },
						hint_selected = { fg = cp.rosewater },
						hint_diagnostic = { fg = cp.rosewater },
						hint_diagnostic_visible = { fg = cp.rosewater },
						hint_diagnostic_selected = { fg = cp.rosewater },
					},
				},
			}),
		}

		opts = vim.tbl_deep_extend("force", opts, catppuccin_hl_overwrite)
	end

	require("bufferline").setup(opts)
end

-- https://github.com/voldikss/vim-translator

-- Description:
-- translator

local function config()
  local wk = require("which-key")
  local key_opts = {
    -- mode   Help        Affected                              Equivalent
    -- ''     mapmode-nvo Normal/Visual/Select/Operator-pending :map
    -- 'n'    mapmode-n	  Normal                                :nmap
    -- 'v'    mapmode-v   Visual/Select                         :vmap
    -- 's'    mapmode-s	  Select                                :smap
    -- 'x'    mapmode-x	  Visual                                :xmap
    -- 'o'    mapmode-o   Operator-pending                      :omap
    -- '!'    mapmode-ic  Insert/Command-line                   :map!
    -- 'i'    mapmode-i   Insert                                :imap
    -- 'l'    mapmode-l   Insert/Command-line/Lang-Arg          :lmap
    -- 'c'    mapmode-c   Command-line                          :cmap
    -- 't'    mapmode-t   Terminal                              :tmap
    mode = "v",
    prefix = "<leader>l",
  }

  wk.register({
    d = { ":'<,'>TranslateW", "TRANS:: look up google translate" },
  }, key_opts)

  vim.g.translator_default_engines = { "google" }
  vim.g.translator_window_type = "preview"
end

local M = {
  "voldikss/vim-translator",
  config = config,
}

return M

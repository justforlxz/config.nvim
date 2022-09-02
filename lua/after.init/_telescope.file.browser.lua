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
      mode    = "n",
      buffer  = 0, -- local mappings
      silent  = true, -- use `silent ` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
    }

    wk.register({
      ["<leader>e"] = {
        "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
        "TELE::FILE::Browser"
      }
    },
      key_opts
    )
end

return {
    config = config,
}
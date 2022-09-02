-- https://github.com/wbthomason/packer.nvim

-- Description:
-- plugin manager

local function config()
  local wk = require("which-key")

  wk.register({
    ["<space>"] = {
      p = {
        s = { '<cmd>PackerSync<cr>', "PACK:: update plugin" },
        c = { '<cmd>PackerCompile<cr>', "PACK:: compile plugin" },
      }
    }
  });
end

return {
  'wbthomason/packer.nvim',
  config = config,
}

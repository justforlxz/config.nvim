-- lsp->treesitter->indent
---@param bufnr number
---@return table
local function customizeSelector(bufnr)
  local function handleFallbackException(err, providerName)
    if type(err) == "string" and err:match "UfoFallbackException" then
      return require("ufo").getFolds(bufnr, providerName)
    else
      return require("promise").reject(err)
    end
  end

  return require("ufo")
    .getFolds(bufnr, "lsp")
    :catch(function(err)
      return handleFallbackException(err, "treesitter")
    end)
    :catch(function(err)
      return handleFallbackException(err, "indent")
    end)
end

local ft_providers = {
  vim = "indent",
  python = { "indent" },
  git = "",
  help = "",
  qf = "",
  fugitive = "",
  fugitiveblame = "",
  ["neo-tree"] = "",
}

return {
  open_fold_hl_timeout = 0,
  close_fold_kinds = { "imports", "comment", "region" },
  preview = {
    win_config = {
      border = { "", "─", "", "", "", "─", "", "" },
      winhighlight = "Normal:Folded",
      winblend = 10,
    },
    mappings = {
      scrollU = "<C-u>",
      scrollD = "<C-d>",
      jumpTop = "[",
      jumpBot = "]",
    },
  },

  -- Select the fold provider.
  provider_selector = function(_, filetype, _)
    return ft_providers[filetype] or customizeSelector
  end,

  -- Display text for folded lines.
  ---@param text table
  ---@param lnum integer
  ---@param endLnum integer
  ---@param width integer
  ---@return table
  fold_virt_text_handler = function(text, lnum, endLnum, width)
    local suffix = (" 󰁂 %d "):format(endLnum - lnum)
    local suf_width = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - suf_width

    local cur_width = 0
    for _, section in ipairs(text) do
      cur_width = cur_width + vim.fn.strdisplaywidth(section[1])
    end

    suffix = suffix .. (" "):rep(width - cur_width - vim.fn.strdisplaywidth(suffix) - 3)

    table.insert(text, { suffix, "Folded" })
    return text
  end,
}

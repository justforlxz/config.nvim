local function config()
  local compare = require('cmp.config.compare')
  local tabnine = require('cmp_tabnine.config')
  local lspkind = require('lspkind')

  local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
  }


  tabnine.setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
    ignored_file_types = {
      -- default is not to ignore
      -- uncomment to ignore in lua:
      -- lua = true
    },
    show_prediction_strength = false
  })

  require 'cmp'.setup {
    sources = {
      { name = 'cmp_tabnine' },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        require('cmp_tabnine.compare'),
        compare.offset,
        compare.exact,
        compare.score,
        compare.recently_used,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        maxwidth = 40, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function(entry, vim_item)
          vim_item.kind = lspkind.presets.default[vim_item.kind]

          local menu = source_mapping[entry.source.name]
          if entry.source.name == "cmp_tabnine" then
            if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
              menu = entry.completion_item.data.detail .. " " .. menu
            end
            vim_item.kind = ""
          end

          vim_item.menu = menu

          return vim_item
        end,
      }),
    },
  }
end

return {
  'tzachar/cmp-tabnine',
  build = './install.sh',
  dependencies = 'hrsh7th/nvim-cmp',
  config = config,
}

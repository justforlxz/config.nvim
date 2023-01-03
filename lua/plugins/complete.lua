-- https://github.com/hrsh7th/nvim-cmp

-- Description:
-- completion setup

local config = function()
  local compare = require("cmp.config.compare")
  local cmp = require("cmp")
  cmp.setup({
    confirmation = { default_behaviour = cmp.ConfirmBehavior.Replace },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        scrollbar = "║",
        autocomplete = {
          require("cmp.types").cmp.TriggerEvent.InsertEnter,
          require("cmp.types").cmp.TriggerEvent.TextChanged,
        },
      },
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        scrollbar = "║",
      },
    },
    experimental = {
      ghost_text = true,
    },
    mapping = {
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<tab>"] = cmp.mapping.select_next_item(),
      ["<S-tab>"] = cmp.mapping.select_prev_item(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp", priority = 8 },
      { name = "cmp_tabnine", priority = 8, max_item_count = 3 },
      { name = "path", priority = 6 },
      { name = "buffer", keyword_length = 5 },
      { name = "nvim_lua", priority = 5 },
      { name = "ultisnips", priority = 5 },
      {
        name = "look",
        priority = 4,
        keyword_length = 2,
        option = {
          convert_case = true,
          loud = true,
          --dict = '/usr/share/dict/words'
        },
      },
    }),
    formatting = {
      -- fields = { "kind", "menu", "abbr" },
      format = function(entry, vim_item)
        local kind_icons = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﰠ",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "塞",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "פּ",
          Event = "",
          Operator = "",
          TypeParameter = "",
        }
        --vim_item.kind = kind_icons[vim_item.kind]
        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
        if entry.source.name == "cmp_tabnine" then
          vim_item.kind = " TabNine"
          if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            vim_item.kind = " Probability (" .. entry.completion_item.data.detail .. ")"
          end
        end
        vim_item.menu = ({
          buffer = "[BUF]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[API]",
          path = "[PATH]",
          luasnip = "[SNIP]",
          npm = "[NPM]",
          neorg = "[NEORG]",
          cmp_tabnine = "[Tabnine]",
        })[entry.source.name]
        return vim_item
      end,
    },
    sorting = {
      priority_weight = 1,
      comparators = {
        require("cmp_tabnine.compare"),
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
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    "hrsh7th/cmp-nvim-lsp",
    -- https://github.com/hrsh7th/cmp-buffer
    "hrsh7th/cmp-buffer",
    -- https://github.com/hrsh7th/cmp-path
    "hrsh7th/cmp-path",
    -- https://github.com/hrsh7th/cmp-cmdline
    "hrsh7th/cmp-cmdline",
    -- https://github.com/quangnguyen30192/cmp-nvim-ultisnips
    "quangnguyen30192/cmp-nvim-ultisnips",
    -- https://github.com/octaltree/cmp-look
    "octaltree/cmp-look",
    "saadparwaiz1/cmp_luasnip",
  },
  config = config,
  event = "InsertEnter", 
}

return M

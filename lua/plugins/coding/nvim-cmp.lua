vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/snips"

local function cmp_opts()
  local cmp = require("cmp")

  local cmp_ui = {}
  local has_nvconfig, nvconfig = pcall(require, "nvconfig")
  if not has_nvconfig then
    cmp_ui = {
      icons = true,
      lspkind_text = true,
      style = "default",
    }
  else
    cmp_ui = nvconfig.ui.cmp
  end

  local has_format, format_kk = pcall(require, "nvchad.cmp.format")

  local cmp_style = cmp_ui.style
  local atom_styled = cmp_style == "atom" or cmp_style == "atom_colored"
  local fields = (atom_styled or cmp_ui.icons_left) and { "kind", "abbr", "menu" } or { "abbr", "kind", "menu" }

  local formatting_style = {
    fields = fields,

    format = function(entry, item)
      local icons = require("configs.lsp").icons.kinds

      item.menu = cmp_ui.lspkind_text and item.kind or ""
      item.menu_hl_group = atom_styled and "LineNr" or "CmpItemKind" .. (item.kind or "")

      item.kind = item.kind and icons[item.kind] .. " " or ""
      item.kind = cmp_ui.icons_left and item.kind or " " .. item.kind

      if atom_styled or cmp_ui.icons_left then
        item.menu = " " .. item.menu
      end

      if cmp_ui.format_colors.tailwind and has_format then
        format_kk.tailwind(entry, item)
      end

      return item
    end,
  }

  local function border(hl_name)
    return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
    }
  end

  local options = {
    completion = { completeopt = "menu,menuone" },
    formatting = formatting_style,
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      completion = {
        border = atom_styled and "none" or border("CmpBorder"),
      },

      documentation = {
        border = border("CmpDocBorder"),
      },
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),

      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          require("luasnip").expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          require("luasnip").jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },

    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  }

  return options
end

return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    {
      -- snippet plugin
      "L3MON4D3/LuaSnip",
      -- autopairing of (){}[] etc
      "windwp/nvim-autopairs",
    },
    -- cmp sources plugins
    {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },
  opts = cmp_opts,
  config = function(_, opts)
    local cache_dir = vim.g.base46_cache .. "cmp"
    if vim.g.base46_cache and vim.uv.fs_stat(cache_dir) then
      dofile(cache_dir)
    end

    local cmp = require("cmp")
    cmp.setup(opts)
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
  end,
}

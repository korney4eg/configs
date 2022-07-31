local cmp = require("cmp")
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}
cmp.setup({
  snippet = { expand = function(args) end },
  mapping = {
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-m>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "spell", max_item_count = 20, insert = true },
    { name = "path" },
    { name = "buffer" }
  },
  formatting = {
    format = function(entry, vim_item)

      -- set a name for each source
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)

      -- vim_item.menu = ({
      --   buffer = "[Buffer]",
      --   emoji = "[Emoji]",
      --   nvim_lsp = "[LSP]",
      --   path = "[Path]",
      --   spell = "[Spell]",
      --   treesitter = "[Treesitter]",
      --   nvim_lua = "[Neovim]",
      -- })[entry.source.name]
      return vim_item
    end,
  },
})

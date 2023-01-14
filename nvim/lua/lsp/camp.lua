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
 local has_words_before = function()
   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
 end

 local luasnip = require("luasnip")
 local cmp = require("cmp")
 cmp.setup({
   snippet = {expand = function(args)
         require'luasnip'.lsp_expand(args.body)
       end},
   mapping = {
     -- ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
     -- ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
     ["<C-f>"] = cmp.mapping.scroll_docs(4),
     ["<C-m>"] = cmp.mapping.complete(),
     ["<C-e>"] = cmp.mapping.close(),
     ["<Tab>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
       }),
 		["<C-n>"] = cmp.mapping(function(fallback)
       if cmp.visible() then
         cmp.select_next_item()
       elseif luasnip.expand_or_jumpable() then
         luasnip.expand_or_jump()
       elseif has_words_before() then
         cmp.complete()
       else
         fallback()
       end
     end, { "i", "s" }),

     ["<C-p>"] = cmp.mapping(function(fallback)
       if cmp.visible() then
         cmp.select_prev_item()
       elseif luasnip.jumpable(-1) then
         luasnip.jump(-1)
       else
         fallback()
       end
     end, { "i", "s" }),
   },
   sources = {
     { name = "nvim_lsp" },
     { name = "spell", max_item_count = 20, insert = true },
     { name = "path" },
     { name = 'luasnip' },
     { name = "buffer" }
   },
 	completion = {
     completeopt = 'menu,menuone,noinsert',
     autocomplete = true
   },
   formatting = {
     format = function(entry, vim_item)

       -- set a name for each source
       vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
       return vim_item
     end,
   },
 })

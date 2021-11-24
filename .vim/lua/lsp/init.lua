local cmp = require'cmp'
require('lsp.color')

cmp.setup({
    snippet = {
      expand = function(args)
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'buffer' },
    }
  })

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_position_diagnostics({focusable=false})]]

require'lspconfig'.groovyls.setup{
  cmd = { "java", "-jar", "~/.cache/nvim/lspconfig/groovyls/groovy-language-server/build/libs/groovy-language-server-all.jar" },
  -- on_attach=require'completion'.on_attach,
  -- settings = {
  --   groovy = {
  --     classpath = { 
  --           "/usr/local/Cellar/groovy/3.0.8/libexec/lib/jenkins.war",
  --     }
  --   },
  -- },
  filetypes = { "groovy" }
}

require'lspconfig'.bashls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
require'lspconfig'.gopls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
require'lspconfig'.vimls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
require'lspconfig'.pylsp.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
require'lspconfig'.terraformls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
require'lspconfig'.dockerls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
require'lspconfig'.html.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

local nvim_lsp = require('lspconfig')

nvim_lsp["yamlls"].setup {
  settings = {
    yaml = {
      schemas = { 
            ["/Users/aliaksei.karneyeu/configs/.vim/lsp_rules/cloudbuild.json"] = ".ci/cloudbuild*.yaml", -- cloudbuild configuration
            ["/Users/aliaksei.karneyeu/configs/.vim/lsp_rules/hadolint.json"] = ".hadolint.yaml",

      }
    },
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}


local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

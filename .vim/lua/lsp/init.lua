require'lspconfig'.groovyls.setup{
  cmd = { "java", "-jar", "~/.cache/nvim/lspconfig/groovyls/groovy-language-server/build/libs/groovy-language-server-all.jar" },
  on_attach=require'completion'.on_attach,
  settings = {
    groovy = {
      classpath = { 
            "/usr/local/Cellar/groovy/3.0.8/libexec/lib/jenkins.war",
      }
    },
  },
  filetypes = { "groovy" }
}

require'lspconfig'.bashls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.vimls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.terraformls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.dockerls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.html.setup{on_attach=require'completion'.on_attach}

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
  on_attach = on_attach,
}

-- vim.lsp.set_log_level("debug")


require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 3;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
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

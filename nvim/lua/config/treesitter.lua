-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'yaml', 'python', 'rust', 'typescript', 'help', 'jsonnet', 'terraform' },

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.make = {
  install_info = {
    url = "~/configs/nvim/ts_parsers/tree-sitter-make", -- local path or git repo
    files = { "src/parser.c" }
  },
  filetype = "make", -- if filetype does not agrees with parser name
  -- used_by = {"bar", "baz"} -- additional filetypes that use this parser
}
parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = { "src/parser.c" }
  },
  filetype = "gotmpl",
  used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml", "helm" }
}
-- parser_config.yaml = {
--   install_info = {
--     url = "~/configs/nvim/ts_parsers/tree-sitter-yaml",
--     files = {"src/parser.c"}
--   },
--   filetype = "yaml",
--   used_by = {"yaml"}
-- }

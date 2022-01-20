require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "ruby" },  -- list of language that will be disabled
  },
  playground = {
    enable = true,
    disable = {},
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
  }
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.markdown = {
--   install_info = {
--     url = "~/configs/nvim/ts_parsers/tree-sitter-markdown", -- local path or git repo
--     files = {"src/parser.c"}
--   },
--   filetype = "markdown", -- if filetype does not agrees with parser name
--   -- used_by = {"bar", "baz"} -- additional filetypes that use this parser
-- }
parser_config.make = {
  install_info = {
    url = "~/configs/nvim/ts_parsers/tree-sitter-make", -- local path or git repo
    files = {"src/parser.c"}
  },
  filetype = "make", -- if filetype does not agrees with parser name
  -- used_by = {"bar", "baz"} -- additional filetypes that use this parser
}

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.gotmpl = {
  install_info = {
    url = "~/configs/nvim/ts_parsers/tree-sitter-go-template",
    files = {"src/parser.c"}
  },
  filetype = "gotmpl",
  used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl"}
}

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.yaml = {
  install_info = {
    url = "~/configs/nvim/ts_parsers/tree-sitter-yaml",
    files = {"src/parser.c"}
  },
  filetype = "yaml",
  used_by = {"yaml"}
}

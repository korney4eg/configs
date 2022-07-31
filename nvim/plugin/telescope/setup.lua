local setup = function()
  require('telescope').setup {
    defaults = {
      path_display = {
        'shorten',
      },
      file_ignore_patterns = { "^.*/.git/.*$" }
    },
    extensions = {
      project = {
        base_dirs = {
          '~/configs/',
          { '~/work/repos/apps/broker' },
          -- { '~/dev/src3', max_depth = 4 },
          -- { path = '~/dev/src4' },
          -- { path = '~/dev/src5', max_depth = 2 },
        },
        hidden_files = true, -- default: false
        theme = "dropdown"
      }
    }
  }
end

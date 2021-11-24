local setup = function()
  require('telescope').setup{
    defaults = {
      path_display = {
        'shorten',
        },
        file_ignore_patterns = {"^.*/.git/.*$"}
    }
  }
end

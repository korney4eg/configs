local Terminal = require('toggleterm.terminal').Terminal

local float_term = Terminal:new {
  -- dir = 'git_dir',
  direction = 'float',
  float_opts = {
    border = 'double',
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd 'stopinsert!'
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd 'startinsert!'
  end,
}

function _float_term_toggle()
  float_term:toggle()
end

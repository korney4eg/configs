vim.treesitter.query.add_directive('inject-go-tmpl!', function(_, _, bufnr, _, metadata)
  local fname = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
  local _, _, ext, _ = string.find(fname, '.*%.(%a+)(%.%a+)')
  metadata['injection.language'] = ext
end, {})

vim.filetype.add {
  extension = {
    tmpl = 'gotmpl',
  },
}

vim.cmd 'colorscheme sonokai'
vim.cmd 'hi Comment gui=none'

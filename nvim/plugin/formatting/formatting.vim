augroup Format
    autocmd!
    autocmd BufWritePost * lua vim.lsp.buf.formatting_seq_sync()
  augroup END

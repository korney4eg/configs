augroup autoformat_settings
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType xml AutoFormatBuffer xmllint
  autocmd FileType go AutoFormatBuffer 'goimports -w'
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

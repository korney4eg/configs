augroup omnifuncs
  autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype go  set nolist omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype terraform setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype bash setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype vim setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype Dockerfile,dockerfile setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype yaml setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype html setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype markdown setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype jsonnet setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup end

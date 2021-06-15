" <Leader><Leader> -- Open last buffer.
nnoremap <Leader><Leader> <C-^>


" Open git window
nnoremap <Leader>g :Git<CR>
" git push
nnoremap <Leader>gp :Git push<CR>

" Refresh configuration
nnoremap <Leader>r :source ~/configs/.vim/init.vim<CR>

" Find current file in NERDTree
nnoremap <Leader>f :call NerdTreeToggleFind()<CR>
"
" Go imports on local buffer
nnoremap <Leader>i :! goimports -w %<CR>

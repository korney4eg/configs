" <Leader><Leader> -- Open last buffer.
nnoremap <Leader><Leader> <C-^>


" Open git window
nnoremap <Leader>g :Git<CR>
" git push
nnoremap <Leader>gp :silent Git pushr<CR>

" Refresh configuration
nnoremap <Leader>r :source ~/configs/.vim/init.vim<CR>

" Find current file in NERDTree
nnoremap <Leader>f :call NerdTreeToggleFind()<CR>
"

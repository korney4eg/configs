" <Leader><Leader> -- Open last buffer.
nnoremap <Leader><Leader> <C-^>


" Open git window
nnoremap <Leader>g :Git<CR>

" Refresh configuration
nnoremap <Leader>r :source ~/configs/.vim/init.vim<CR>

" Find current file in NERDTree
nnoremap <Leader>a :call NerdTreeToggleFind()<CR>

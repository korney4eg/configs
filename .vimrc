set spell spelllang=ru,en
set spell!
set tags=tags,.tags;
set path+=**

set diffopt+=iwhiteall
set nocompatible
set autoread
set splitbelow
" filetype off
source ~/configs/vim/plugins.vim
source ~/configs/vim/russian.vim
source ~/configs/vim/ui.vim
source ~/configs/vim/functions.vim
filetype plugin indent on
" let g:session_autoload = 'no'


 " for python
 autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
 autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab
 autocmd BufRead,BufNewFile docker-compose*.{yaml,yml}* set ft=yaml.docker-compose
 autocmd BufRead,BufNewFile Vagrantfile set ft=ruby
 autocmd BufRead,BufNewFile *.pp set ft=puppet
 au BufRead,BufNewFile *.tf setlocal filetype=terraform
au BufRead,BufNewFile *.tfvars setlocal filetype=terraform
au BufRead,BufNewFile *.tfstate setlocal filetype=json
au BufRead,BufNewFile *.tfstate.backup setlocal filetype=json
 autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
 autocmd FileType go setlocal nolist
 autocmd FileType make setlocal nolist
" au BufWinEnter,FileType markdown colorscheme solarized8_flat

" set g:syntastic_puppet_checkers = ['puppet-lint']


autocmd BufNewFile **/_drafts/*.md 0r ~/configs/.vim/templates/jekyll_draft.md
autocmd BufNewFile **/content/*.md 0r ~/configs/.vim/templates/gohugo_draft.md

autocmd VimResized * :wincmd =
:nnoremap <C-l> :call NextBuffer()<CR>:call SyncTree()<CR>
:nnoremap <C-h> :call PreviousBuffer()<CR>:call SyncTree()<CR>
cnoreabbrev ц w
cnoreabbrev у e

" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-N>"
"   else
"     return "\<Tab>"
"   endif
" endfunction
" inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" com! FormatJSON %!python -m json.tool

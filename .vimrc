set spell spelllang=ru,en
set spell!

set nocompatible
" filetype off
source ~/configs/vim/plugins.vim
source ~/configs/vim/russian.vim
source ~/configs/vim/ui.vim
filetype plugin indent on


 " for python
 autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
 autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab
 autocmd BufRead,BufNewFile *.yaml set ft=ansible
 autocmd BufRead,BufNewFile *.yml set ft=ansible
 autocmd BufRead,BufNewFile Vagrantfile set ft=ruby
 autocmd FileType ansible setlocal expandtab shiftwidth=2 softtabstop=2
 autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
 autocmd FileType go setlocal nolist



 autocmd BufNewFile **/_drafts/*.md 0r ~/configs/.vim/templates/jekyll_draft.md

autocmd VimResized * :wincmd =
:nnoremap <C-;> :bnext<CR>
:nnoremap <C-g> :bprevious<CR>

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


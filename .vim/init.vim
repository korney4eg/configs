filetype plugin indent on

set path=.,,**
set noswapfile
set shiftwidth=2
" jump to other buffers without saving
set hidden
if !has('nvim')
  set ttymouse=xterm2
endif
set mouse=a
set foldlevel=100

au FocusGained,BufEnter * :silent! !

" Mappings {{{
let mapleader="\<Space>"
let maplocalleader="\\"
imap jj <Esc>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 
set statusline=%<[%n]\ %f\ %m%r%h%w\ %y\ %{&fileencoding}%=%b\ \ \ %c/%v\ %l/%L\ \ %P\ %a
"}}

" set runtimepath^=~/configs/.vim/
let $RTP=split(&runtimepath, ',')[0]

let g:hcl_fmt_autosave = 1
let g:terraform_fmt_on_save=1


set incsearch
let g:go_fmt_command = "goimports"

lua require('init')

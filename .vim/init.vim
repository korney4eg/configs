filetype plugin indent on
source ~/configs/.vim/ui.vim
source ~/configs/.vim/plugin/formatting/formatting.vim
source ~/configs/.vim/plugin/functions/main.vim
source ~/configs/.vim/plugin/lsp/autocmd.vim
source ~/configs/.vim/plugin/mappings/leader.vim
source ~/configs/.vim/plugin/mappings/lsp.vim
source ~/configs/.vim/plugin/terminal/hide_terminal.vim




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

"}}

" set runtimepath^=~/configs/.vim/
let $RTP=split(&runtimepath, ',')[0]

let g:hcl_fmt_autosave = 1
let g:terraform_fmt_on_save=1


set incsearch
let g:go_fmt_command = "goimports"

lua require('init')

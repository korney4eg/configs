filetype plugin indent on
source ~/configs/.vim/ui.vim
set path=.,,**
set noswapfile
set shiftwidth=2
" jump to other buffers without saving
set hidden


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

filetype plugin indent on
call plug#begin('~/.vim/plugged')
" NERDTREE - to be replaced with Telescope
Plug 'preservim/nerdtree'
" LSP config
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
" Should stay only one of them
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/completion-nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Code format
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
" Commentary
Plug 'tpope/vim-commentary'
" Dev Icons
Plug 'ryanoasis/vim-devicons'
" Working with Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Different filetypes
Plug 'google/vim-jsonnet'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-markdown'

call plug#end()
call glaive#Install()

set path=.,,**
set noswapfile
set shiftwidth=2
set nocompatible
set autoread
set splitbelow
" jump to other buffers without saving
set hidden
if !has('nvim')
  set ttymouse=xterm2
endif
set mouse=a
set foldlevel=100
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab
autocmd BufRead,BufNewFile Vagrantfile set ft=ruby
autocmd BufRead,BufNewFile *.pp set ft=puppet
autocmd BufRead,BufNewFile *.tf setlocal filetype=terraform
autocmd BufRead,BufNewFile *.tfvars setlocal filetype=terraform
autocmd BufRead,BufNewFile *.tfstate setlocal filetype=json
autocmd BufRead,BufNewFile *.tfstate.backup setlocal filetype=json
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType go setlocal nolist
autocmd FileType make setlocal
" au BufWinEnter,FileType markdown colorscheme solarized8_flat


" set g:syntastic_puppet_checkers = ['puppet-lint']


autocmd BufNewFile **/_drafts/*.md 0r ~/configs/.vim/templates/jekyll_draft.md
autocmd BufNewFile **/content/*.md 0r ~/configs/.vim/templates/gohugo_draft.md


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
let g:airline#extensions#tabline#buffer_nr_show = 0 
set statusline=%<[%n]\ %f\ %m%r%h%w\ %y\ %{&fileencoding}%=%b\ \ \ %c/%v\ %l/%L\ \ %P\ %a
"}}

" set runtimepath^=~/configs/.vim/
let $RTP=split(&runtimepath, ',')[0]

let g:hcl_fmt_autosave = 1
let g:terraform_fmt_on_save=1


set incsearch
let g:go_fmt_command = "goimports"

lua require('init')

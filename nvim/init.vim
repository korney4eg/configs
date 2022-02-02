filetype plugin indent on
call plug#begin('~/.config/nvim/plugged')
" Terminal
Plug 'itmecho/neoterm.nvim'
" NERDTREE - to be replaced with Telescope
Plug 'preservim/nerdtree'
" LSP config
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
" Should stay only one of them
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" Debug tool
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope-github.nvim'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Commentary
Plug 'tpope/vim-commentary'
" Dev Icons
Plug 'ryanoasis/vim-devicons'
" Working with Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Linter, formatter
Plug 'jose-elias-alvarez/null-ls.nvim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Different filetypes
Plug 'google/vim-jsonnet'
Plug 'pearofducks/ansible-vim'
Plug 'gabrielelana/vim-markdown'
Plug 'hashivim/vim-terraform'

" GitHub
Plug 'skanehira/gh.vim'

call plug#end()

" set pah=.,,**
set noswapfile
set shiftwidth=2
set autoread
set splitbelow
" set spell spelllang=en_us
" set spellsuggest=fast,20 "Don't show too much suggestion for spell check.
" set spellfile=~/configs/nvim/spell/en.utf-8.add

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
" autocmd BufNewFile,BufRead * if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType go setlocal nolist
autocmd FileType lua setlocal nolist
autocmd FileType make setlocal



autocmd BufNewFile **/_drafts/*.md 0r ~/configs/nvim/templates/jekyll_draft.md
autocmd BufNewFile **/content/*.md 0r ~/configs/nvim/templates/gohugo_draft.md


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

" set runtimepath^=~/configs/nvim/
let $RTP=split(&runtimepath, ',')[0]

let g:hcl_fmt_autosave = 1
let g:terraform_fmt_on_save=1


set incsearch
let g:go_fmt_command = "goimports"

lua require('init')

" Settings for NeoVide
let g:neovide_cursor_animation_length=0
set guifont=Hack\ Nerd\ Font\ Mono:h15

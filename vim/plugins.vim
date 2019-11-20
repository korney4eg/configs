if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set rtp+=~/.vim/bundle/vundle/
" just before this run:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle/

call plug#begin('~/.vim/plugged')
" Common plugins:
" for using snippets
" Plug 'msanders/snipmate.vim'
" voundle plugin - plugin manager
Plug 'gmarik/vundle'
" download color theme
Plug 'tomasr/molokai'
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'lifepillar/vim-solarized8'
" Most recent opened files
" Usage:
" :MRU - will open most edited files
" Plug 'vim-scripts/mru.vim'

" Vim airline - more awesome than just status line
" Plug 'korney4eg/vim-chef-snippets'
" snippets for chef
Plug 'bling/vim-airline'
Plug 'mhinz/vim-startify'

" show git status in file
Plug 'airblade/vim-gitgutter'
" HTML, CSS edititon
"Plug 'mattn/zencoding-vim'
" Use chef 
Plug 'korney4eg/vim-chef'
Plug 'rodjek/vim-puppet'
Plug 'andrewstuart/vim-kubernetes'
Plug 'fatih/vim-go'
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'misterbuckley/vim-definitive'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'ekalinin/Dockerfile.vim'
Plug 'cespare/vim-toml'
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


let g:session_autosave = 'yes'

syntax on

" Plug 'kien/ctrlp.vim'
"Markdown
" Plug '/usr/local/opt/fzf'
set rtp+=/usr/local/opt/fzf

Plug 'junegunn/fzf.vim'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


Plug 'godlygeek/tabular'
Plug 'goirijo/vim-jgg-colorscheme'
Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/bandit.vim'
" Plug 'iamcco/markdown-preview'
" Plug 'JamshedVesuna/vim-markdown-preview'

"Fugitive - using git inside vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
"Plug 'chase/vim-ansible-yaml'
" Plug 'MicahElliott/Rocannon'
Plug 'jiangmiao/auto-pairs'
Plug 'qpkorr/vim-bufkill'
Plug 'ryanoasis/vim-devicons'
Plug 'ConradIrwin/vim-bracketed-paste'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'pseewald/nerdtree-tagbar-combined'
Plug 'vim-scripts/taghighlight'
Plug 'majutsushi/tagbar'

Plug 'tyru/open-browser.vim'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'

call plug#end()
let g:terraform_fmt_on_save=1
let g:terraform_align=1

au FileType markdown vmap \<Bslash> :EasyAlign*<Bar><Enter>
xmap ga <Plug>(EasyAlign)
" Plug 'christoomey/vim-tmux-navigator'
"Plug 'vim-scripts/taglist.vim'
"Plug 'majutsushi/tagbar'
"For python programming
"Plug 'klen/python-mode.git'
"For lua programming
"Plug 'xolox/vim-lua-inspect'

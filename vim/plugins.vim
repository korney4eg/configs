set rtp+=~/.vim/bundle/vundle/
" just before this run:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle/

call vundle#rc()
" Common plugins:
" for using snippets
Plugin 'msanders/snipmate.vim'
" voundle plugin - plugin manager
Plugin 'gmarik/vundle'
" download color theme
Plugin 'tomasr/molokai'
" Most recent opened files
" Usage:
" :MRU - will open most edited files
" Plugin 'vim-scripts/mru.vim'

" Vim airline - more awesome than just status line
Plugin 'korney4eg/vim-chef-snippets'
" snippets for chef
Plugin 'bling/vim-airline'

" show git status in file
Plugin 'airblade/vim-gitgutter'
" HTML, CSS edititon
"Plugin 'mattn/zencoding-vim'
" Use chef 
Plugin 'korney4eg/vim-chef'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ngmy/vim-rubocop'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'

syntax on

" Plugin 'kien/ctrlp.vim'
"Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Plugin 'iamcco/markdown-preview'
" Plugin 'JamshedVesuna/vim-markdown-preview'

"Fugitive - using git inside vim
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
"Plugin 'chase/vim-ansible-yaml'
Plugin 'MicahElliott/Rocannon'
Plugin 'jiangmiao/auto-pairs'
Plugin 'qpkorr/vim-bufkill'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ConradIrwin/vim-bracketed-paste'

"Plugin 'vim-scripts/taglist.vim'
"Plugin 'majutsushi/tagbar'
"For python programming
"Plugin 'klen/python-mode.git'
"For lua programming
"Plugin 'xolox/vim-lua-inspect'

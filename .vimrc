"set spell spelllang=ru,en
"set spell!

set nocompatible
filetype off
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
Plugin 'vim-scripts/mru.vim'

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
Plugin 'ngmy/vim-rubocop'
Plugin 'scrooloose/nerdtree'

syntax on

"Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"Fugitive - using git inside vim
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'

"Plugin 'vim-scripts/taglist.vim'
"Plugin 'majutsushi/tagbar'
"For python programming
"Plugin 'klen/python-mode.git'
"For lua programming
"Plugin 'xolox/vim-lua-inspect'
filetype plugin indent on


set background=dark
set t_Co=256
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set number
" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif
set autoindent
"при поиске помечать все найденные строки
set hlsearch
"при поиске перескакивать на найденный текст в процессе набора строки
set incsearch
"не разрывать строку
set wrap
"set background=dark
"highlight Comment ctermfg=darkgreen
:set ruler
"filetype plugin on
" Всегда показывать строку статуса
 set laststatus=2 
" " Выключить линейку
 set noruler
 "    %f - путь к редактируемому файлу
 "    %h, %m и %r - флаги состояния буфера: страница помощи, изменения и только для чтения
 "    %b - код символа в ASCII  
 "         &encoding - кодировка файла
 "          \ - пробел необходимо экранировать
 "    %l -  номер строки
 "    %c - номер колонки
 "    %P - процент содержания показанного файла в
 "         окне
 "set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ \ %l,%c\ %P
 "set statusline=%<%1*%f%h%m%r%*\ %b\ %2*%{&encoding}%*\ \ %l,%c\ %P
 set statusline=%<[%n]\ %f\ %m%r%h%w\ %y\ %{&fileencoding}%=%b\ \ \ %c/%v\ %l/%L\ \ %P\ %a
 colorscheme molokai
 " for python
 autocmd FileType html setlocal shiftwidth=2 tabstop=2
 autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
 autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2

 "Set configuration to display tab names
 let g:airline#extensions#tabline#enabled = 1

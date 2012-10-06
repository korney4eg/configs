"set spell spelllang=ru,en
"set spell!

set nocompatible
syntax on
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'mattn/zencoding-vim'
"Bundle 'xolox/vim-lua-inspect'
filetype plugin indent on


" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

"  This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

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
set mouse=a		" Enable mouse usage (all modes)
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
set backup              " создавать .bak файлы (по умолчанию <oldname>~)
set background=dark
highlight Comment ctermfg=darkgreen
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

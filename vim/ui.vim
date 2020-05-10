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
set nofoldenable
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
set noswapfile
set laststatus=2 
set wildmenu
set wildmode=list:longest,full
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
 set list
 colorscheme molokai
 "Set configuration to display tab names
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1 
" Highlight lines longer 80 chars
" set colorcolumn=81
let g:rocannon_bypass_colorscheme = 1
if has('gui_running')
  if has('gui_win32')
    set guifont=DejaVu_Sans_Mono:h13:cANSI
  else
    " set guifont=DejaVu_Sans_Mono:h15
    set guifont=Hack\ Nerd\ Font:h15
    " set macligatures
    " set guifont=Fira\ Code:h15
  endif
endif

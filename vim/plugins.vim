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
Plug 'bling/vim-airline'

" show git status in file
Plug 'airblade/vim-gitgutter'
" HTML, CSS edititon
"Plug 'mattn/zencoding-vim'
" Use chef 
Plug 'korney4eg/vim-chef'
Plug 'andrewstuart/vim-kubernetes'
Plug 'fatih/vim-go'
" Plug 'nsf/gocode'
" Plug 'vim-jp/vim-go-extra'
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

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

"==== Autocompletion plugins
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'mattn/vim-lsp-settings'
source ~/configs/vim/lsp.vim
Plug 'prabirshrestha/vim-lsp'
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Terraform
" if executable('terraform-lsp')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'terraform-language-server',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'terraform-lsp']},
"         \ 'whitelist': ['terraform'],
"         \ })
"   endif
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'


" Vim
Plug 'Shougo/neco-vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
    \ 'name': 'necovim',
    \ 'whitelist': ['vim'],
    \ 'completor': function('asyncomplete#sources#necovim#completor'),
    \ }))

" " Omni completion
" Plug 'yami-beta/asyncomplete-omni.vim'
" call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
" \ 'name': 'omni',
" \ 'whitelist': ['*'],
" \ 'blacklist': ['c', 'cpp', 'html'],
" \ 'completor': function('asyncomplete#sources#omni#completor')
" \  }))

"==== Autocompletion ends


Plug 'pseewald/nerdtree-tagbar-combined'
" Plug 'vim-scripts/taghighlight'
Plug 'majutsushi/tagbar'

Plug 'tyru/open-browser.vim'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'

call plug#end()
let g:terraform_fmt_on_save=1
let g:terraform_align=1

au FileType markdown vmap \<Bslash> :EasyAlign*<Bar><Enter>
xmap ga <Plug>(EasyAlign)
"Plug 'vim-scripts/taglist.vim'
"Plug 'majutsushi/tagbar'
"For python programming
"Plug 'klen/python-mode.git'
"For lua programming
"Plug 'xolox/vim-lua-inspect'

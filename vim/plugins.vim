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
Plug 'tomasr/molokai'
" Vim airline - more awesome than just status line
Plug 'bling/vim-airline'

" show git status in file
Plug 'airblade/vim-gitgutter'
" Use chef 
Plug 'korney4eg/vim-chef'
" Plug 'andrewstuart/vim-kubernetes'
" Plug 'fatih/vim-go'
" Plug 'nsf/gocode'
" Plug 'vim-jp/vim-go-extra'
Plug 'hashivim/vim-terraform'
Plug 'vim-ruby/vim-ruby'
Plug 'govim/govim'
Plug 'ngmy/vim-rubocop'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
" set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'iamcco/markdown-preview'
" Plug 'JamshedVesuna/vim-markdown-preview'

"Fugitive - using git inside vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'jiangmiao/auto-pairs'
Plug 'qpkorr/vim-bufkill'
Plug 'ryanoasis/vim-devicons'
Plug 'ConradIrwin/vim-bracketed-paste'

"==== Autocompletion plugins
set completeopt+=longest,menuone,noselect

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
    " refer to doc to add more commands
endfunction
if executable('docker-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'docker-langserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
        \ 'whitelist': ['dockerfile'],
        \ })
endif

if executable('yaml-language-server')
  augroup LspYaml
   autocmd!
   autocmd User lsp_setup call lsp#register_server({
       \ 'name': 'yaml-language-server',
       \ 'cmd': {server_info->['yaml-language-server', '--stdio']},
       \ 'whitelist': ['yaml', 'yaml.ansible','yaml.kubernetes'],
       \ 'workspace_config': {
       \   'yaml': {
       \     'validate': v:true,
       \     'hover': v:true,
       \     'completion': v:true,
       \     'customTags': [],
       \     'schemas': {
       \       'kubernetes': ['/kubernetes.yml'],
       \       'https://raw.githubusercontent.com/docker/cli/master/cli/compose/schema/data/config_schema_v3.9.json': ['/docker-compose.yml'],
       \      },
       \     'schemaStore': { 'enable': v:true },
       \   }
       \ }
       \})
  augroup END
endif
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <C-space> <C-x><C-o>

set completeopt-=preview

Plug 'vim-syntastic/syntastic'

Plug 'tyru/open-browser.vim'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'

call plug#end()
" let g:terraform_fmt_on_save=1
" let g:terraform_align=1

au FileType markdown vmap \<Bslash> :EasyAlign*<Bar><Enter>
xmap ga <Plug>(EasyAlign)

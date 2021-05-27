set background=dark
set t_Co=256
colorscheme monokai

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 
set statusline=%<[%n]\ %f\ %m%r%h%w\ %y\ %{&fileencoding}%=%b\ \ \ %c/%v\ %l/%L\ \ %P\ %a

set list
set number

set splitbelow
set splitright

" git hightlight settings
hi diffAdded cterm=bold ctermfg=DarkGreen
hi diffRemoved cterm=bold ctermfg=DarkRed

" lsp configuration
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ' '
let g:diagnostic_insert_delay = 1

call sign_define("LspDiagnosticsErrorSign", {"text" : "➤", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "➤", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "↬", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "↬", "texthl" : "LspDiagnosticsHint"})

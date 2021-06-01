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

" lsp configuration
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = '»'
let g:diagnostic_insert_delay = 1


sign define LspDiagnosticsSignError text=✖
sign define LspDiagnosticsSignWarning text=⚠
sign define LspDiagnosticsSignInformation text=ℹ
sign define LspDiagnosticsSignHint text=➤
" Enable/Disable Underline
let gui_bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', 'gui')
let cterm_bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', 'cterm')
let g:diagnostic_enable_underline = 0     " default = 1 (on)
exec "hi LspDiagnosticsSignWarning ctermfg=DarkYellow ctermbg=".cterm_bg." cterm=bold guifg=DarkYellow guibg=".gui_bg." gui=bold"
exec "hi LspDiagnosticsDefaultHint ctermfg=DarkBlue ctermbg=".cterm_bg." cterm=bold guifg=DarkBlue guibg=".gui_bg." gui=bold"
exec "hi LspDiagnosticsSignHint ctermfg=DarkBlue ctermbg=".cterm_bg." cterm=bold guifg=DarkBlue guibg=".gui_bg." gui=bold"
exec "hi LspDiagnosticsDefaultError ctermfg=Red ctermbg=".cterm_bg." cterm=NONE guifg=Red guibg=".gui_bg." gui=NONE"
exec "hi LspDiagnosticsSignError ctermfg=Red ctermbg=".cterm_bg." cterm=NONE guifg=Red guibg=".gui_bg." gui=NONE"
exec "hi LspDiagnosticsSignInformation ctermfg=Grey ctermbg=".cterm_bg." cterm=NONE guifg=Grey guibg=".gui_bg." gui=NONE"

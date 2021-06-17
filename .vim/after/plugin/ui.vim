" set background=dark
set t_Co=256
colorscheme monokai


set list
set number

set splitbelow
set splitright

" lsp configuration
" let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = '»'
" let g:diagnostic_insert_delay = 1


let gui_bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', 'gui')
let cterm_bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', 'cterm')
sign define LspDiagnosticsSignError text=✖
sign define LspDiagnosticsSignWarning text=⚠
sign define LspDiagnosticsSignInformation text=ℹ
sign define LspDiagnosticsSignHint text=➤
" " Enable/Disable Underline
exec "hi! LspDiagnosticsSignWarning ctermfg=208 ctermbg=".cterm_bg." cterm=bold guifg=#ff8700 guibg=".gui_bg." gui=bold"
exec "hi! LspDiagnosticsDefaultHint ctermfg=DarkBlue ctermbg=".cterm_bg." cterm=bold guifg=DarkBlue guibg=".gui_bg." gui=bold"
exec "hi! LspDiagnosticsSignHint ctermfg=DarkBlue ctermbg=".cterm_bg." cterm=bold guifg=DarkBlue guibg=".gui_bg." gui=bold"
exec "hi! LspDiagnosticsDefaultError ctermfg=124 ctermbg=".cterm_bg." cterm=NONE guifg=#af0000 guibg=".gui_bg." gui=NONE"
exec "hi! LspDiagnosticsSignError ctermfg=124 ctermbg=".cterm_bg." cterm=NONE guifg=#af0000 guibg=".gui_bg." gui=NONE"
exec "hi! LspDiagnosticsSignInformation ctermfg=Grey ctermbg=".cterm_bg." cterm=NONE guifg=Grey guibg=".gui_bg." gui=NONE"
" hi LspDiagnosticsVirtualTextError guifg=#af0000 ctermfg=124
" " Warnings in Yellow
" hi LspDiagnosticsVirtualTextWarning guifg=#ff8700 ctermfg=208
" " Info and Hints in White
" hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White
" hi LspDiagnosticsVirtualTextHint guifg=Blue ctermfg=Blue

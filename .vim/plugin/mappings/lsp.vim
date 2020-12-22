if !has('nvim')
  finish
endif

let g:completion_enable_auto_popup = 0
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
let g:completion_enable_auto_hover = 0
let g:completion_enable_auto_signature = 0
let g:completion_sorting = "none"
set completeopt-=preview

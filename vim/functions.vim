function! s:LsOutput(bang, args)
    redir => ls_output
    exe 'silent ls' . a:bang a:args
    redir END
    return split(ls_output, "\n")
endfunction

"
" Group the output of :ls by tabs and print it.
"
function! LsByTab(bang, args)
    let ls_output = s:LsOutput(a:bang, a:args)

    " Iterate over all tabs.
    for tab in gettabinfo()
        echo '===== tab' tab.tabnr '====='
        " Get the buffer numbers for the current tab.
        let buffers = tabpagebuflist(tab.tabnr)
        " Construct a regular expression that matches the buffer numbers
        " at the start of the lines of the :ls output.
        let buffers_pat = '^\s*\(' . join(buffers, '\|') . '\)\>'
        " Filter the lines from the :ls output so that only the lines for
        " the buffers of the current tab remain.
        let tab_buffers = filter(copy(ls_output), 'v:val =~ buffers_pat')
        " Print the info for the current tab.
        echo join(tab_buffers, "\n")
    endfor
endfunction

command! -bang -nargs=? LsByTab call LsByTab(<q-bang>, <q-args>)

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

function! IsValidBuffer(index)
    return !empty(bufname(a:index)) && getbufvar(a:index, '&buftype') == ''
endfunction

function! NextBuffer()
  if &buftype != ''
    return
  end
  let ind = bufnr()
  let ind += 1
  while ind != bufnr('')
    if ind > bufnr('$')
      let ind = 1
    endif
    if IsValidBuffer(ind)
      break
    else
      let ind += 1
    endif
  endwhile
  execute "buffer" ind
endfunction

function! PreviousBuffer()
  if &buftype != ''
    return
  end
  let ind = bufnr()
  let ind -= 1
  while ind != bufnr('')
    if ind < 1
      let ind = bufnr('$')
    endif
    if IsValidBuffer(ind)
      break
    else
      let ind -= 1
    endif
  endwhile
  execute "buffer" ind
endfunction

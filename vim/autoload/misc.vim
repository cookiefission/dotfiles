function! misc#MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  vsplit
  execute "buffer " . bufferName
endfunction

function! misc#NextTabOrBuffer()
  if tabpagenr('$') == 1
    bnext
  else
    tabnext
  endif
endfunction

function! misc#PreviousTabOrBuffer()
  if tabpagenr('$') == 1
    bprevious
  else
    tabprevious
  endif
endfunction

function! misc#SplitOrCtrlP()
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 2
    vsplit | bnext
  else
    CtrlPBuffer
  endif
endfunction

function! misc#AgWithFiletype(search)
  exec "Ag --" . &filetype . " " . a:search
endfunction

function! misc#SplitIfTwoFiles()
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 2
    if winnr('$') == 1
      vsplit | bnext
    endif
  endif
endfunction

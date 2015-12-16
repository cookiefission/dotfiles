""
" Merge a tab into a split in the previous window
""
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

""
" Buffer/Tab switching
""
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

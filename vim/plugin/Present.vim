command! SlideMode :call SlideBind()

function! SlideBind()
  nnoremap <CR> :bnext<CR>
  nnoremap <BS> :bprevious<CR>
  nnoremap <Esc> :call SlideUnbind()
endfunction

function! SlideUnbind()
  unmap <CR>
  unmap <BS>
  unmap <Esc>
endfunction

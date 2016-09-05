if exists("b:current_syntax")
  finish
endif

syn match procfileJob /^\w\+:/
syn region procfileComment start="#" end="\n"

hi link procfileComment Comment
hi link procfileJob Keyword

let b:current_syntax = "procfile"

set commentstring=#\ %s

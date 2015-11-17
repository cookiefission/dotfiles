" Minimal vim config for git commits and servers
syntax on

set showmode
set backspace=2
set nu
set relativenumber
set tabstop=4
set expandtab
set textwidth=72

set t_Co=256
hi Comment ctermfg=yellow

set cul
hi CursorLine cterm=NONE ctermbg=236 ctermfg=NONE

command NoNum set nonu norelativenumber

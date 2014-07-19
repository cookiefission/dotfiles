set nocompatible
filetype off

" Vundle Setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugin list
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-obsession'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'AndrewRadev/sideways.vim'
" Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'sean-kenny/splitjoin.vim'
Plugin 'vim-scripts/UltiSnips'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'StanAngeloff/php.vim'

" Done setting up Vundle
call vundle#end()

syntax on
filetype plugin indent on

" Colour settings
set t_Co=256
hi Comment ctermfg=yellow

let mapleader = "\<space>"
let g:mapleader = "\<space>"

" Mappings
nnoremap Y y$
map <Leader>nh :noh<CR>
map <Leader>== mmgg=G'm:w<CR>

map <F7> :tabp<CR>
map <F8> :tabn<CR>

nmap j gj
nmap k gk

map <Leader>vi :tabe ~/.vim/vimrc<CR>
map <Leader>db :tabe ~/Dropbox/work/debugging_log.md<CR>
map <Leader>sc :execute 'tabe /tmp/scratch.' . &filetype<CR>
map <Leader>sql :tabe /tmp/scratch.sql<CR>
map <Leader>txt :tabe /tmp/scratch.txt<CR>

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <Leader>qf :call QuickfixToggle()<cr>
map <Leader>pp :tabclose<CR>

map <Leader>gg :Gstatus<CR>
map <Leader>gc :Gcommit -a<CR>i
map <Leader>gb :Gblame<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>git :Git

augroup php
    autocmd!
    autocmd FileType php map <Leader>pu :!vendor/bin/phpunit<CR>
    autocmd FileType php map <Leader>php :!php %<CR>
    autocmd FileType php map <Leader>cj :tabe composer.json<CR>
augroup END

" Auto centering
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" More Natural Splits
set splitbelow
set splitright

" NERDTree
let NERDTreeShowLineNumbers=1
map <C-n> :NERDTreeToggle<CR>

" Codefolding
set foldmethod=indent
set foldlevel=20 " Folds available but open

" Relative Number hybrid thing
set relativenumber
set number

" Misc Settings
set ruler
match Error /\s\+$/
set laststatus=2
set ttyfast
set nowrap
set clipboard=unnamed

" Key press timeout
set timeoutlen=500

" Completion
set wildchar=<TAB>
set wildmenu
set wildmode=list:longest

" Visual
set virtualedit=block

" Search
set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase

" Replace
set gdefault

" Indentation
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Filetype Specific
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
" autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Set up .swp files to ~/.vim/tmp
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

" Enable mouse if available
if has("mouse")
    set mouse=a
endif

" Cursorline Settings
set cul
hi CursorLine cterm=NONE ctermbg=0 ctermfg=NONE

" Highlight column when over 80 characters
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Use ag for grepping
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif

" List chars
set listchars=tab:>#,nbsp:_,trail:~
set list

" CtrlP.vim
let g:ctrlp_working_path_mode = 0

" Trim whitespace
autocmd BufWritePre *.* :%s/\s\+$//e

" Toggle Quickfix
let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

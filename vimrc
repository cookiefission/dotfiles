set nocompatible
filetype off

""
" Vundle Setup
""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""
" Let Vundle manage Vundle
""
Plugin 'gmarik/Vundle.vim'

""
" Plugin list
""
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
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'StanAngeloff/php.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rking/ag.vim'

""
" Done setting up Vundle
""
call vundle#end()

syntax on
filetype plugin indent on

""
" Colour settings
""
set t_Co=256
hi Comment ctermfg=yellow

let mapleader = "\<space>"
let g:mapleader = "\<space>"

""
"  Mappings
""
nnoremap Y y$
map <Leader>nh :noh<CR>
map <Leader>== mmgg=G'mzz:w<CR>

map <F7> :tabp<CR>
map <F8> :tabn<CR>

nmap j gj
nmap k gk

nnoremap <Leader>vi :tabe ~/.vim/vimrc<CR>
nnoremap <Leader>so :so $MYVIMRC<CR>

nnoremap <Leader>db :tabe ~/Dropbox/work/debugging_log.md<CR>
nnoremap <Leader>sc :execute 'tabe /tmp/scratch.' . &filetype<CR>
nnoremap <Leader>sql :tabe /tmp/scratch.sql<CR>
nnoremap <Leader>txt :tabe /tmp/scratch.txt<CR>

nnoremap <Leader>qp :tabclose<CR>
nnoremap <Leader>li :set list!<CR>

" Fugitive/Git maps
nnoremap <Leader>ga :Git add
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit -a<CR>i
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gg :Gstatus<CR>
nnoremap <Leader>git :Git

" Add a space before and after cursor
nnoremap <Leader>[ i<space><esc>l
nnoremap <Leader>] a<space><esc>h

" Move lines up and down
nnoremap <Leader>jj ddp
nnoremap <Leader>kk ddkP

" Change first word of line
nnoremap <Leader>cw ^cw

" Add , to current line and edit new line
nnoremap <Leader>, A,<CR>

" Delete current line and add ; to end of previous
nnoremap <Leader>d; ddkA;<esc>

augroup php
    autocmd!
    autocmd FileType php map <Leader>pu :!vendor/bin/phpunit<CR>
    autocmd FileType php map <Leader>php :!php %<CR>
    autocmd FileType php map <Leader>cj :tabe composer.json<CR>
augroup END

augroup scratch
    autocmd!
    autocmd BufRead,BufNewFile,BufEnter /tmp/scratch.* nnoremap <Leader>CA gg0cG
augroup END

""
" Auto centering
""
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

""
" More Natural Splits
""
set splitbelow
set splitright

""
" NERDTree
""
let NERDTreeShowLineNumbers=1
map <C-n> :NERDTreeToggle<CR>

""
" Codefolding
""
set foldmethod=indent
set foldlevel=20 " Folds available but open

""
" Relative Number hybrid thing
""
set relativenumber
set number

""
" Misc Settings
""
set ruler
match Error /\s\+$/
set laststatus=2
set ttyfast
set nowrap
set clipboard=unnamed

""
" Key press timeout
""
set timeoutlen=500

""
" Completion
""
set wildchar=<TAB>
set wildmenu
set wildmode=list:longest

""
" Visual
""
set virtualedit=block

""
" Search
""
set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase

""
" Replace
""
set gdefault

""
" Indentation
""
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

""
" Filetype Specific
""
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
" autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2

""
" Set up .swp files to ~/.vim/tmp
""
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

""
" Enable mouse if available
""
if has("mouse")
    set mouse=a
endif

""
" Cursorline Settings
""
set cul
hi CursorLine cterm=NONE ctermbg=0 ctermfg=NONE

""
" Highlight column when over 80 characters
""
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

""
" List chars
""
set listchars=tab:>#,nbsp:_,trail:~
set list

""
" CtrlP.vim
""
let g:ctrlp_working_path_mode = 0

""
" Trim whitespace
""
autocmd BufWritePre *.* :%s/\s\+$//e

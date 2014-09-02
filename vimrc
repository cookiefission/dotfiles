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
Plugin 'honza/vim-snippets'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elzr/vim-json'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'junegunn/goyo.vim'

""
" Done setting up Vundle
""
call vundle#end()

syntax on
filetype plugin indent on

""
" CtrlP.vim
""
let g:ctrlp_working_path_mode = 0

""
" vim-airline
""
let g:airline_powerline_fonts = 1
let g:airline_theme = "murmur"

""
" tmuxline.vim
""
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : [ '#(whoami)' ],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a %d ', '%Y'],
      \'z'    : '#H'}

""
" dragvisuals.vim
""
runtime plugin/dragvisuals.vim

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
vmap  <expr>  <C-D>    DVB_Duplicate()

""
" NERDTree
""
let NERDTreeShowLineNumbers=1
map <C-n> :NERDTreeToggle<CR>

""
" UltiSnips
""
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

""
" vim-json
""
let g:vim_json_warnings=0

""
" Colour settings
""
set t_Co=256
colorscheme peachpuff
hi Comment ctermfg=yellow

""
"  Mappings
""
let mapleader = "\<space>"
let g:mapleader = "\<space>"

nnoremap Y y$
map <Leader>nh :noh<CR>
nnoremap <CR><CR> :noh<CR>
map <Leader>== mmgg=G:w<CR>'mzz

nnoremap <Leader>[ :tabp<CR>
nnoremap <Leader>] :tabn<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>

nmap j gj
nmap k gk

nnoremap <Leader>vi :tabe $MYVIMRC<CR>
nnoremap <Leader>so :so $MYVIMRC<CR>

nnoremap <Leader>db :tabe ~/Dropbox/work/debugging_log.md<CR>
nnoremap <Leader>sc :execute 'tabe /tmp/scratch.' . &filetype<CR>
nnoremap <Leader>sql :tabe /tmp/scratch.sql<CR>
nnoremap <Leader>txt :tabe /tmp/scratch.txt<CR>

nnoremap <Leader>qp :tabclose<CR>
nnoremap <Leader>li :set list!<CR>
nnoremap <Leader>wr :set wrap!<CR>
nnoremap <Leader>nl :set relativenumber!<CR>

nnoremap <Leader>mt :call MergeTabs()<CR>

nnoremap <Leader>ga :Git add
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit -a<CR>i
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gg :Gstatus<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>git :Git

nnoremap <Leader>cw ^cw
nnoremap <Leader>, A,<CR>
nnoremap <Leader>; A;<CR>
nnoremap <Leader>d; ddkA;<esc>
nnoremap <Leader>d, ddk$x

nnoremap <Leader>s<space> :%s/<C-r><C-w>//c<Left><Left>
nnoremap <Leader>s% :%s///c<Left><Left><Left>

augroup php
  autocmd!
  autocmd FileType php map <Leader>php :!php %<CR>
  autocmd FileType php map <Leader>cj :ComposerJson<CR>
  autocmd FileType php map <Leader>cu :ComposerUpdate<CR>
  autocmd FileType php map <Leader>ci :ComposerInstall<CR>
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
" Goto last location in non-empty files and centre it
""
autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$")
                   \|     exe "normal! g`\"zz"
                   \|  endif

""
" More Natural Splits
""
set splitbelow
set splitright

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
set noshowmode

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
" Trim whitespace
""
autocmd BufWritePre *.* :%s/\s\+$//e

""
" Return the syntax highlight group under the " cursor
""
function! CurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        echo ''
    else
        echo '[' . name . ']'
    endif
endfunction

""
" Merge a tab into a split in the previous window
""
function! MergeTabs()
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

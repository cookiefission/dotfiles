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
Plugin 'AndrewRadev/switch.vim'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'AndrewRadev/splitjoin.vim'
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
Plugin 'whatyouhide/vim-gotham'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-markdown'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'sgur/ctrlp-extensions.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'junegunn/goyo.vim'
Plugin 'mhinz/vim-startify'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'vim-scripts/Auto-Pairs'

""
" Done setting up Vundle
""
call vundle#end()

syntax on
filetype plugin indent on

""
" Misc Runtime
""
runtime macros/matchit.vim

""
" CtrlP.vim
""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['funky', 'cmdline', 'yankring']

""
" vim-airline
""
let g:airline_powerline_fonts = 1
let g:airline_theme = "murmur"
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = airline#section#create_right(['filetype', 'ffenc'])

""
" tmuxline.vim
""
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : [ '#(whoami)' ],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : ['📝  #(todo --count)', '#(is_plugged_in && echo ⛽️  || echo 🔋  )  #(battery_status)'],
      \'y'    : ['%R', '%a %d ', '%Y'],
      \'z'    : '#H'}
""
" NERDTree
""
let NERDTreeShowLineNumbers=1
map <C-n> :NERDTreeToggle<CR>

""
" UltiSnips
""
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsEditSplit="vertical"

""
" vim-json
""
let g:vim_json_warnings=0

""
" goyo.vim
""
let g:goyo_width = 110

""
" switch.vim
""
let g:switch_custom_definitions =
    \ [
    \   {
    \     '\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>': '\=toupper(submatch(1)) . submatch(2)',
    \     '\<\(\u\l\+\)\(\u\l\+\)\+\>': '\=tolower(submatch(1)) . submatch(2)',
    \   }
    \ ]

autocmd FileType php let b:switch_custom_definitions =
    \ [
    \   ['public', 'protected'],
    \   ['var_dump', 'print_r'],
    \   ['use', 'namespace'],
    \   ['time()', 'microtime(true)']
    \ ]

""
" vim-startify
""
let g:startify_custom_header = map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['']

let g:startify_list_order = [
      \ ['   MRU:'],
      \ 'dir',
      \ ['   MRU (all):'],
      \ 'files' ,
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ]

""
" vim-arduino-ino
""
let g:vim_arduino_map_keys = 0
command ArduinoCompile       call ArduinoCompile()
command ArduinoDeploy        call ArduinoDeploy()
command ArduinoSerialMonitor call ArduinoSerialMonitor()

""
" synastic
""
" Syntastic is more annoying than useful for html files, given that 90% of the
" time there is templating in there as well or partials
let g:syntastic_ignore_files = ['\mhtml$', '\mmain.scss$']

""
" Colour settings
""
set t_Co=256
" colorscheme peachpuff
colorscheme gotham256
hi Comment ctermfg=yellow

""
"  Mappings
""
let mapleader = "\<space>"
let g:mapleader = "\<space>"

nnoremap Y y$
nnoremap <CR><CR> :noh<CR>
map <Leader>== mmgg=G:w<CR>'mzz

nnoremap <Leader>] :call NextTabOrBuffer()<CR>
nnoremap <Leader>[ :call PreviousTabOrBuffer()<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
map <Leader>pb :CtrlPBuffer<CR>
map <Leader>pm :CtrlPMRUFiles<CR>
map <Leader>pp :CtrlPMixed<CR>
map <Leader>f :CtrlPLine<CR>

nmap j gj
nmap k gk

nnoremap <Leader>vi :tabe $MYVIMRC<CR>
nnoremap <Leader>so :so $MYVIMRC<CR>:noh<CR>

nnoremap <Leader>db :tabe ~/Dropbox/work/debugging_log.md<CR>
nnoremap <Leader>sc :execute 'tabe /tmp/scratch.' . &filetype<CR>
nnoremap <Leader>sql :tabe /tmp/scratch.sql<CR>
nnoremap <Leader>txt :tabe /tmp/scratch.txt<CR>

nnoremap <Leader>qp :tabclose<CR>
nnoremap <Leader>qq :bdelete<CR>
nnoremap <Leader>mt :call MergeTabs()<CR>
nnoremap <Leader>tm :tabnext<CR>:call MergeTabs()<CR>

nnoremap <Leader>sv :vsplit<space>
nnoremap <Leader>sh :split<space>

nnoremap <Leader>li :set list!<CR>
nnoremap <Leader>wr :set wrap!<CR>
nnoremap <Leader>nl :set relativenumber!<CR>

nnoremap <Leader>ga :Git add
nnoremap <Leader>gb :Gblame<CR>
vmap     <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit -a<CR>i
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gg :Gstatus<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>git :Git

nnoremap <Leader>- :Switch<CR>
nnoremap <Leader>< :SidewaysLeft<CR>
nnoremap <Leader>> :SidewaysRight<CR>

nnoremap <Leader>cw ^cw
nnoremap <Leader>, A,<CR>
nnoremap <Leader>; A;<CR>
nnoremap <Leader>d; ddkA;<esc>
nnoremap <Leader>d, ddk$x
nnoremap <Leader>a; mzA;<Esc>`z:w<CR>
nnoremap <Leader>a, mzA,<Esc>`z:w<CR>
nnoremap <Leader>D mz"dyy"dp`zj
vnoremap <Leader>D "dymz"dP`z
nnoremap <Leader>X mzkdd`z
nnoremap <Leader>x mzjdd`z
nnoremap <Leader><Backspace> mz$x`z:w<CR>
nnoremap <Leader>~ ~hi

nnoremap <Leader>s<space> :%s/<C-r><C-w>//c<Left><Left>
nnoremap <Leader>ss :s/<C-r><C-w>//<Left>
nnoremap <Leader>s% :%s///c<Left><Left><Left>
nnoremap <Leader>g<space> :g/<C-r><C-w>/

nnoremap <Leader>ag :Ag <C-r><C-w><CR>

imap :w<CR> <Esc>:w<CR>

cmap w!! w !sudo tee % >/dev/null

augroup php
  autocmd!
  autocmd FileType php map <Leader>pu :!vendor/bin/phpunit<CR>
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
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldlevel=20 " Folds available but open

""
" Relative Number hybrid thing
""
set number
set relativenumber

""
" Misc Settings
""
set ruler
match Error /\s\+$/
set laststatus=2
set ttyfast
set nowrap
set noshowmode
set hidden

""
" Fix backspace not deleting new lines
""
set backspace=indent,eol,start

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
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufRead composer.lock set filetype=json

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
hi CursorLine cterm=NONE ctermbg=236 ctermfg=NONE

""
" Highlight column when over 80 characters
""
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

""
" List chars
""
set listchars=tab:>#,nbsp:_
set list

""
" Trim whitespace
""
autocmd BufWritePre *.* :%s/\s\+$//e

""
" Return the syntax highlight group under the cursor
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

""
" Buffer/Tab switching
""
function! NextTabOrBuffer()
  if tabpagenr('$') == 1
    bnext
  else
    tabnext
  endif
endfunction

function! PreviousTabOrBuffer()
  if tabpagenr('$') == 1
    bprevious
  else
    tabprevious
  endif
endfunction

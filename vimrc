set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

" Enable 256 colours
set t_Co=256

" Mappings
map <C-n> :NERDTreeToggle<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
map <Leader>vi :tabe ~/.vim/vimrc<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>nh :noh<CR>
map <Leader>sc :execute 'tabe /tmp/scratch.' . &filetype<CR>
map <Leader>== mmgg=G'm
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" NERDTree
let NERDTreeShowLineNumbers=1

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
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
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

" Use ag for grepping
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" List chars
set listchars=tab:>~,nbsp:_,trail:.
set list

" Linting
command -nargs=0 Plint :!php -l %:p

" PhpQa
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_codecoverage_autorun = 1

" CtrlP.vim
let g:ctrlp_working_path_mode = 0

" Trim whitespace
autocmd BufWritePre *.* :%s/\s\+$//e

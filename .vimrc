set title
set nocompatible
set encoding=utf-8
set nowrap
set number
set wildmenu
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
set hlsearch showmatch
set ruler
set cursorline
set showcmd

" always show status bar
set laststatus=2

if has('gui_running')
    set guioptions-=T   " Get rid of toolbar "
    set guioptions-=m   " Get rid of menu    "
    winpos 0 0
    set lines=60
    set columns=190
    if has("gui_gtk2")
        set guifont=Anonymous\ Pro\ 14
    elseif has("gui_win32")
        set guifont=Anonymous_Pro
    endif
endif

" Incremental, case-ignoring search
set incsearch
set ignorecase
set smartcase


" I almost always use git
set nobackup
set nowritebackup
set noswapfile

:colorscheme desert
syntax on
"Python tabbing, set as default for all files for now
set tabstop=8
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

set autoindent
set smartindent
set incsearch
set ignorecase
set expandtab
set nowrap 

"Ignore whitespace in diffs
set diffopt+=iwhite

filetype off
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
execute pathogen#incubate('bundles/always/{}')
if has('python')
    execute pathogen#incubate('bundles/python/{}')
endif
call pathogen#helptags()
filetype plugin indent on

" From http://tottinge.blogsome.com/use-vim-like-a-pro/my-vimrc/
" Omnicomplete
if has("autocmd")
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete
    autocmd BufNewFile,BufRead *.json set ft=javascript
endif

autocmd BufNewFile,BufRead *.json set ft=javascript

let g:netrw_liststyle=3

let mapleader = ","

" status line
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set statusline+=%{fugitive#statusline()} "fugitive branch name


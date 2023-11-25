" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Enable type file detection
filetype on

" Enable plugins and load plugin for the detected file type
filetype plugin on

" Load an indent file for the detected file type
filetype indent on

" Turn syntax highlighting on
syntax on

" Add numbers to each line on the left-hand side.
" set number

" Set shift width to 4 spaces
set shiftwidth=4

" Set tab width to 4 columns
set tabstop=4

" Use space characters instead of tabs
set expandtab

" Do not save backup files
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling
set scrolloff=10

" Do not wrap lines
set nowrap

" Search though file incrementally highlighting matches
set incsearch

" Ignore capital letters during search
set ignorecase

" Override the ignorecase option if searching for capital letters
set smartcase

" Show matching words during a search
set showmatch

" Always show status line
:set laststatus=2

" disable netrw banner
let g:netrw_banner = 0
" use basic tree list style
let g:netrw_liststyle = 4
" vsplit netrw to the left pane
let g:netrw_altv = 1
" 25% of the window for the netrw pane
let g:netrw_winsize = 25

" map ctrl-n to :Lexplore
map <C-l> :Lexplore <CR>

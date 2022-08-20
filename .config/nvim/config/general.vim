" highlight column 80
set colorcolumn=80
"set columns=80
hi ColorColumn ctermbg=242
set wrap

" set utf-8 encoding
set encoding=utf-8

" Allow clipboard
set clipboard^=unnamedplus

" Hybrid Numbering
set relativenumber
set number

" Set to auto read when a file is changed from the outside
set autoread

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Use Unix line endings
set fileformats=unix,dos,mac

" When searching try to be smart about cases 
set smartcase

" Search like browsers do
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show types of whitespaces
set list listchars=tab:❘-,trail:· ",extends:»,precedes:«,nbsp:×

" Show matchlng brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Highlight cursor line/column
set cursorline
set cursorcolumn
hi clear CursorLine
hi clear CursorLineNr
hi link CursorLine CursorColumn
hi link CursorLineNr CursorColumn

" Set current directory to store swapfiles
set directory=.//

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Set no line wraps
"set nowrap
set textwidth=80

" Set indent rules per filetype
filetype indent on

" Set persistent undo directory
set undodir=~/.config/nvim/undodir
set undofile

" Prevent cursor updates
set guicursor=

" Enabling python3 provider inside virtualenvs
let g:python3_host_prog='/usr/bin/python3'

" Setting window split locations
set splitbelow
set splitright

" Enable code folding
set foldmethod=indent
set foldlevel=99

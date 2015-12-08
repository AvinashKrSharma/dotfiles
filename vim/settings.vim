" ######## Vim settings

" ----important
set nocompatible
runtime macros/matchit.vim      " to make % switch b/w opening & closing brackets

" ----moving around,searching and patterns
set path=$PWD/**
set incsearch
set ignorecase
set smartcase

" ----tags
set tags=./tags;/

" ----displaying text ----
set linebreak
set scrolloff=3
set sidescrolloff=10
set fillchars+=stl:\ ,stlnc:\
set nolist
set listchars=tab:>-,trail:·,eol:$
set number
set relativenumber

" ----syntax, highlighting and spelling
set background=dark
filetype on
syntax enable
set hlsearch
set cursorcolumn
set cursorline
set colorcolumn=+1

" ----multiple windows
set laststatus=2        " always show airline status bar
set hidden
set splitbelow
set splitright

" ----terminal
set ttyfast
set title

" ----using the mouse
set mouse=a

" ----messages and info
set shortmess=I
set showcmd
set noshowmode
set ruler

" ----editing text
set modifiable
set textwidth=80
set backspace=indent,eol,start
set completeopt=menuone,preview
set omnifunc=syntaxcomplete#Complete
set matchpairs+=<:>
set showmatch

" ----tabs and indenting
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set shiftround
set expandtab
set autoindent
set smartindent

" ----folding
set foldtext=MyFoldText()
set foldmethod=indent

" ----diff mode
set diffopt=vertical

" ----reading and writing files
set backup
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set autowrite
set autoread

" ----the swap file
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set swapfile

" ----command line editing
set history=1000
set wildcharm=<TAB>
set wildmode=list:longest,full      " pressing tab takes to next command
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set wildmenu        " show available option in command mode
set undofile

" ----executing external commands
set formatprg=par\ -w50

" ----language specific
set iskeyword+=-

" ----multi-byte characters
set encoding=utf-8
set fileencoding=utf-8

" ----various
set gdefault

" ----others
let mapleader = "\<Space>"
set t_Co=256
colorscheme tir_black
filetype plugin indent on

" ----highlight spell errors
hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

" ####### Vim settings

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
set showbreak=↪
set scrolloff=1
set sidescrolloff=10
set fcs+=vert:│
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
" set spell

" ----multiple windows
set laststatus=2        " always show airline status bar
set hidden
set splitbelow
set splitright

" ----terminal
set ttyfast
set title

" ----using the mouse
if has('mouse')
    set mouse=a
endif

if !has('nvim')
    set ttymouse=xterm2
endif

" ----messages and info
set shortmess=I
set showcmd
set noshowmode
set ruler

" ----editing text
set undofile
set undodir=$HOME/.vim/tmp
set modifiable
set textwidth=120
set backspace=indent,eol,start
set complete=.,w,b,u,t,k
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
set foldlevel=99
set foldmethod=syntax

" ----diff mode
set diffopt=vertical

" ----reading and writing files
set backup
set backupdir=$HOME/.vim/tmp
set autowrite
set autoread

" ----the swap file
set directory=$HOME/.vim/tmp
set swapfile

" ----command line editing
set history=1000
set wildcharm=<TAB>
set wildmode=list:longest,full      " pressing tab takes to next command
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set wildmenu        " show available option in command mode

" ----executing external commands
set formatprg=par\ -w50

" ----language specific
" set iskeyword+=-

" ----multi-byte characters
set encoding=utf-8
set fileencoding=utf-8

" ----various
set gdefault

" ----others
let mapleader = "\<Space>"
set t_Co=256
filetype plugin indent on

" ----highlight spell errors
hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

" ----highlight bad words in red
hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


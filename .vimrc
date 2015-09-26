" ----important
set nocompatible
set pastetoggle=<F4>
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/angular-vim-snippets/snippets/javascript/angular_js.snippets
set rtp+=~/.vim/bundle/angular-vim-snippets/snippets/html/angular_html.snippets
runtime macros/matchit.vim      " enable matchit

" ----moving around,searching and patterns
set path=$PWD/**
set incsearch
set ignorecase
set smartcase

" ----displayig text ----
set scrolloff=3
set linebreak
set fillchars+=stl:\ ,stlnc:\
set list lcs=tab:\|\
set number

" ----syntax, highlighting and spelling
set background=dark
filetype on
syntax enable
set hlsearch
set cursorline

" ----multiple windows
set laststatus=2        " always show airline status bar
set statusline+=%#warningmsg#       " for syntastic"
set statusline+=%{SyntasticStatuslineFlag()} "
set statusline+=%* "
set hidden
set splitright

" ----using the mouse
set mouse=a

" ----messages and info
set showcmd

" ----editing text
set modifiable
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
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
set foldmethod=indent

" ----reading and writing files
set backup
set autoread

" ----the swap file
set swapfile

" ----command line editing
set wildmode=list:longest,full
set wildmenu
set undofile

" ----multi-byte characters
set encoding=utf-8
set fileencoding=utf-8

" ----various
set gdefault

" ----others
let mapleader = ','
set t_Co=256
colorscheme darcula
filetype plugin indent on

" ----mappings
nnoremap <leader>ev :tabe $MYVIMRC<cr>      " open .vimrc to edit
nnoremap <leader>so :so $MYVIMRC<cr>        " source .vimrc file
nnoremap <silent><leader>n :set relativenumber!<cr>     " toggle relativenumber
nnoremap <leader><leader> <c-^>     " toggle between buffers
nnoremap Y y$       " make Y copy whole line from the current cursor position
nnoremap <c-c> <c-_><c-_>       " map TComment command to Ctrl+c 
nnoremap <space> za     " toggle fold
noremap <leader>a ggVG      " select all in normal mode

let g:ctrlp_map = '<c-p>'       " map CtrlP to <c-p>
let g:ctrlp_cmd = 'CtrlP'

" ----abbreviations for common mistyped commands
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev Q q

" ----autocommands
autocmd BufRead,BufWritePre *.html normal gg=G      " for indenting files on opening and saving
autocmd BufRead,BufWritePre *.css normal gg=G
autocmd BufRead,BufWritePre *.js normal gg=G
autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd VimEnter * NERDTreeMirror       " open nerdtree by default 

" ----plugin specific settings
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

let g:syntastic_always_populate_loc_list = 1        " for syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']        " to change ycm keymaps
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:airline#extensions#tabline#enabled = 1        " for airline plugin
function! AirLineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
    let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l/%L', '%c'])
endfunction
autocmd VimEnter * call AirLineInit()

" ----for Vundle plugin management
call vundle#begin()
" general plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
" web dev related plugins
Plugin 'docunext/closetag.vim'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'matthewsimo/angular-vim-snippets'
call vundle#end()

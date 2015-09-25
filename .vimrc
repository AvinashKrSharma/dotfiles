" Basic settings
set nocompatible
set modifiable
let mapleader = ','
set autoread
set t_Co=256
set mouse=a
set number
set noswapfile
set background=dark
set splitright
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set nohidden
set fillchars+=stl:\ ,stlnc:\
set path=$PWD/**
set showcmd
set wildmenu
set wildmode=list:longest,full
colorscheme darcula

" indentation, paste & other syntax related settings
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set pastetoggle=<F4>
set list lcs=tab:\|\ 
set backspace=indent,eol,start
set showmatch
set autoindent
set smartindent
set foldmethod=indent
set colorcolumn=80
syntax enable
filetype on

" search related settings
set gdefault
set smartcase
set hlsearch
set ignorecase
set incsearch
runtime macros/matchit.vim              " enable matchit

" enable auto-completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" custom mappings
let g:ctrlp_map = '<c-p>'               " map CtrlP to <c-p>
let g:ctrlp_cmd = 'CtrlP'
nmap <c-c> <c-_><c-_>                   " map TComment command to Ctrl+c 
nnoremap <space> za                     " toggle fold
noremap <leader>a ggVG                  " select all in normal mode


" some settings for installed plugins
" set runtimepaths for vundle and snippets
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/angular-vim-snippets/snippets/javascript/angular_js.snippets
set rtp+=~/.vim/bundle/angular-vim-snippets/snippets/html/angular_html.snippets

" for javascript-libraries-syntax, set libraries being used
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

" settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" for airline plugin
set laststatus=2 " always show airline status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'

" open NerdTree by default
autocmd VimEnter * NERDTreeMirror


" for Vundle plugin management
call vundle#begin()
" general plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab'
Plugin 'powerline/fonts'
Plugin 'airblade/vim-gitgutter'
" web dev related plugins
Plugin 'docunext/closetag.vim'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'garbas/vim-snipmate'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'marijnh/tern_for_vim'
Plugin 'prefixer.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Basic settings
set nocompatible
set modifiable
let mapleader = ','
set autoread
set showcmd
set t_Co=256
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set gdefault
set hlsearch
set ignorecase
set incsearch
set list lcs=tab:\|\ 
set foldmethod=indent
set noswapfile
set laststatus=2
set background=dark
set number
set showmatch
set smartcase
set smartindent
set splitright
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set pastetoggle=<F4>
set wildmenu
set wildmode=list:longest,full
set mouse=a
set fillchars+=stl:\ ,stlnc:\
syntax enable
colorscheme darcula
set nohidden
filetype on                  " required
set path=$PWD/**
" set shell = ~/.bashrc

" enable auto-completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" map TComment command to Ctrl+c 
nmap <c-c> <c-_><c-_>

nnoremap <space> za

noremap <leader>a ggVG

runtime macros/matchit.vim

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

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
" settings for syntastic ends

" for airline plugin
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
Plugin 'vim-scripts/prefixer.vim'
Plugin 'groenewege/vim-less'
Plugin 'marijnh/tern_for_vim'
Plugin 'prefixer.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

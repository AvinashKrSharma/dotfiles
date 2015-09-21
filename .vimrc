" Basic settings
set nocompatible              " be iMproved, required
set modifiable
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
set foldmethod=syntax
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
set pastetoggle=<leader>p
syntax enable
colorscheme default
let mapleader = ','
filetype on                  " required
" set shell = ~/.bashrc

" enable auto-completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

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

" web dev related plugins
Plugin 'docunext/closetag.vim'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'garbas/vim-snipmate'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'matthewsimo/angular-vim-snippets'
" Plugin 'marijnh/tern_for_vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

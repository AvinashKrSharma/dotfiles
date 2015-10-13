" ----important
set nocompatible
set pastetoggle=<F4>
set rtp+=~/.vim/bundle/Vundle.vim
runtime macros/matchit.vim      " enable matchit

" ----moving around,searching and patterns
set path=$PWD/**
set incsearch
set ignorecase
set smartcase

" ----displaying text ----
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
set hidden
set splitbelow
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
" set backup
set autowrite
set autoread

" ----the swap file
" set swapfile

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
let mapleader = "\<Space>"
set t_Co=256
colorscheme darcula
filetype plugin indent on

" ----mappings
nnoremap Y y$       " make Y copy whole line from the current cursor position
nnoremap \ :echo &mod<cr>
nnoremap \\ :w<cr>
nnoremap f za     " toggle fold
nnoremap gV `[v`]   " highlight last inserted text

" ----leader key mappings
nnoremap <leader>n gg=G''      " indent whole file
noremap <leader>a ggVG      " select all in normal mode
nnoremap <silent><leader>l :set relativenumber!<cr>     " toggle relativenumber
nnoremap <leader>b <c-^>     " toggle between buffers

" toggle between terminal and vim mouse
map <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
function ShowMouseMode()
    if (&mouse == 'a')
        set number
        echo "mouse-vim"
    else
        set nonumber
        echo "mouse-xterm"
    endif
endfunction

" ----mappings for plugins using leader key
map <leader>m <c-_><c-_>       " map TComment command to Ctrl+c
nnoremap <leader>s <esc>:SyntasticToggleMode<cr>
nnoremap <leader>g <esc>:GundoToggle<CR>

" ----for vim expand region plugin
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ----abbreviations for common mistyped commands
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev Q q

" ----autocommands
au FocusLost * silent! wa
autocmd BufReadPost *.html normal gg=G''      " for indenting files on opening and saving
autocmd BufReadPost *.css normal gg=G''
autocmd BufReadPost *.js normal gg=G''
autocmd VimEnter * NERDTreeMirror       " open nerdtree by default
au FocusLost * silent! wa
" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
            \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" ----plugin specific settings
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

" ----for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
let g:syntastic_csslint_options="--warnings=none"
let g:syntastic_javascript_jshint_args = '--config /home/avinash/.jshintrc'

" ----for ycm
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" ----for airline
let g:airline#extensions#tabline#enabled = 1
function! AirLineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
    let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l/%L', '%c'])
endfunction
autocmd VimEnter * call AirLineInit()

" Always on - rainbow paranthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ----this configures CtrlP to use git or silver searcher for autocompletion
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif
let g:ctrlp_map = '<c-p>'       " map CtrlP to <c-p>
let g:ctrlp_cmd = 'CtrlP'

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
" Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-expand-region'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'sjl/gundo.vim'
" Plugin 'YankRing.vim'
Bundle 'ntpeters/vim-airline-colornum'
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

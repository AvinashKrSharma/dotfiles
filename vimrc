" ----for Vundle plugin management
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" general plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-unimpaired'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'tpope/vim-surround'
Bundle 'ntpeters/vim-airline-colornum'
Plugin 'junegunn/limelight.vim'
Plugin 'Chiel92/vim-autoformat'
Bundle 'sickill/vim-pasta'

" web dev related plugins
Plugin 'msanders/snipmate.vim'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/MatchTag'
Plugin 'docunext/closetag.vim'
Plugin 'majutsushi/tagbar'

Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'elzr/vim-json'
Plugin 'moll/vim-node'
Plugin 'mxw/vim-jsx'
Plugin 'burnettk/vim-angular'
Plugin 'matthewsimo/angular-vim-snippets'

Plugin 'ap/vim-css-color'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'groenewege/vim-less'

call vundle#end()

" ----important
set nocompatible
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
" set list lcs=tab:\|\
set nolist
set relativenumber

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

" ----terminal
set title

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
" set autowrite
set autoread

" ----the swap file
" set swapfile

" ----command line editing
set wildmode=list:longest,full
set wildmenu
set undofile

" ----executing external commands
set formatprg=par\ -w50

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
nnoremap \ :echo &mod<cr>

" ----leader key mappings
nmap <leader>v :tabedit $MYVIMRC<cr>
nnoremap <leader>i gg=G''      " indent whole file
noremap <leader>a ggVG      " select all in normal mode
nnoremap <silent><leader>r :set relativenumber!<cr>     " toggle relativenumber
nnoremap <leader>b <c-^>     " toggle between buffers
nnoremap <leader><leader> <esc>:w<cr>

" ----mappings for plugins using leader key
nnoremap <leader>n <esc>:NERDTreeToggle<CR>
map <leader>c <c-_><c-_>       " map TComment command to Ctrl+c
nnoremap <leader>s <esc>:SyntasticToggleMode<cr>
nnoremap <leader>u <esc>:GundoToggle<CR>
nnoremap <leader>g <esc>:GitGutterToggle<CR>
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
nnoremap <leader>f <esc>:Autoformat<CR>
nmap <leader>l :Limelight!!<cr>

" ----toggle between terminal and vim mouse
map <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
function! ShowMouseMode()
    if (&mouse == 'a')
        set number
        echo "mouse-vim"
    else
        set nonumber
        echo "mouse-xterm"
    endif
endfunction

" ----abbreviations for common mistyped commands
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev Q q

" ----autocommands
" ----When editing a file, always jump to the last known cursor position.
" -----Don't do it for commit messages, when the position is invalid, or when
" ------inside an event handler.
autocmd BufReadPost *
            \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" ----Write file on losing focus
au FocusLost * :wa

" ----source file if the file being saved is .vimrc
au BufWritePost .vimrc source $MYVIMRC

" ----for proper less support
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS

" ----toggle relativenumber according to mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

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
let g:ycm_filetype_specific_completion_to_disable = { 'javascript': 1 }

" ----for airline
function! AirLineInit()
    let g:airline_powerline_fonts = 1
    let g:airline_detect_paste=1
    let g:airline_detect_modified=1
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.paste = 'ρ'
    let g:airline_left_sep='›'
    let g:airline_right_sep='‹'
    let g:airline_right_sep = ''
    let g:airline_left_sep = ''
    let g:airline_section_a = airline#section#create(['mode', '', 'branch'])
    let g:airline_section_b = airline#section#create(['hunks', '', ' %f'])
    let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l/%L  %c'])

endfunction
autocmd VimEnter * call AirLineInit()
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long' ]
let g:airline#extensions#wordcount#enabled = 1

" ----Always on - rainbow paranthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ----for Nerdtree
let g:NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.js.map$']

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

" ----for gitgutter
let g:gitgutter_max_signs = 200
let g:gitgutter_highlight_lines = 1
let g:gitgutter_enabled = 1

" ----for Limelight
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 2
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
let g:limelight_conceal_ctermfg = 240

" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
    let line = getline(v:foldstart)
    if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
        let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
        let linenum = v:foldstart + 1
        while linenum < v:foldend
            let line = getline( linenum )
            let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
            if comment_content != ''
                break
            endif
            let linenum = linenum + 1
        endwhile
        let sub = initial . ' ' . comment_content
    else
        let sub = line
        let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
        if startbrace == '{'
            let line = getline(v:foldend)
            let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
            if endbrace == '}'
                let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
            endif
        endif
    endif
    let n = v:foldend - v:foldstart + 1
    let info = " " . n . " lines"
    let sub = sub . "                                                                                                                  "
    let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
    let fold_w = getwinvar( 0, '&foldcolumn' )
    let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
    return sub . info
endfunction

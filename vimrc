" Download vim-plug if already not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

function! PatchPowerline()
    !wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    !mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
    !fc-cache -vf ~/.fonts
    !mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
endfunction

" ----Vim-plug plugin management
call plug#begin('~/.vim/bundle')

" general plugins
Plug 'flazz/vim-colorschemes'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'powerline/fonts', {'do': function('PatchPowerline')}
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter', {'on': 'GitGutterToggle'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sjl/gundo.vim'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'sessionman.vim'
Plug 'sudo.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'sickill/vim-pasta'

"html related
Plug 'msanders/snipmate.vim'
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'gregsexton/MatchTag', {'for': 'html'}
Plug 'docunext/closetag.vim', {'for': 'html'}
Plug 'spf13/vim-preview'

"js related
Plug 'marijnh/tern_for_vim', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json', {'for': 'javascript'}
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'burnettk/vim-angular', {'for': 'javascript'}
Plug 'matthewsimo/angular-vim-snippets', {'for': 'javascript'}

"css related
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'gorodinskiy/vim-coloresque'

" call vundle#end()
call plug#end()

" ----important
set nocompatible
runtime macros/matchit.vim

" ----moving around,searching and patterns
set path=$PWD/**
set incsearch
set ignorecase
set smartcase

" ----tags
set tags=./tags;/,~/.vimtags

" ----displaying text ----
set scrolloff=3
set linebreak
set fillchars+=stl:\ ,stlnc:\
set nolist
set number
set relativenumber

" ----syntax, highlighting and spelling
set background=dark
filetype on
syntax enable
set hlsearch
set cursorline
set colorcolumn=80

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
set completeopt=menuone,preview
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
set foldtext=MyFoldText()
set foldmethod=indent

" ----reading and writing files
set backup
set autowrite
set autoread

" ----the swap file
" set swapfile

" ----command line editing
set history=1000
set wildmode=list:longest,full
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
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
colorscheme codeschool
filetype plugin indent on

" ----Some more settings
" highlight spell errors
hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

" make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" ----Mappings
" leader key mappings
nnoremap   <leader>a    ggVG
nnoremap   <leader>b    :BuffergatorToggle<CR>
map        <leader>c    <c-_><c-_>
nnoremap   <leader>d    :bd<CR>
nnoremap   <leader>dd   :%bd<CR>
nnoremap   <leader>f    :Autoformat<CR>

nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gg :diffget
nnoremap <leader>gi :Git add -p %<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gn ]c
nnoremap <leader>gp [c
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gv :Gvsplit<CR>
nnoremap <leader>gw :Gwrite<CR>

nnoremap <leader>i  gg=G''
nnoremap <leader>m  :GitGutterToggle<CR>
nnoremap <leader>n  :NERDTreeToggle<CR>
nnoremap <leader>o  :OverCommandLine<CR>

nnoremap <leader>p  <Plug>yankstack_substitute_older_paste
nnoremap <leader>P  <Plug>yankstack_substitute_newer_paste
nnoremap <leader>q  :q<CR>
nnoremap <leader>s  :SyntasticToggleMode<CR>
nnoremap <leader>t  :BuffergatorTabsToggle<CR>
nnoremap <leader>u  :GundoToggle<CR>
nnoremap <leader>v  :tabedit $MYVIMRC<CR>
nnoremap <leader>w  :IndentGuidesToggle<CR>

nnoremap <leader><leader>  :w<CR>

" general mappings
map <F7> :setlocal spell! spell?<CR>
nnoremap \ :echo &mod<CR>

" Ctrlp mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" toggle between terminal and vim mouse
map <silent><F12>  :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>

" ----Abbreviations for common mistyped commands
cnoreabbrev W  w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev Q  q
cnoreabbrev d  bd
cnoreabbrev D  %bd


" ----Autocommands
" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler.
autocmd BufReadPost *
            \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" source file if the file being saved is .vimrc
au BufWritePost vimrc source $MYVIMRC

" for proper less support
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS

" toggle relativenumber according to mode
autocmd InsertEnter * set relativenumber!
autocmd InsertLeave * set relativenumber

" set indent style for html files
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" for airline 
autocmd VimEnter * call AirLineInit()

" Always on - rainbow paranthesis
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

" ----Plugin specific settings
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

" for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_auto_jump=1
let g:syntastic_enable_highlighting=1
let g:syntastic_echo_current_error=1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
let g:syntastic_csslint_options="--warnings=none"
let g:syntastic_javascript_jshint_args = '--config /home/avinash/.jshintrc'

" for ycm
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" for airline
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long' ]
let g:airline#extensions#wordcount#enabled = 1

" for ag
let g:ag_working_path_mode="r"

" for Nerdtree
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeIgnore = ['\.js.map$']

" this configures CtrlP to use git or silver searcher for autocompletion
let g:ctrlp_use_caching = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:25'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif

" for gitgutter
let g:gitgutter_max_signs = 200
let g:gitgutter_highlight_lines = 1
let g:gitgutter_enabled = 1

" ----All the function definitions
function! ShowMouseMode()
    if (&mouse == 'a')
        set number
        set relativenumber
        echo "mouse-vim"
    else
        set relativenumber!
        set nonumber
        echo "mouse-xterm"
    endif
endfunction

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


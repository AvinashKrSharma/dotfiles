" ########Install important stuff like vim-plug, npm, jshint, csslint

" ----For npm

" Check if npm is installed
let isNpmInstalled = executable("npm")

" Note: do this incase jshint/csslint installation fails because of write permissions
" sudo chown -R $(whoami) ~/.npm

" If npm isn't installed, show message to install
if !isNpmInstalled
    echo "==============================================="
    echo "Your need to install npm to enable all features"
    echo "==============================================="
endif

" Set default node modules install directory
let s:defaultNodeModules = '~/.vim/node_modules/.bin/'

" ----For creating backup directory if does not exist
" If backup directory does not exist, then create it
if !isdirectory("~/.vim/tmp")
    call mkdir("~/.vim/tmp", "p")
endif

" ----Install jshint and csslint for syntastic
" Path to jshint if it not installed, then use local installation
if isNpmInstalled
    if !executable(expand(s:defaultNodeModules . 'jshint'))
        silent ! echo 'Installing jshint' && npm --prefix ~/.vim/ install jshint
    endif
    if !executable(expand(s:defaultNodeModules . 'csslint'))
        silent ! echo 'Installing csslint' && npm --prefix ~/.vim/ install csslint
    endif
endif

" ----Turn off filetype plugins before bundles init, to make every work sane
filetype off

" ----Download vim-plug if already not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let g:doPlugInstall = "set"
endif

" Vim-plug plugin management
call plug#begin('~/.vim/bundle')

" general plugins
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'szw/vim-ctrlspace'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'kien/ctrlp.vim'
Plug 'paradigm/SkyBison'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/DirDiff.vim'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter', {'on': 'GitGutterToggle'}
Plug 'nathanaelkane/vim-indent-guides', {'on': 'IndentGuidesToggle'}
Plug 'sjl/gundo.vim'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'sudo.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'sickill/vim-pasta'
" Plug 'craigemery/vim-autotag'

"html related
Plug 'msanders/snipmate.vim'
Plug 'digitaltoad/vim-jade'
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'gregsexton/MatchTag', {'for': 'html'}
Plug 'docunext/closetag.vim', {'for': 'html'}
Plug 'spf13/vim-preview'

"js related
Plug 'marijnh/tern_for_vim', {'build' : {'unix' : 'npm install'}}
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

call plug#end()

" ----Install Plugins
if exists('doPlugInstall') 
  PlugInstall | q
endif

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

" ########Some more settings

" if You have problem with background, uncomment this line
let g:solarized_termtrans=1

" highlight spell errors
hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

" ########Mappings

" ----general mappings
map <F7> :setlocal spell! spell?<CR>
nnoremap \ :echo &mod<CR>
nmap <silent>[ :lprev<cr>    " previous syntastic error
nmap <silent>] :lnext<cr>    " next syntastic error

" folding related mappings
nnoremap zr zR
nnoremap zs zr

" mappings for page up/down, half/full
nnoremap <C-h> <C-u>
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-b>
nnoremap <C-l> <C-f>

" mappings for switching buffers
nnoremap gb :bn<cr>
nnoremap gv :bp<cr>

" toggle between terminal and vim mouse
map  <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>

" replace normal command mode with skybison
nnoremap ; :<c-u>call SkyBison("")<cr>

" ----Leader key mappings
nnoremap <leader>a  ggVG
nnoremap <leader>b  :buffers<CR>:buffer<Space>
map      <leader>c  <c-_><c-_>
nnoremap <leader>d  :bd<CR>
nnoremap <leader>e  :IndentGuidesToggle<CR>
nnoremap <leader>f  :Autoformat<CR>

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
nnoremap <leader>gt :GitGutterToggle<CR>
nnoremap <leader>gv :Gvsplit<CR>
nnoremap <leader>gw :Gwrite<CR>

nnoremap <leader>i  gg=G''
nnoremap <leader>l  :NERDTreeFind<CR>
nnoremap <leader>n  :NERDTreeToggle<CR>
nnoremap <leader>o  :OverCommandLine<CR>
nnoremap <leader>p  <Plug>yankstack_substitute_older_paste
nnoremap <leader>P  <Plug>yankstack_substitute_newer_paste
nnoremap <leader>q  :q<CR>
vmap     <leader>r  :Tabularize/ /l0<cr>
nnoremap <leader>s  :%s//<left>
vnoremap <leader>s  :s//<left>
nnoremap <leader>s  :SyntasticToggleMode<CR>
nnoremap <leader>tr :TernRefs<CR>
nnoremap <leader>tn :TernRename<CR>

nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>w <c-w>w

nnoremap <leader><leader> :update<CR>

" ########Abbreviations for common mistyped commands

cnoreabbrev W  w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev Q  q
cnoreabbrev d  bd
cnoreabbrev D  %bd

" ----Autocommands
if has("autocmd")
    augroup vimrc
        " Delete any previously defined autocommands
        au!
        " Enable omni completion.
        autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS

        " Auto reload vim after its changed
        au BufWritePost *.vim  source $MYVIMRC | AirlineRefresh
        au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh
        au BufWritePost vimrc  source $MYVIMRC | AirlineRefresh

        " Set filetypes aliases
        au FileType htmldjango set ft=html.htmldjango
        au FileType scss       set ft=scss.css
        au FileType less       set ft=less.css
        au BufRead,BufNewFile *.js   set ft=javascript.javascript-jquery
        au BufRead,BufNewFile *.json set ft=json
        " Execute python \ -mjson.tool for autoformatting *.json
        au BufRead,BufNewFile *.bemhtml set ft=javascript
        au BufRead,BufNewFile *.bemtree set ft=javascript
        au BufRead,BufNewFile *.xjst set ft=javascript
        au BufRead,BufNewFile *.tt2 set ft=tt2
        au BufRead,BufNewFile *.plaintex set ft=plaintex.tex

        " disable syntax highlighting on laaarge files
        au BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif

        " Disable vertical line at max string length in NERDTree
        autocmd FileType *        setlocal colorcolumn=+1
        autocmd FileType nerdtree setlocal colorcolumn=""

        " When editing a file, always jump to the last known cursor position.
        " Don't do it for commit messages, when the position is invalid, or when
        " inside an event handler.
        autocmd BufReadPost *
                    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif

        " for proper less support
        autocmd BufNewFile,BufRead *.less set filetype=less
        autocmd FileType           less   set omnifunc=csscomplete#CompleteCSS

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

        " Group end
    augroup END
endif


" ########Plugin specific settings
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

" ----for syntastic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_enable_highlighting=1
let g:syntastic_echo_current_error=1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
let g:syntastic_csslint_options="--warnings=none"
let g:syntastic_javascript_jshint_args = '--config /home/avinash/.jshintrc'
let g:syntastic_filetype_map = { "json": "javascript", }
let g:syntastic_javascript_checkers = ["jshint", "jscs"]


" ----for ctrlspace
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif


" ----for ycm
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']


" ----for airline
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long' ]
let g:airline#extensions#wordcount#enabled = 1


" ----for ag
let g:ag_working_path_mode="r"


" ----for Nerdtree
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeIgnore = ['\.js.map$']


" ----for snipmate
let g:snips_trigger_key = '<c-tab>'
let g:snips_trigger_key_backwards = '<c-s-tab>'


" ----for ctrlp
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


" ----for gitgutter
let g:gitgutter_max_signs = 200
let g:gitgutter_highlight_lines = 1
let g:gitgutter_enabled = 1


" ----for indentguides
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1


" ----for delimitmate

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1

" Without this we can't disable delimitMate for specific file types
let loaded_delimitMate = 1

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
    let g:airline_exclude_preview = 1
    let g:airline_detect_paste=1
    let g:airline_detect_modified=1
    let g:airline_symbols.branch = '⎇ '
    let g:airline_symbols.readonly = ''
    let g:airline_left_sep=' '
    let g:airline_right_sep=' '
    let g:airline_right_sep = ' '
    let g:airline_left_sep = ' '
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create(['branch'])
    let g:airline_section_c = airline#section#create(['%f'])
    let g:airline_section_x = airline#section#create(['type:', 'filetype'])
    let g:airline_section_y = airline#section#create(['%c'])
    let g:airline_section_z = airline#section#create_right(['%l/%L'])
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

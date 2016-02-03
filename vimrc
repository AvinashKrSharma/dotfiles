" ####### Plugins

" set rtp+="~/.vim/bundle"

" Turn off filetype plugins before bundles init, to make every work sane
filetype off

" Download vim-plug if already not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:doPlugInstall = "set"
endif

" Install Plugins for the first time
if empty(glob('~/.vim/autoload/plug.vim'))
    let g:doPlugInstall = "set"
endif

" ----Vim-plug plugin management
call plug#begin('~/.vim/bundle')

" core plugins
" Plug 'ryanoasis/nerd-fonts', {'do': './install.sh'}
" Plug 'ryanoasis/vim-devicons'
" Plug 'benmills/vimux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'szw/vim-ctrlspace'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
" Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'tomtom/tcomment_vim', {'on': 'TComment'}
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']} | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'paradigm/SkyBison'
Plug 'ervandew/supertab'
Plug 'osyo-manga/vim-over', {'on': 'OverCommandLine'}
Plug 'airblade/vim-gitgutter', {'on': 'GitGutterToggle'}
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesToggle'}
Plug 'Shougo/FastFold'
Plug 'gorkunov/smartpairs.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'sickill/vim-pasta'
Plug 'vim-scripts/DirDiff.vim', {'on': 'DirDiff'}
Plug 'editorconfig/editorconfig-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'xolox/vim-misc'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-colorscheme-switcher'

"html related
Plug 'msanders/snipmate.vim'
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'gregsexton/MatchTag', {'for': 'html'}
Plug 'docunext/closetag.vim'

"css related
Plug 'gorodinskiy/vim-coloresque'
Plug 'vim-scripts/prefixer.vim', {'for': 'css'}

"js related
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'burnettk/vim-angular', {'for': 'javascript'}
Plug 'marijnh/tern_for_vim', {'build' : {'unix' : 'npm install'}}
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'matthewsimo/angular-vim-snippets', {'for': 'javascript'}

" Typescript
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'Quramy/tsuquyomi', {'for': 'typescript'}

call plug#end()

" Install Plugins
if exists('doPlugInstall')
    PlugInstall | q
endif


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
set showbreak=...
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
set foldtext=MyFoldText()
set foldmethod=indent

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
set undofile
set undodir=$HOME/.vim/tmp

" ----executing external commands
set formatprg=par\ -w50

" ----language specific
set iskeyword+=-

" ----multi-byte characters
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
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

" ----highlight bad words in red
hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


" ####### Mappings

" ----general mappings
map <F7> :setlocal spell! spell?<CR>
nnoremap \ :echo &mod<CR>

" mappings for syntastic error navigation
" nmap <silent>[ :lprev<cr>    " previous syntastic error
" nmap <silent>] :lnext<cr>    " next syntastic error

" mappings for neomake error navigation
nnoremap <silent>] :lprev<cr>
nnoremap <silent>[ :call LocationNext()<cr>

" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi

" Navigate between display lines
noremap  <silent> <Up>   gk
noremap  <silent> <Down> gj
noremap  <silent> k gk
noremap  <silent> j gj
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End>  <C-o>g<End>

" to create new line without entering insert mode
nmap oo o<Esc>k
nmap OO O<Esc>j

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

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

" toggle between terminal and vim mouse
map  <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>

" mapping for skybison's command mode
nnoremap ; :<c-u>call SkyBison("")<cr>

" make filepath autocomplete mapping let painful
inoremap <c-f> <c-x><c-f>

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" toggle textwidth
nnoremap cot :call ToggleTextWidth()<cr>

" ----Leader key mappings
nnoremap <leader>ad :%bd<CR>
nnoremap <leader>aq :qa<CR>
nnoremap <leader>as ggVG

nnoremap <leader>b  :buffers<CR>:buffer<Space>
map      <leader>c  :TComment<cr>
nnoremap <leader>d  :bd<CR>
nnoremap <leader>e  :Neomake<CR>
" nnoremap <leader>e  :SyntasticToggleMode<CR>
nnoremap <leader>f  :Autoformat<CR>:update<CR>

" specific to git fugitive
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
nnoremap <leader>l  :IndentLinesToggle<CR>
nnoremap <leader>m  :source $MYVIMRC<CR>
nnoremap <leader>n  :NERDTreeToggle<CR>
nnoremap <leader>p  :YRShow<CR>
nnoremap <leader>q  :q<CR>
nnoremap <leader>r  :NERDTreeFind<CR>
vnoremap <leader>t  :Tabularize/ /l0<cr>
nnoremap <leader>tr :TernRefs<CR>
nnoremap <leader>tn :TernRename<CR>
nnoremap <leader>tw :%s/\s\+$//e<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>w <c-w>w

nnoremap <leader>o  :OverCommandLine<CR>
nnoremap <leader><leader> :update<CR>

nnoremap <leader>, :Ag --smart-case ""<left>


" ####### Abbreviations for common mistyped commands

cnoreabbrev W  w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev Q  q
cnoreabbrev d  bd
cnoreabbrev D  %bd


" ####### Autocommands

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
        au FileType scss       set ft=scss.css
        au FileType less       set ft=less.css
        au BufRead,BufNewFile *.json set ft=json

        " disable syntax highlighting on laaarge files
        au BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif

        " Disable vertical line at max string length in NERDTree
        autocmd FileType *        setlocal colorcolumn=+1
        autocmd FileType nerdtree setlocal colorcolumn=""

        " Run neomake on buffer write
        autocmd! BufWritePost * Neomake

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

        " set indent style and nowrap for html files
        autocmd FileType html setlocal shiftwidth=2 tabstop=2 nowrap

        " set nowrap and textwidth for jade files
        autocmd FileType jade setlocal nowrap
        autocmd FileType jade,markdown      set textwidth=0

        " for airline
        autocmd VimEnter * call AirLineInit()

        " Always on - rainbow paranthesis
        au VimEnter * RainbowParenthesesToggle
        au Syntax   * RainbowParenthesesLoadRound
        au Syntax   * RainbowParenthesesLoadSquare
        au Syntax   * RainbowParenthesesLoadBraces

        "save all files on focus lost, ignoring warnings about untitled buffers
        au FocusLost * silent! wa

        "for emmet
        autocmd FileType html imap <buffer><expr><tab> <sid>expand_html_tab()
        autocmd FileType html,css,ejs EmmetInstall

    augroup END
endif


" ####### Plugin specific settings

let g:vim_json_syntax_conceal = 0 " Don't hide Json syntax.

" ----for javascript libraries syntax
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

" ----for syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_jump=1
" let g:syntastic_enable_highlighting=1
" let g:syntastic_echo_current_error=1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_quiet_messages = { "type": "style" }
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
" let g:syntastic_filetype_map = { "json": "javascript", }
" let g:syntastic_javascript_checkers = ["jshint", "jscs"]
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '!'

" ----for ctrlspace
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceCacheDir = '$HOME/.vim/tmp'
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" ----for ycm
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" ----for polyglot
let g:polyglot_disabled = ['arduino', 'blade', 'c++11', 'clojure', 'cucumber', 'dart', 'elm', 'elixir', 'emblem', 'erlang', 'glsl', 'go', 'groovy', 'haskell', 'haxe', 'jinja', 'julia', 'kotlin', 'latex', 'liquid', 'objc', 'ocaml', 'octave', 'opencl', 'perl', 'puppet', 'qml', 'ragel', 'r-lang', 'rspec', 'ruby', 'rust', 'sbt', 'scala', 'slim', 'solidity', 'swift', 'systemd', 'textile', 'thrift', 'tomdoc', 'toml', 'twig', 'vala', 'vbnet', 'vcl', 'vm', 'yard']

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
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeIgnore=['.git$[[dir]]', '\.js.map$[[file]]']

" shamelessly copied from mhartington's nvimrc
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('less', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('scss', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#7F7F7F', 'none')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')

" ----for snipmate
let g:snips_trigger_key = '<c-tab>'
let g:snips_trigger_key_backwards = '<c-s-tab>'

" ----for emmet
" Enable Emmet in all modes
let g:user_emmet_mode='a'
let g:use_emmet_complete_tag = 1
let g:user_emmet_install_global = 0

" ----for ctrlp
let g:ctrlp_use_caching = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:25'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp|log|.bower-cache|.bower-registry|.bower-tmp)|(\.(swp|ico|png|jpg|git|svn))$'
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
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" ----for yankring
" make yanklist to appear at the bottom
let g:yankring_window_use_right = 0
" disable cycling through yanks
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''


" ####### Function definitions
function! ToggleTextWidth()
    if (&textwidth == 120)
        set textwidth=0
        echo "textwidth = 0"
    else
        set textwidth=120
        echo "textwidth = 120"
    endif
endfunction

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
    let g:airline_powerline_fonts = 1
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

function! LocationNext()                                                                  
    try                                                                                     
        lnext                                                                                 
    catch                                                                                   
        try | lfirst | catch | endtry                                                         
    endtry                                                                                  
endfunction                                                                               

" for better tab response for emmet
function! s:expand_html_tab()
    " try to determine if we're within quotes or tags.
    " if so, assume we're in an emmet fill area.
    let line = getline('.')
    if col('.') < len(line)
        let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
        if len(line) >= 2
            return "\<C-n>"
        endif
    endif
    " expand anything emmet thinks is expandable.
    if emmet#isExpandable()
        return "\<C-y>,"
    endif
    " return a regular tab character
    return "\<tab>"
endfunction

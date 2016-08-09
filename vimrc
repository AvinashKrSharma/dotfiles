" ####### Plugins

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
Plug 'thinca/vim-quickrun'
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']} | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'tomtom/tcomment_vim', {'on': 'TComment'}
Plug 'osyo-manga/vim-over', {'on': 'OverCommandLine'}
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'tpope/vim-unimpaired'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/DirDiff.vim', {'on': 'DirDiff'}
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'ervandew/supertab'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Konfekt/FastFold'
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'paradigm/SkyBison'
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesToggle'}
Plug 'aquach/vim-http-client'
Plug 'xolox/vim-misc' "Used by colorscheme-switcher
Plug 'dhruvasagar/vim-table-mode'

"html related
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'gregsexton/MatchTag', {'for': 'html'}
Plug 'docunext/closetag.vim'
Plug 'bendavis78/vim-polymer'

"css related
Plug 'gorodinskiy/vim-coloresque', {'for': ['css', 'scss']}
Plug 'vim-scripts/prefixer.vim', {'for': 'css', 'on': ['Prefixer', 'Prefixer1', 'Prefixer2']}

"js related
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}

call plug#end()

" Install Plugins
if exists('doPlugInstall')
    PlugInstall | q
endif

" set colorscheme after loading colorschemes
colorscheme tir_black

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
set updatetime=250

" ----command line editing
set history=1000
set wildcharm=<TAB>
set wildmode=list:longest,full      " pressing tab takes to next command
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set wildmenu        " show available option in command mode

" ----executing external commands
set formatprg=par\ -w50
set makeprg=make\ -C\ ./\ -j9

" ----language specific
" set iskeyword+=-

" ----multi-byte characters
if !has('nvim')
    set encoding=utf-8
endif
set fileencoding=utf-8

" ----various
set exrc
set secure
set gdefault

" ----others
let mapleader = "\<Space>"
let &path.="src/include,/usr/include/AL,"
set t_Co=256
filetype plugin indent on

" ----highlight spell errors
hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

" ----highlight bad words in red
hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


" ####### Mappings

" ----general mappings
map <F7> :setlocal spell! spell?<CR>

" mappings for neomake error navigation
nnoremap <silent>[ :lprev<cr>
nnoremap <silent>] :call LocationNext()<cr>

" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi

" make search results appear at the center of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" to resize splits
nnoremap <C-left> :vertical resize -2<cr>
nnoremap <C-down> :resize -2<cr>
nnoremap <C-up> :resize +2<cr>
nnoremap <C-right> :vertical resize +2<cr>

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
nnoremap <C-h> <C-b>
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-u>
nnoremap <C-l> <C-d>

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

" make filepath autocomplete mapping less painful
inoremap <c-f> <c-x><c-f>

" useful for opening quickfix window
nnoremap ]o :copen<cr>

" toggle textwidth
nnoremap cot :call ToggleTextWidth()<cr>

" for ctrlpbuffer
nnoremap <c-b> :CtrlPBuffer<CR>

" ----Leader key mappings
nnoremap <leader>ad :%bd<CR>
nnoremap <leader>aq :qa<CR>
nnoremap <leader>as ggVG
nnoremap <leader>b  :call ToggleNERDTreeQOOBehaviour()<cr>

map      <leader>c  :TComment<cr>
nnoremap <leader>d  :bd<CR>
nnoremap <leader>f  :NERDTreeFind<CR>

" specific to git fugitive
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gg :diffget
nnoremap <leader>gi :Git add -p %<CR>
nnoremap <leader>gl :Gitv<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gt :GitGutterToggle<CR>
nnoremap <leader>gv :Gvsplit<CR>
nnoremap <leader>gw :Gwrite<CR>

nnoremap <leader>i :IndentLinesToggle<CR>
nnoremap <leader>k :!gcc % -o %.o<cr><cr> :!./%.o<cr>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>p :YRShow<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>r :QuickRun<cr>
vnoremap <leader>t :Tabularize/ /l0<cr>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>v :tabedit ~/dotfiles/vimrc<CR>
nnoremap <leader>w <c-w>w

nnoremap <leader><leader> :update<CR>
nnoremap <leader> :%s/\s\+$//e<CR> "Remove unwanted spaces
nnoremap <leader>, :Ag --smart-case ""<left>
nnoremap <leader>/ <esc>:OverCommandLine<CR>:%s/
nnoremap <leader>= gg=G''


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
        autocmd FileType css,scss,less setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS

        " Auto reload vim after its changed
        au BufWritePost *.vim  source $MYVIMRC | AirlineRefresh
        au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh
        au BufWritePost vimrc  source $MYVIMRC | AirlineRefresh

        " Set filetypes aliases
        au FileType           scss   set ft=scss.css
        au FileType           less   set ft=less.css
        au BufRead,BufNewFile *.json set ft=json

        " disable syntax highlighting on laaarge files
        au BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif

        " for gitgutter
        autocmd User GitGutter AirlineRefresh

        " disable syntax highlighting for jade files to speed things up
        autocmd FileType jade    setlocal syntax=off

        " Disable vertical line at max string length in NERDTree
        autocmd FileType nerdtree setlocal colorcolumn=""

        " Run neomake on buffer write
        autocmd FileType javascript :call ResolveESLint()
        autocmd! BufWritePost,BufReadPost * Neomake

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

        "for deoplete
        autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

        " Adding automatons for when entering or leaving Vim
        au VimEnter * nested :call LoadSession()
        au VimLeave * :call MakeSession()))

    augroup END
endif


" ####### Plugin specific settings

" ----for javascript libraries syntax
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

" ----for polyglot
let g:polyglot_disabled = ['arduino', 'blade', 'c++11', 'clojure', 'cucumber', 'dart', 'elm', 'elixir', 'emblem', 'erlang', 'glsl', 'groovy', 'haskell', 'haxe', 'jinja', 'julia', 'kotlin', 'latex', 'liquid', 'objc', 'ocaml', 'octave', 'opencl', 'perl', 'puppet', 'qml', 'ragel', 'r-lang', 'rspec', 'ruby', 'rust', 'sbt', 'scala', 'slim', 'solidity', 'swift', 'systemd', 'textile', 'thrift', 'tomdoc', 'toml', 'twig', 'vala', 'vbnet', 'vcl', 'vm', 'yard']

" ----for airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long' ]
let g:airline#extensions#wordcount#enabled = 1
let g:airline_theme = 'term'
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
let g:airline_section_b = airline#section#create(['%f'])
let g:airline_section_c = airline#section#create(['branch', '  ', 'hunks'])
let g:airline_section_x = airline#section#create(['filetype'])
let g:airline_section_y = airline#section#create(['%c'])
let g:airline_section_z = airline#section#create_right(['%l/%L'])


" ----for ag
let g:ag_working_path_mode="r"

" ----for deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" ----for Nerdtree
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeMouseMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1
let g:NERDTreeIgnore=['.git$[[dir]]', '\.js.map$[[file]]']

" shamelessly copied from mhartington's nvimrc
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'NONE', 'green', 'NONE')
call NERDTreeHighlightFile('md', 'blue', 'NONE', '#6699CC', 'NONE')
call NERDTreeHighlightFile('conf', 'yellow', 'NONE', '#d8a235', 'NONE')
call NERDTreeHighlightFile('json', 'green', 'NONE', '#d8a235', 'NONE')
call NERDTreeHighlightFile('html', 'yellow', 'NONE', '#d8a235', 'NONE')
call NERDTreeHighlightFile('css', 'cyan', 'NONE', '#5486C0', 'NONE')
call NERDTreeHighlightFile('less', 'cyan', 'NONE', '#5486C0', 'NONE')
call NERDTreeHighlightFile('scss', 'cyan', 'NONE', '#5486C0', 'NONE')
call NERDTreeHighlightFile('coffee', 'Red', 'NONE', 'red', 'NONE')
call NERDTreeHighlightFile('js', 'Red', 'NONE', '#ffa500', 'NONE')
call NERDTreeHighlightFile('ts', 'Blue', 'NONE', '#6699cc', 'NONE')
call NERDTreeHighlightFile('ds_store', 'Gray', 'NONE', '#686868', 'NONE')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'NONE', '#7F7F7F', 'NONE')
call NERDTreeHighlightFile('gitignore', 'Gray', 'NONE', '#7F7F7F', 'NONE')

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
let g:gitgutter_highlight_lines = 0
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
"fix for yankring and neovim
let g:yankring_clipboard_monitor=0"

" ----for neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_warning_sign = {
    \ 'text': 'W',
    \ 'texthl': 'WarningMsg',
    \ }
let g:neomake_error_sign = {
    \ 'text': 'E',
    \ 'texthl': 'ErrorMsg',
    \ }

" ####### Function definitions
set foldtext=MyFoldText()

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

" for toggling nerdtree's quit on open behaviour
function! ToggleNERDTreeQOOBehaviour()
    if (g:NERDTreeQuitOnOpen == 1)
        let g:NERDTreeQuitOnOpen=0
    else 
        let g:NERDTreeQuitOnOpen=1
    endif
endfunction

function! ResolveESLint()
    let l:npm_bin = ''
    let l:eslint = 'eslint'
    if executable('npm')
      let l:npm_bin = split(system('npm bin'), '\n')[0]
    endif
    if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
      let l:eslint = l:npm_bin . '/eslint'
    endif
    let b:neomake_javascript_eslint_exe = l:eslint
endfunction

function! MakeSession()
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    let b:filename = b:sessiondir . '/session.vim'
    exe "mksession! " . b:filename
endfunction

function! LoadSession()
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe 'source ' b:sessionfile
    else
        echo "No session loaded."
    endif
endfunction


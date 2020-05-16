" ####### Plugins

" Download vim-plug if already not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:doPlugInstall = "set"
endif

" Install Plugins for the first time
if empty(glob('~/.vim/autoload/plug.vim'))
    let g:doPlugInstall = "set"
endif

" ----Vim-plug plugin management
call plug#begin('~/.vim/bundle')

" core plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
if !has('nvim')
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
else
    Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
endif
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-janah'
Plug 'arcticicestudio/nord-vim'

" version control related plugins
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/DirDiff.vim', {'on': 'DirDiff'}
Plug 'gregsexton/gitv'
Plug 'stormherz/tablify'

" search/editing/navigation related plugins
Plug 'osyo-manga/vim-over', {'on': 'OverCommandLine'}
Plug 'osyo-manga/vim-anzu'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'terryma/vim-expand-region'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim', {'on': 'TComment'}
Plug 'terryma/vim-multiple-cursors'
Plug 'gorkunov/smartpairs.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-abolish'

" misc
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-unimpaired'
Plug 'mbbill/undotree'
Plug 'Konfekt/FastFold'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-repeat'
Plug 'kshenoy/vim-signature'
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesToggle'}

"language related
Plug 'w0rp/ale'
Plug 'thinca/vim-quickrun'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'gregsexton/MatchTag', {'for': 'html'}
Plug 'docunext/closetag.vim'
Plug 'gorodinskiy/vim-coloresque', {'for': ['css', 'scss']}

call plug#end()

" Install Plugins
if exists('doPlugInstall')
    PlugInstall | q
endif


" ####### Vim settings

" ----important
set nocompatible
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" ----moving around,searching and patterns
set path=$PWD/**
set incsearch
set ignorecase
set smartcase

" ----tags
set tags=./tags;/

" ----displaying text ----
set nowrap
set linebreak
set showbreak=↪
set sidescrolloff=10
set fcs+=vert:│
set fillchars+=stl:\ ,stlnc:\
set lazyredraw
set nolist
set listchars=tab:>-,trail:·,eol:$
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

" ----terminal
set ttyfast
set title

" ----using the mouse
if has('mouse')
    set mouse=a
    set mousemodel=extend
endif

if !has('nvim')
    set ttymouse=xterm2
endif

" ---gui
set guioptions=agit

" ----messages and info
set shortmess=aIt
set showcmd
set noshowmode
set ruler
set confirm

" ----editing text
set undodir=$HOME/.vim/tmp
set undofile
set modifiable
set termguicolors
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
set foldmethod=indent
set foldtext=MyFoldText()
set foldlevel=99

" ----diff mode
set diffopt=vertical

set clipboard=unnamedplus

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

" colorscheme janah
colorscheme nord

" ----others
let mapleader = "\<Space>"
let &path.="src/include,/usr/include/AL,"
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif
filetype plugin indent on

" ----make background transparent
hi Normal guibg=NONE ctermbg=NONE

" ----highlight spell errors
hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

" ----highlight bad words in red
hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


" ####### Mappings

" ----general mappings

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi

" to resize splits
nnoremap <C-left> :vertical resize -2<cr>
nnoremap <C-down> :resize -2<cr>
nnoremap <C-up> :resize +2<cr>
nnoremap <C-right> :vertical resize +2<cr>

" Navigate between display lines
noremap  <silent> k gk
noremap  <silent> j gj

" mappings for switching buffers
nnoremap gb :bn<cr>
nnoremap gv :bp<cr>

" toggle between terminal and vim mouse
map  <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>

" make filepath autocomplete mapping less painful
inoremap <c-f> <c-x><c-f>

" for doing away with removal of indentation of # comments in python
inoremap # X<BS>#

" toggle textwidth
nnoremap cot :call ToggleTextWidth()<cr>

" for incremental search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" ---- for vim-anzu
" mapping
map n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
map N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
map * <Plug>(incsearch-nohl)<Plug>(anzu-star-with-echo)
map # <Plug>(incsearch-nohl)<Plug>(anzu-sharp-with-echo)
" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

" ----Leader key mappings
nnoremap <leader>ad :%bd<CR>
nnoremap <leader>as ggVG
nnoremap <leader>b  :Buffers<CR>

map      <leader>c  :TComment<cr>
nnoremap <leader>d  :bd<CR>
nnoremap <leader>f  :GFiles<CR>

" specific to git fugitive
nnoremap <leader>g  :Magit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gf :BCommits<CR>
nnoremap <leader>gi :Git add -p %<CR>
nnoremap <leader>gl :Commits<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gt :GitGutterToggle<CR>
nnoremap <leader>h  :History<CR>

nnoremap <leader>i :IndentLinesToggle<CR>
nnoremap <leader>j :ALEGoToDefinition<CR>
nnoremap <leader>m :History<cr>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>q :qa<CR>
nnoremap <leader>r :NERDTreeFind<CR>
vnoremap <leader>t :Tabularize/ /l0<cr>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>v :tabedit ~/dotfiles/vimrc<CR>
nnoremap <leader>w <c-w>w
nnoremap <leader><leader> :update<CR>
nnoremap <leader>, :Ag!<CR>
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
        au BufWinEnter * if line2byte(line("$") + 1) > 500000 | syntax clear | endif

        autocmd BufRead * if @% == '[quickrun output]' | setlocal noconfirm | endif

        " open nerdtree by default to make file reveal work sanely
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif

        " for gitgutter
        autocmd User GitGutter AirlineRefresh

        " Disable vertical line at max string length in NERDTree
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

        " set nowrap for html files
        autocmd FileType html setlocal nowrap

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

        
        "for deoplete
        if has('nvim')
            autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
        endif

        " Adding automatons for when entering or leaving Vim
        au VimEnter * nested :call LoadSession()
        au VimLeave * :call MakeSession()

    augroup END
endif


" ####### Plugin specific settings

" ----for javascript libraries syntax
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

" ----for polyglot
let g:polyglot_disabled = ['arduino', 'blade', 'c++11', 'clojure', 'cucumber', 'dart', 'elm', 'elixir', 'emblem', 'erlang', 'glsl', 'groovy', 'haskell', 'haxe', 'jinja', 'julia', 'kotlin', 'latex', 'liquid', 'objc', 'ocaml', 'octave', 'opencl', 'perl', 'puppet', 'qml', 'ragel', 'r-lang', 'rspec', 'ruby', 'rust', 'sbt', 'slim', 'solidity', 'swift', 'systemd', 'textile', 'thrift', 'tomdoc', 'toml', 'twig', 'vala', 'vbnet', 'vcl', 'vm', 'yard']

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
" let g:airline_theme = 'term'
let g:airline_exclude_preview = 1
let g:airline_detect_paste=1
let g:airline_detect_modified=1
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_right_sep = ' '
let g:airline_left_sep = ' '
let g:airline_powerline_fonts = 1

" ----for ale
let g:ale_completion_enabled = 1
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" ----for ycm
if !has('nvim')
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
endif

" ----for deoplete
if has('nvim')
    let g:deoplete#enable_at_startup = 1
    if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
    endif
    let g:deoplete#num_processes = 1
endif

" ----for Nerdtree
let g:nerdtree_tabs_open_on_gui_startup=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeMouseMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1
let g:NERDTreeIgnore=['.git$[[dir]]', '\.js.map$[[file]]']

" ----for vim-nerdtree-syntax-highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" ---for easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" ----for gitgutter
let g:gitgutter_max_signs = 500
let g:gitgutter_highlight_lines = 0
let g:gitgutter_enabled = 1

" ----for indentguides
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

" ----for delimitmate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

"for indentLine
let g:indentLine_char = '┊'

"for closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

"for delimitmate
let delimitMate_matchpairs = "(:),[:],{:}"
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" for fzf
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


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
        GitGutterEnable
        echo "mouse-vim"
    else
        :GitGutterDisable
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

" for toggling nerdtree's quit on open behaviour
function! ToggleNERDTreeQOOBehaviour()
    if (g:NERDTreeQuitOnOpen == 1)
        let g:NERDTreeQuitOnOpen=0
    else
        let g:NERDTreeQuitOnOpen=1
    endif
endfunction

function! MakeSession()
  exe 'NERDTreeClose'
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  exe 'NERDTreeClose'
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

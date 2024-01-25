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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'princejoogie/dir-telescope.nvim'

Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-treesitter/nvim-treesitter',  {'do': ':TSUpdate'}
Plug 'arcticicestudio/nord-vim'

" version control related plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'dandavison/delta'

" search/editing/navigation related plugins
Plug 'osyo-manga/vim-over', {'on': 'OverCommandLine'}
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim', {'on': 'TComment'}
Plug 'gorkunov/smartpairs.vim'
Plug 'Raimondi/delimitMate'

" misc
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-repeat'
Plug 'kshenoy/vim-signature'

"language related
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'gregsexton/MatchTag', {'for': 'html'}
Plug 'docunext/closetag.vim'
Plug 'gorodinskiy/vim-coloresque', {'for': ['css', 'scss']}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

call plug#end()

" Install Plugins
if exists('doPlugInstall')
    PlugInstall | q
endif

lua << EOF
require("telescope").load_extension("dir")
EOF

" ####### Vim settings

" ----important
set nocompatible

" ----moving around,searching and patterns
set path+=**
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
syntax off
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
    set encoding=UTF-8
endif
set fileencoding=utf-8

" ----various
set exrc
set secure
set gdefault

colorscheme nord
if (has("termguicolors"))
    set termguicolors
endif

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
cmap w!! w !sudo tee %

" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi
inoremap jk <esc>
inoremap kj <esc>
" to resize splits
nnoremap <C-left> :vertical resize -2<cr>
nnoremap <C-down> :resize -2<cr>
nnoremap <C-up> :resize +2<cr>
nnoremap <C-right> :vertical resize +2<cr>

" Navigate between display lines
noremap  <silent> k gk
noremap  <silent> j gj

" mappings for switching buffers
nnoremap <TAB> :bn<cr>
nnoremap <S-TAB> :bp<cr>

nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>

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

" ----Leader key mappings
nnoremap <leader>ad :%bd\|e#\|bd#<CR>
nnoremap <leader>b  :Telescope buffers<CR>
map      <leader>c  :TComment<cr>
nnoremap <leader>d  :bd<CR>
nnoremap <leader>f  :Telescope git_files<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>i ggVG
nnoremap <leader>j :ALEGoToDefinition<CR>
nnoremap <leader>m :Telescope oldfiles<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>p :Telescope<CR>
nnoremap <leader>q :qa<CR>
nnoremap <leader>r :NERDTreeFind<CR>
nnoremap <leader>s /<c-r>+
nnoremap <leader>v :tabedit ~/dotfiles/vimrc<CR>
nnoremap <leader>w <c-w>w
nnoremap <leader><leader> :update<CR>
nnoremap <leader>, :Telescope live_grep<CR>
nnoremap <leader>. :Telescope dir live_grep<CR>
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

        "save all files on focus lost, ignoring warnings about untitled buffers
        au FocusLost * silent! wa

        " Adding automatons for when entering or leaving Vim
        au VimEnter * nested if &ft != 'gitcommit' | call LoadSession() | endif
        au VimLeave * if &ft != 'gitcommit' | call MakeSession() | endif

        au BufLeave,BufEnter * silent! call CleanNoNameEmptyBuffers()

    augroup END
endif


" ####### Plugin specific settings

" ----for javascript libraries syntax
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

" ----for polyglot
let g:polyglot_disabled = ['arduino', 'blade', 'c++11', 'clojure', 'cucumber', 'dart', 'elm', 'elixir', 'emblem', 'erlang', 'glsl', 'groovy', 'haskell', 'haxe', 'jinja', 'julia', 'kotlin', 'latex', 'liquid', 'objc', 'ocaml', 'octave', 'opencl', 'perl', 'puppet', 'qml', 'ragel', 'r-lang', 'rspec', 'ruby', 'rust', 'sbt', 'slim', 'solidity', 'swift', 'systemd', 'textile', 'thrift', 'tomdoc', 'toml', 'twig', 'vala', 'vbnet', 'vcl', 'vm', 'yard']

" ----for Nerdtree
" let g:NERDTreeMinimalUI=1
let g:NERDTreeMouseMode=3
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeIgnore=['.git$[[dir]]', '\.js.map$[[file]]']

" ----for vim-nerdtree-syntax-highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" ----for gitgutter
let g:gitgutter_max_signs = 500
let g:gitgutter_highlight_lines = 0
let g:gitgutter_enabled = 1

"for closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

"for delimitmate
let delimitMate_matchpairs = "(:),[:],{:}"
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

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
"
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

function! CleanNoNameEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
        exe 'bd '.join(buffers, ' ')
    else
        echo 'No buffer deleted'
    endif
endfunction


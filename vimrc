" ####### Plugins

" Download vim-plug if not already present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:doPlugInstall = "set"
endif

call plug#begin('~/.vim/bundle')

" core
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'princejoogie/dir-telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'arcticicestudio/nord-vim'

" file explorer
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" version control
Plug 'lewis6991/gitsigns.nvim'

" editing/navigation
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'

" language
Plug 'dense-analysis/ale'
Plug 'windwp/nvim-ts-autotag'
Plug 'NvChad/nvim-colorizer.lua'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" session
Plug 'rmagatti/auto-session'

call plug#end()

if exists('doPlugInstall')
    PlugInstall | q
endif

set termguicolors
let g:loaded_python3_provider = 0

lua << EOF
require('gitsigns').setup()
require('ts_context_commentstring').setup({ enable_autocmd = false })
require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
require('nvim-autopairs').setup()
require('nvim-ts-autotag').setup()
require('colorizer').setup()
require('nvim-tree').setup({
    view = { width = 30 },
    filters = { custom = { '.git$', '%.js.map$' } },
    renderer = { icons = { show = { git = true } } },
    actions = { open_file = { quit_on_open = true } },
})
require('auto-session').setup({
    pre_save_cmds = {"NvimTreeClose"},
})
require("telescope").load_extension("dir")
EOF


" ####### Settings

set path+=**
set ignorecase
set smartcase
set inccommand=split

set tags=./tags;/

set nowrap
set linebreak
set showbreak=↪
set sidescrolloff=10
set fillchars+=vert:│
set lazyredraw
set listchars=tab:>-,trail:·,eol:$
set number

set background=dark
syntax off
set cursorline

set hidden
set splitbelow
set splitright

set title
set mouse=a
set mousemodel=extend

set shortmess=aIt
set noshowmode
set confirm

set undodir=$HOME/.vim/tmp
set undofile
set textwidth=120
set complete=.,w,b,u,t,k
set completeopt=menuone,preview
set omnifunc=syntaxcomplete#Complete
set matchpairs+=<:>
set showmatch

set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set shiftround
set expandtab

set foldmethod=indent
set foldlevel=99

set diffopt=vertical
set clipboard=unnamedplus

set backup
set backupdir=$HOME/.vim/tmp
set autowrite
set autoread

set directory=$HOME/.vim/tmp
set updatetime=250

set wildcharm=<TAB>
set wildmode=list:longest,full
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

set fileencoding=utf-8
set gdefault

colorscheme nord
let mapleader = "\<Space>"
filetype plugin indent on

hi Normal guibg=NONE ctermbg=NONE
hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black
hi SpellBad guibg=#ff2929 guifg=#ffffff
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


" ####### Mappings

vnoremap < <gv
vnoremap > >gv

cmap w!! w !sudo tee %

inoremap <c-d> <esc>ddi
inoremap jk <esc>
inoremap kj <esc>

nnoremap <C-left> :vertical resize -2<cr>
nnoremap <C-down> :resize -2<cr>
nnoremap <C-up> :resize +2<cr>
nnoremap <C-right> :vertical resize +2<cr>

noremap <silent> k gk
noremap <silent> j gj

nnoremap <TAB> :bn<cr>
nnoremap <S-TAB> :bp<cr>

nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>

map  <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>

inoremap <c-f> <c-x><c-f>
nnoremap <Esc> :nohlsearch<CR>
nnoremap cot :call ToggleTextWidth()<cr>

nnoremap <leader>ad :%bd\|e#\|bd#<CR>
nnoremap <leader>b  :Telescope buffers<CR>
nmap     <leader>c  gcc
xmap     <leader>c  gc
nnoremap <leader>d  :bd<CR>
nnoremap <leader>f  :Telescope git_files<CR>
nnoremap <leader>gb :Gitsigns blame<CR>
nnoremap <leader>i  ggVG
nnoremap <leader>j  :ALEGoToDefinition<CR>
nnoremap <leader>m  :Telescope oldfiles<CR>
nnoremap <leader>n  :NvimTreeToggle<CR>
nnoremap <leader>p  :Telescope<CR>
nnoremap <leader>q  :qa<CR>
nnoremap <leader>r  :NvimTreeFindFile<CR>
nnoremap <leader>s  /<c-r>+
nnoremap <leader>v  :tabedit ~/dotfiles/vimrc<CR>
nnoremap <leader>w  <c-w>w
nnoremap <leader><leader> :update<CR>
nnoremap <leader>,  :Telescope live_grep<CR>
nnoremap <leader>.  :Telescope dir live_grep<CR>
nnoremap <leader>/  :%s/
nnoremap <leader>=  gg=G''


" ####### Abbreviations
cnoreabbrev W  w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev Q  q
cnoreabbrev d  bd
cnoreabbrev D  %bd


" ####### Autocommands
augroup vimrc
    au!
    autocmd FileType css,scss,less setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS

    au BufWinEnter * if line2byte(line("$") + 1) > 500000 | syntax clear | endif

    autocmd FileType NvimTree setlocal colorcolumn=""

    autocmd BufReadPost *
                \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif

    autocmd FileType html setlocal nowrap
    autocmd FileType jade setlocal nowrap
    autocmd FileType jade,markdown set textwidth=0

    au FocusLost * silent! wa
augroup END




" ####### Functions
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
        lua require('gitsigns').toggle_signs(true)
        echo "mouse-vim"
    else
        lua require('gitsigns').toggle_signs(false)
        set nonumber
        echo "mouse-xterm"
    endif
endfunction

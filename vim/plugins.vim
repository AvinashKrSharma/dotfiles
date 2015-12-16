" ----NeoBundle plugin management

" Install NeoBundle if not present
let bundleExists = 1
if (!isdirectory(expand("$HOME/.nvim/bundle/neobundle.vim")))
    echo "Installing NeoBundle Plugin Manager"
    call system(expand("mkdir -p $HOME/.nvim/bundle"))
    call system(expand("git clone https://github.com/Shougo/neobundle.vim ~/.nvim/bundle/neobundle.vim"))
    let bundleExists = 0
endif

" add neobundle to rtp
if has('vim_starting')
    set runtimepath+=~/.nvim/bundle/neobundle.vim/
endif


call neobundle#begin(expand('~/.nvim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" core plugins
" NeoBundle 'ryanoasis/nerd-fonts', {'autoload': './install.sh'}
" NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'benmills/vimux'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'szw/vim-ctrlspace'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'tpope/vim-surround'
NeoBundle 'terryma/vim-multiple-cursors'
" NeoBundle 'scrooloose/syntastic'
NeoBundle 'benekastah/neomake'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'rking/ag.vim', {'autoload': {'commands': ['Ag']}}
NeoBundle 'tomtom/tcomment_vim', {'autoload': {'commands': ['TComment']}}
NeoBundle 'sjl/gundo.vim', {'autoload': {'commands': ['GundoToggle']}}
NeoBundle 'scrooloose/nerdtree', {'autoload': {'commands': ['NERDTreeToggle', 'NERDTreeFind']}}
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'Valloric/YouCompleteMe', { 'autoload': {'build': './install.py' }}
NeoBundle 'godlygeek/tabular', {'autoload': {'commands': ['Tabularize']}}
NeoBundle 'paradigm/SkyBison'
NeoBundle 'osyo-manga/vim-over', {'autoload': {'commands': ['OverCommandLine']}}
NeoBundle 'airblade/vim-gitgutter', {'autoload': {'commands': ['GitGutterToggle']}}
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'nathanaelkane/vim-indent-guides', {'autoload': {'commands': ['IndentGuidesToggle']}}
NeoBundle 'gorkunov/smartpairs.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'Chiel92/vim-autoformat', {'autoload': {'commands': ['Autoformat']}}
NeoBundle 'sickill/vim-pasta'
NeoBundle 'vim-scripts/DirDiff.vim', {'autoload': {'commands': ['DirDiff']}}
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'xolox/vim-colorscheme-switcher'

"html related
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'mattn/emmet-vim', {'autoload': {'filetypes': ['html']}}
NeoBundle 'gregsexton/MatchTag', {'autoload': {'filetypes': ['html']}}
NeoBundle 'docunext/closetag.vim', {'autoload': {'filetypes': ['html']}}

"css related
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'vim-scripts/prefixer.vim', {'autoload': {'filetypes': ['css']}}

"js related
NeoBundle 'moll/vim-node', {'autoload': {'filetypes': ['javascript']}}
NeoBundle 'burnettk/vim-angular', {'autoload': {'filetypes': ['javascript']}}
NeoBundle 'marijnh/tern_for_vim', {'build' : {'unix' : 'npm install'}}
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'matthewsimo/angular-vim-snippets', {'autoload': {'filetypes': ['javascript']}}

call neobundle#end()

" Install Plugins
if exists('bundleExists')
    NeoBundleInstall | q
endif

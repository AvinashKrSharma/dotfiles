" ----For Plugins

" set rtp+="~/.vim/bundle"

" Turn off filetype plugins before bundles init, to make every work sane
filetype off

" Download vim-plug if already not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:doPlugInstall = "set"
endif

if empty(glob('~/.vim/autoload/plug.vim'))
    let g:doPlugInstall = "set"
endif

" ----Vim-plug plugin management
call plug#begin('~/.vim/bundle')

" core plugins
" Plug 'ryanoasis/nerd-fonts', {'do': './install.sh'}
" Plug 'ryanoasis/vim-devicons'
Plug 'benmills/vimux'
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
Plug 'osyo-manga/vim-over', {'on': 'OverCommandLine'}
Plug 'airblade/vim-gitgutter', {'on': 'GitGutterToggle'}
Plug 'christoomey/vim-tmux-navigator'
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
Plug 'docunext/closetag.vim', {'for': 'html'}
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

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
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi', {'for': 'typescript'}

call plug#end()

" Install Plugins
if exists('doPlugInstall')
    PlugInstall | q
endif

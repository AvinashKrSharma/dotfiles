" ----Vim-plug plugin management
call plug#begin('~/.vim/bundle')

" core plugins
Plug 'ryanoasis/vim-devicons'
Plug 'benmills/vimux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'szw/vim-ctrlspace'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
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
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-unimpaired'
Plug 'nathanaelkane/vim-indent-guides', {'on': 'IndentGuidesToggle'}
Plug 'gorkunov/smartpairs.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'sickill/vim-pasta'
Plug 'vim-scripts/DirDiff.vim', {'on': 'DirDiff'}
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

"css related
Plug 'gorodinskiy/vim-coloresque'
Plug 'vim-scripts/prefixer.vim', {'for': 'css'}

"js related
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'burnettk/vim-angular', {'for': 'javascript'}
Plug 'marijnh/tern_for_vim', {'build' : {'unix' : 'npm install'}}
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'matthewsimo/angular-vim-snippets', {'for': 'javascript'}

call plug#end()

" ######## Install important stuff like vim-plug, npm, jshint, csslint

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


" ######## Install jshint and csslint

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


" ######## More plugin related stuff

" ----Turn off filetype plugins before bundles init, to make every work sane
filetype off

" ----Download vim-plug if already not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:doPlugInstall = "set"
endif

" include the plugins file
source vim/plugins.vim

" ----Install Plugins
if exists('doPlugInstall') 
    PlugInstall | q
endif

" include settings for vim
source vim/settings.vim

" ######## Some more settings

" ----if You have problem with background, uncomment this line
let g:solarized_termtrans=1

" ----highlight spell errors
hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

" include mappings
source vim/mappings.vim

" include abbreviations
source vim/abbreviations.vim

" include autocommands
source vim/autocommands.vim

"include plugins-settings
source vim/plugin-settings.vim

" include functions file
source vim/functions.vim

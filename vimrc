" ----For npm

" Note: do this incase jshint/csslint installation fails because of write permissions
" sudo chown -R $(whoami) ~/.npm

" Check if npm is installed
let isNpmInstalled = executable("npm")

" If npm isn't installed, show message to install
if !isNpmInstalled
    echo "==============================================="
    echo "Your need to install npm to enable all features"
    echo "==============================================="
endif

" Set default node modules install directory
let s:defaultNodeModules = '~/.vim/node_modules/.bin/'


" ----Install jshint, tslint, csslint, lessc and node-sass for syntastic

if isNpmInstalled
    if !executable(expand(s:defaultNodeModules . 'jshint'))
        silent ! echo 'Installing jshint' && npm --prefix ~/.vim/ install jshint
    endif
    if !executable(expand(s:defaultNodeModules . 'tslint'))
        silent ! echo 'Installing tslint & typescript' && npm --prefix ~/.vim/ install tslint && npm --prefix ~/.vim/ install typescript
    endif
    if !executable(expand(s:defaultNodeModules . 'csslint'))
        silent ! echo 'Installing csslint' && npm --prefix ~/.vim/ install csslint
    endif
    if !executable(expand(s:defaultNodeModules . 'lessc'))
        silent ! echo 'Installing lessc' && npm --prefix ~/.vim/ install less
    endif
    if !executable(expand(s:defaultNodeModules . 'node-sass'))
        silent ! echo 'Installing node-sass' && npm --prefix ~/.vim/ install node-sass
    endif
endif

" ----For creating backup directory if does not exist
"
" If backup directory does not exist, then create it
silent !mkdir ~/.vim/tmp > /dev/null 2>&1


" ----For Plugins

" Turn off filetype plugins before bundles init, to make every work sane
filetype off

" Download vim-plug if already not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:doPlugInstall = "set"
endif

" include the plugins file
source ~/dotfiles/vim/plugins.vim

" Install Plugins
if exists('doPlugInstall')
    PlugInstall | q
endif

" ----Vim settings
source ~/dotfiles/vim/settings.vim

" ----Mappings
source ~/dotfiles/vim/mappings.vim

" ----Abbreviations
source ~/dotfiles/vim/abbreviations.vim

" ----Autocommands
source ~/dotfiles/vim/autocommands.vim

" ----Plugin settings
source ~/dotfiles/vim/plugin-settings.vim

" ----Custom functions
source ~/dotfiles/vim/functions.vim

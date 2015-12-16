" ----For npm

" Note: do this incase jshint/csslint installation fails because of write permissions
"  chown -R $(whoami) ~/.npm

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

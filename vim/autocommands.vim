" ######## Autocommands

if has("autocmd")
    augroup vimrc
        " Delete any previously defined autocommands
        au!
        " Enable omni completion.
        autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS

        " Auto reload vim after its changed
        au BufWritePost *.vim  source $MYVIMRC | AirlineRefresh
        au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh
        au BufWritePost vimrc  source $MYVIMRC | AirlineRefresh

        " Set filetypes aliases
        au FileType scss       set ft=scss.css
        au FileType less       set ft=less.css
        au BufRead,BufNewFile *.json set ft=json

        " disable syntax highlighting on laaarge files
        au BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif

        " Disable vertical line at max string length in NERDTree
        autocmd FileType *        setlocal colorcolumn=+1
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

        " toggle relativenumber according to mode
        autocmd InsertEnter * set relativenumber!
        autocmd InsertLeave * set relativenumber

        " set indent style for html files
        autocmd FileType html setlocal shiftwidth=2 tabstop=2

        " for airline 
        autocmd VimEnter * call AirLineInit()

        " Always on - rainbow paranthesis
        au VimEnter * RainbowParenthesesToggle
        au Syntax   * RainbowParenthesesLoadRound
        au Syntax   * RainbowParenthesesLoadSquare
        au Syntax   * RainbowParenthesesLoadBraces

        "save all files on focus lost, ignoring warnings about untitled buffers
        au FocusLost * silent! wa


    augroup END
endif

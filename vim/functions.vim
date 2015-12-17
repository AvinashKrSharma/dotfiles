" ######## All the function definitions

function! ShowMouseMode()
    if (&mouse == 'a')
        set number
        set relativenumber
        echo "mouse-vim"
    else
        set relativenumber!
        set nonumber
        echo "mouse-xterm"
    endif
endfunction

function! AirLineInit()
    let g:airline_exclude_preview = 1
    let g:airline_detect_paste=1
    let g:airline_detect_modified=1
    let g:airline_symbols.branch = '⎇ '
    let g:airline_symbols.readonly = ''
    let g:airline_left_sep=' '
    let g:airline_right_sep=' '
    let g:airline_right_sep = ' '
    let g:airline_left_sep = ' '
    let g:airline_powerline_fonts = 1
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create(['branch'])
    let g:airline_section_c = airline#section#create(['%f'])
    let g:airline_section_x = airline#section#create(['type:', 'filetype'])
    let g:airline_section_y = airline#section#create(['%c'])
    let g:airline_section_z = airline#section#create_right(['%l/%L'])
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

" shamelessly copied from mhartington's nvimrc
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" for better tab response for emmet
function! s:expand_html_tab()
    " try to determine if we're within quotes or tags.
    " if so, assume we're in an emmet fill area.
    let line = getline('.')
    if col('.') < len(line)
        let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
        if len(line) >= 2
            return "\<C-n>"
        endif
    endif
    " expand anything emmet thinks is expandable.
    if emmet#isExpandable()
        return "\<C-y>,"
    endif
    " return a regular tab character
    return "\<tab>"
endfunction

" ######## Plugin specific settings

" ----for javascript libraries syntax
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

" ----for syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_jump=1
" let g:syntastic_enable_highlighting=1
" let g:syntastic_echo_current_error=1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_quiet_messages = { "type": "style" }
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
" let g:syntastic_filetype_map = { "json": "javascript", }
" let g:syntastic_javascript_checkers = ["jshint", "jscs"]
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '!'

" ----for ctrlspace
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" ----for ycm
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" ----for polyglot
let g:polyglot_disabled = ['arduino', 'blade', 'c++11', 'clojure', 'cucumber', 'dart', 'elm', 'elixir', 'emblem', 'erlang', 'glsl', 'go', 'groovy', 'haskell', 'haxe', 'jinja', 'julia', 'kotlin', 'latex', 'liquid', 'objc', 'ocaml', 'octave', 'opencl', 'perl', 'puppet', 'qml', 'ragel', 'r-lang', 'rspec', 'ruby', 'rust', 'sbt', 'scala', 'slim', 'solidity', 'swift', 'systemd', 'textile', 'thrift', 'tomdoc', 'toml', 'twig', 'vala', 'vbnet', 'vcl', 'vm', 'yard']

" ----for airline
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long' ]
let g:airline#extensions#wordcount#enabled = 1

" ----for ag
let g:ag_working_path_mode="r"

" ----for Nerdtree
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeIgnore = ['\.js.map$']

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('less', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('scss', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')

" ----for snipmate
let g:snips_trigger_key = '<c-tab>'
let g:snips_trigger_key_backwards = '<c-s-tab>'

" ----for emmet
" Enable Emmet in all modes
let g:user_emmet_mode='a'
let g:use_emmet_complete_tag = 1
let g:user_emmet_install_global = 0

" ----for ctrlp
let g:ctrlp_use_caching = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:25'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp|log|.bower-cache|.bower-registry|.bower-tmp)|(\.(swp|ico|png|jpg|git|svn))$'
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif

" ----for gitgutter
let g:gitgutter_max_signs = 200
let g:gitgutter_highlight_lines = 1
let g:gitgutter_enabled = 1

" ----for indentguides
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

" ----for delimitmate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let loaded_delimitMate = 1

" ----for yankring
let g:yankring_window_use_right = 0
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''

" for vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-Left> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>

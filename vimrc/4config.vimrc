" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" start with relative number
call NumberToggle()

"syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" set ycm configuration
" let g:ycm_global_ycm_extra_conf='/home/voodoo/.vim/bin/ycm_extra_conf.py'

" ending space
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" c-support home
let g:C_CustomTemplateFile = '/home/dante/.vim/templates/Templates'

" ctrlp
" set key
let g:ctrlp_map = '<c-i>'
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Start with TagMode
" let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_cmd = 'CtrlP'

set hls

""" vim wiki
let g:vimwiki_folding = 'list'

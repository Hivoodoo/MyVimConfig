" line number style
autocmd InsertEnter * call NumberSwitch()
autocmd InsertLeave * call NumberSwitch()

" set indent
autocmd BufNewFile,BufRead * call SetIndent()

" set focus
call SetFocus()
let g:ctrlp_buffer_func = { 'enter': 'SetNoFocus', 'exit':  'SetFocus'}

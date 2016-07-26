" line number style
autocmd InsertEnter * call NumberSwitch()
autocmd InsertLeave * call NumberSwitch()

" set indent
autocmd BufNewFile,BufRead * call SetIndent()

" set focus
autocmd! CursorMoved * normal zz

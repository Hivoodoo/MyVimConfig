" Switch style of line number
function! NumberSwitch()
    if(&number || &relativenumber)
        if(&relativenumber)
            set norelativenumber
        else
            set relativenumber 
        endif
    endif
endfunc

" Toggle of line number
function! NumberToggle()
    if(&number || &relativenumber)
        set nonumber norelativenumber
    else
        set number relativenumber
    endif
endfunc

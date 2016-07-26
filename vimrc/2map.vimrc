" line number
nnoremap <C-L> :call NumberToggle()<CR>
" make C-C can triger InsertLeave
inoremap <C-C> <Esc> 

nmap <F8> :TagbarToggle<CR>

map <F12> :NERDTreeToggle<CR>

" something for buffer
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bl<CR>
nnoremap <C-K> :call SwitchBuffer()<CR>

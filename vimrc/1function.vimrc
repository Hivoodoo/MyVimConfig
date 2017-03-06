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

" Google style
function! GoogleCppIndent()
  let l:cline_num = line('.')

  let l:orig_indent = cindent(l:cline_num)

  if l:orig_indent == 0 | return 0 | endif

  let l:pline_num = prevnonblank(l:cline_num - 1)
  let l:pline = getline(l:pline_num)
  if l:pline =~# '^\s*template' | return l:pline_indent | endif

  " TODO: I don't know to correct it:
  " namespace test {
  " void
  " ....<-- invalid cindent pos
  "
  " void test() {
  " }
  "
  " void
  " <-- cindent pos
  if l:orig_indent != &shiftwidth | return l:orig_indent | endif

  let l:in_comment = 0
  let l:pline_num = prevnonblank(l:cline_num - 1)
  while l:pline_num > -1
    let l:pline = getline(l:pline_num)
    let l:pline_indent = indent(l:pline_num)

    if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
      let l:in_comment = 1
    elseif l:in_comment == 1
      if l:pline =~ '/\*\(.\{-}\*/\)\@!'
        let l:in_comment = 0
      endif
    elseif l:pline_indent == 0
      if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
        if l:pline =~# '^\s*namespace.*'
          return 0
        else
          return l:orig_indent
        endif
      elseif l:pline =~# '\\$'
        return l:orig_indent
      endif
    else
      return l:orig_indent
    endif

    let l:pline_num = prevnonblank(l:pline_num - 1)
  endwhile

  return l:orig_indent
endfunction

" set indent
function! SetIndent()
  if &filetype!="make"
    set shiftwidth=2
    set tabstop=2
    set softtabstop=2
    set expandtab
    set textwidth=80
    set wrap
    
    set cindent
    set cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4
    
    set indentexpr=GoogleCppIndent()
    
    let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"
  endif
endfunction

function! SwitchBuffer()
  buffers!
  let num = input("swtich to(empty to cancle):")
  if(num =~ '\D')
    return
  endif
  execute ":buffer ". num
endfunction

function! SetNoFocus()
    autocmd! CursorMoved *
endfunction

function! SetFocus()
    autocmd CursorMoved * normal zz
endfunction

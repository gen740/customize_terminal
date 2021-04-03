if exists("g:my_custom_plugin")
  finish
endif
let g:my_custom_plugin = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:clang_format()      " clang-format　をしてくれる関数
  let l:save = winsaveview()
  :silent %! clang-format -style=file
  call winrestview(l:save)
  call s:trimUseless()
  :w
endfunction

function! s:rust_format()      " rust-format　をしてくれる関数
  let l:save = winsaveview()
  :silent ! rustfmt %
  :silent edit
  call winrestview(l:save)
  call s:trimUseless()
  :w
endfunction

function! s:autopep8_format()      " pep-format　をしてくれる関数
  let l:save = winsaveview()
  :silent %!autopep8 --aggressive -
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
  :w
endfunction

fun! s:trimUseless()
  let l:save = winsaveview()
  keeppatterns %s/\n\+$/\r/ge
  call winrestview(l:save)
endfun

command! SetWin call custom#SetWindows()
command! CFamilyFMT call s:clang_format()
command! RustFMT call s:rust_format()
command! PEPFMT call s:autopep8_format()
command! TrimUselesses call s:trimUseless()

let &cpo = s:save_cpo
unlet s:save_cpo

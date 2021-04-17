if exists("g:my_custom_plugin")
  finish
endif
let g:my_custom_plugin = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:change_ime()
  :silent !osascript "/Users/fujimotogen/.vim/custom_runtime/external/ime.scpt"
endfunction

function! s:clang_format()
  let l:save = winsaveview()
  call s:trimUseless()
  :silent %! clang-format -style=file
  call winrestview(l:save)
  :w
endfunction

function! s:rust_format()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  :silent ! rustfmt %
  :silent edit
  call winrestview(l:save)
  :w
endfunction

function! s:autopep8_format()
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

command! CFamilyFMT call s:clang_format()
command! ChangeIME call s:change_ime()
command! PEPFMT call s:autopep8_format()
command! RustFMT call s:rust_format()
command! SetWin call custom#SetWindows()
command! SetWinWithoutMinimap call custom#SetWindows_without_minimap()
command! TrimUselesses call s:trimUseless()

let &cpo = s:save_cpo
unlet s:save_cpo

if exists("g:my_custom_plugin")
  finish
endif
let g:my_custom_plugin = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:change_ime()
  let OSTYPE = system('uname')
  :echo OSTYPE
  if OSTYPE == "Darwin\n"
    " Mac OSの時はapple scriptを通じて英数キーを送る
    :silent !osascript -e 'tell application "System Events"' -e 'key code 102' -e 'end tell'
  endif
endfunction

function! s:clang_format()
  let l:save = winsaveview()
  call s:trimUseless()
  " ローカルのclang-formatに設定を合わせる。
  :silent %! clang-format -style=file 
  call winrestview(l:save)
  :silent w
endfunction

function! s:rust_format()
  let l:save = winsaveview()
  call s:trimUseless()
  :silent ! rustfmt %
  :silent edit
  call winrestview(l:save)
  :silent w
endfunction

function! s:autopep8_format()
  let l:save = winsaveview()
  :silent %!autopep8 --aggressive -
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
  :silent w
endfunction

fun! s:trimUseless()
  let l:save = winsaveview()
  keeppatterns %s/\n\+$/\r/ge
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
  :silent w
endfun

command! Atcoder call custom#Atcoder()
command! AtcoderEmpty call custom#AtcoderEmpty()
command! CFamilyFMT call s:clang_format()
command! ChangeIME call s:change_ime()
command! PEPFMT call s:autopep8_format()
command! RustFMT call s:rust_format()
command! SetWin call custom#SetWindows()
command! SetWinWithoutMinimap call custom#SetWindows_without_minimap()
command! TrimUselesses call s:trimUseless()
command! VimShowHlGroup echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

let &cpo = s:save_cpo
unlet s:save_cpo


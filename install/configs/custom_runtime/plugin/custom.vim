if exists("g:my_custom_plugin")
  finish
endif

let g:my_custom_plugin = 1
let s:save_cpo = &cpo
set cpo&vim

let g:custom_build_conf_sh=findfile(".custom_build_config.sh", ".;" )
let g:custom_run_conf_sh=findfile(".custom_run_config.sh", ".;" )

if g:custom_build_conf_sh != ""
  command! Build call custom#Build()
endif

if g:custom_run_conf_sh != ""
  command! Run call custom#Run()
endif

function! s:clang_format()      " clang-format　をしてくれる関数
  let now_line = line(".")
  :silent %! clang-format -style=file
  exec ":" . now_line
endfunction

function! s:rust_format()      " rust-format　をしてくれる関数
  let now_line = line(".")
  :silent ! rustfmt %
  :edit
  exec ":" . now_line
endfunction

function! s:autopep8_format()      " clang-format　をしてくれる関数
  let now_line = line(".")
  :silent %!autopep8 --aggressive -
  exec ":" . now_line
endfunction

function! s:change_ime()      " clang-format　をしてくれる関数
  :silent !osascript "/Users/fujimotogen/.vim/custom_runtime/external/ime.scpt"
endfunction

if executable('clang-format')
  augroup cpp_clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
  augroup END
endif

if executable('clang-format')
  augroup clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch] call s:clang_format()
  augroup END
endif

if executable('rustfmt')
  augroup clang_format
    autocmd!
    autocmd BufWritePost,FileWritePost,FileAppendPost *.rs call s:rust_format()
  augroup END
endif

if executable('autopep8')
  augroup autopep8_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.py call s:autopep8_format()
  augroup END
endif

command! RunWithOutput call custom#RunWithOutput()
command! RunKp call custom#Run_Kp()
command! CmakeRun call custom#CmakeRun()
command! SetWin call custom#SetWindows()
command! ExecutePython call custom#ExecutePython()
command! ExecuteRust call custom#ExecuteRust()
command! ChangeIME call s:change_ime()

let &cpo = s:save_cpo
unlet s:save_cpo

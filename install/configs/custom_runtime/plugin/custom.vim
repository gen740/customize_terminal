if exists("g:my_custom_plugin")
  finish
endif

let g:my_custom_plugin = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:clang_format()      " clang-format　をしてくれる関数
  let now_line = line(".")
  :silent %! clang-format -style=file
  exec ":" . now_line
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

command! Build call custom#Build()
command! Run call custom#Run()
command! RunWithOutput call custom#RunWithOutput()
command! RunKp call custom#Run_Kp()
command! CmakeRun call custom#CmakeRun()
command! SetWin call custom#SetWindows()
command! Terminal call popup_create(term_start([&shell],
      \ #{ hidden: 1, term_finish: 'close'}),
      \ #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })

let &cpo = s:save_cpo
unlet s:save_cpo

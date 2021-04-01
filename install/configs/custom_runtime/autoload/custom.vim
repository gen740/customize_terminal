function! OpenExecuteWindow(name)
  silent execute "update | edit"
  " get file path of current file
  let s:output_buffer_name = a:name
  let s:output_buffer_filetype = "output"
  " reuse existing buffer window if it exists otherwise create a new one
  if !exists("s:buf_nr") || !bufexists(s:buf_nr)
    silent execute 'botright new ' . s:output_buffer_name
    let s:buf_nr = bufnr('%')
  elseif bufwinnr(s:buf_nr) == -1
    silent execute 'sp new'
    silent execute s:buf_nr . 'buffer'
  elseif bufwinnr(s:buf_nr) != bufwinnr('%')
    silent execute bufwinnr(s:buf_nr) . 'wincmd w'
  endif
  silent execute "setlocal filetype=" . s:output_buffer_filetype
  silent execute "resize 12"
  setlocal bufhidden=delete
  setlocal buftype=nofile
  setlocal noswapfile
  setlocal nobuflisted
  setlocal winfixheight
  setlocal cursorline " make it easy to distinguish
  setlocal nonumber
  setlocal norelativenumber
  setlocal showbreak=""
  " clear the buffer
  setlocal noreadonly
  setlocal modifiable
  %delete _
endfunction

function custom#SetWindows()
  let s:cur_win_id = win_getid()
  :Tagbar
  :NERDTreeToggle
  call win_gotoid(s:cur_win_id)
  :sp
  :term
  call win_gotoid(s:cur_win_id)
  :resize 44
endfunction

function custom#rerunPreviousCommands()
endfunction

fun! custom#Term(...) abort
  let l:currmax=0
  let l:currwinnr=win_getid()
  for l:bn in range(1,bufnr('$'))
    let l:currbufname = bufname(l:bn)
    let l:currshellnr = str2nr(bufname(l:bn)[10:-1])
    if bufloaded(l:bn) && l:currbufname =~# "term:shell.*" && l:currshellnr != 0
      if l:currshellnr > l:currmax
        let l:currmax = l:currshellnr
      endif
    endif
  endfor
  " decide the terminal buffer's l:name
  " if user provided an argument and it is not an empty string, use it
  " if there was a terminal opened/closed before this, use its name
  " else default to term:shell
  let l:name =
        \(a:0 > 0 && a:1 != "")   ? "term:" . a:1  :
        \exists("w:lasttermname") ? w:lasttermname :
        \"term:shell".(l:currmax+1)
  if bufwinnr(l:name) > 0
    " if the terminal is open in a window, close it
    execute bufwinnr(l:name) . "wincmd c"
  elseif bufname('%') =~# "term:.*"
    execute bufwinnr(bufname('%')) . "wincmd c"
  else
    " else open a new split
    execute float2nr((winheight(0)*0.37)) . "split"
    if bufexists(l:name)
      " if the terminal buffer already exists, switch to it
      execute "buffer " . l:name
    else
      " else open a new terminal buffer and rename it to l:name
      execute has('nvim') ? "terminal" : "terminal ++curwin"
      execute "file " . l:name
    endif
    " set this terminal buffer's name as the last interacted terminal buffer
    call setwinvar(l:currwinnr, 'lasttermname', l:name)
  endif
endfun

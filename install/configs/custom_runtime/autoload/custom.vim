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

function custom#SetWindows_without_minimap()
  let s:cur_win_id = win_getid()
  let g:cur_win_height = winheight(0)
  let g:cur_win_width = winwidth(0)
  :Tagbar
  silent execute 'vertical resize' . g:cur_win_width * 6 / 7
  :NERDTreeToggle
  silent execute 'vertical resize' . g:cur_win_width / 7
  call win_gotoid(s:cur_win_id)
  :sp
  :term
  call win_gotoid(s:cur_win_id)
  silent execute 'resize' . g:cur_win_height*3/4
endfunction

function custom#SetWindows()
  let s:cur_win_id = win_getid()
  let g:cur_win_height = winheight(0)
  let g:cur_win_width = winwidth(0)
  :Tagbar
  silent execute 'vertical resize' . g:cur_win_width * 6 / 7
  :NERDTreeToggle
  silent execute 'vertical resize' . g:cur_win_width / 7
  call win_gotoid(s:cur_win_id)
  :sp
  :term
  call win_gotoid(s:cur_win_id)
  :Minimap
  silent execute 'resize' . g:cur_win_height*3/4
endfunction


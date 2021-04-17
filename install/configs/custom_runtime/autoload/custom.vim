function custom#SetWindows_without_minimap()
  let s:cur_win_id = win_getid()
  let g:cur_win_height = winheight(0)
  let g:cur_win_width = winwidth(0)
  :Tagbar
  silent execute 'vertical resize' . g:cur_win_width * 4 / 5
  :NERDTreeToggle
  silent execute 'vertical resize' . g:cur_win_width / 5
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
  silent execute 'vertical resize' . g:cur_win_width * 4 / 5
  :NERDTreeToggle
  silent execute 'vertical resize' . g:cur_win_width / 5
  call win_gotoid(s:cur_win_id)
  :sp
  :term
  call win_gotoid(s:cur_win_id)
  :Minimap
  silent execute 'resize' . g:cur_win_height*3/4
endfunction


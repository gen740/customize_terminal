function custom#SetWindows()
  :NERDTreeToggle
  execute "normal! \<c-w>\<c-w>"
  :Tagbar
  :sp
  :term
  execute "normal! \<c-w>13\-\<c-w>\k"
endfunction

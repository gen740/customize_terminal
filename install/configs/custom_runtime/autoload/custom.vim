function custom#SetWindows()
  :Tagbar
  execute "normal! \<c-w>\l"
  :vertical resize 25
  execute "normal! \<c-w>\h"
  :NERDTreeToggle
  execute "normal! \<c-w>\<c-w>"
  :sp
  :term
  execute "normal! \<c-w>\k"
  :resize 41
  :vertical resize 106
endfunction

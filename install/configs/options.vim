" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                         « Python Configurations »                                 │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" let g:python_host_prog='~/.pyenv/versions/neovim-2/bin/python'
let g:python3_host_prog='~/.pyenv/versions/neovim/bin/python' 
" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                              « Vim Options »                                      │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
colo gruvbox
packadd! matchit                                " if endifみたいなのも括弧ジャンプができるようになる
let &colorcolumn="100" " .join(range(120,121),",") " 101列目に線を入れる
set conceallevel=1
set runtimepath+=~/.vim/custom_runtime
set autoread                                    " 編集中に別のところで編集されたら自動で読み込みます。
set autowrite                                   " normalモードに行くと勝手に保存してくれる
set backupext=.bak                              " バックアップファイルの拡張子
set clipboard=unnamed
set completeopt-=preview                        " プレビューウインドウを表示しない
set cursorline                                  " 今いる行をハイライト
set display=lastline                            " 最後の行をできるだけ表示する
set exrc
set guicursor=
set foldexpr=nvim_treesitter#foldexpr()
set foldmethod=expr
set hidden                                      " 保存しなくてもバッファの切り替えができる
set ignorecase                                  " 大文字小文字を区別せずに検索してくれます。
set incsearch                                   " 文字検索時にリアルタイムで検索してくれます。
set iskeyword+=:                                " :をキーワードにする
set lazyredraw                                  " 出来るだけ再描画をしない
set list                                        " 不可視文字の表示
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set matchtime=5                                 " showmatchまでの時間
set mouse+=a                                    " マウスでカーソルの位置を指定できる
set modelines=10                                " modeline
set nobackup
set foldenable                                " 自動的に折り畳みをしない
set foldlevel=0
set nohlsearch                                  " 検索した文字がハイライトされます。
set noswapfile                                  " swapファイルは使いません
set nowritebackup  
set nu relativenumber                           " 番号を相対表示にする
set path+=**                                    " Vimのパスに親のパスを追加
set pumheight=12                                " 補完ウインドウの行数を決める
set scrolloff=8                                 " 余白を取るようになる
set shortmess+=c
set showcmd                                     " 入力中のコマンドを表示します。右下に表示されます。
set showmatch                                   " 対応する括弧を強調表示する
set signcolumn=yes                              " サイドにマーカー用の行を作成
set smartcase                                   " 大文字を入力したときにだけ大文字小文字を区別します
set splitbelow                                  " splitすると下に分かれる
set splitright                                  " splitすると右に分かれる
set tags=.tags;~                                " ctagsを遡って検索
set termguicolors                               " 色をバグらないようにする
set updatetime=300
set shada='1000,f1,<500,:500,@500,/500        " viminfoに蓄える内容とその量を決める
set whichwrap=b,s,<,>,[,]                       " 行末、行頭で行を跨ぐことができるようになります。
set wildmenu wildmode=longest,full              " 補完の形を決める（vim互換性）
if has('persistent_undo')                       " undoファイルをずっと残す
  set undodir=~/.vim/undo
  set undofile
endif
" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                              « Abbreviations »                                    │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
iabbrev #b /**************************************************
iabbrev #e <Space>**************************************************/
"}}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                              « AutoCommands »                                     │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
autocmd BufEnter,FocusGained,InsertLeave * set cursorline
autocmd BufLeave,FocusLost,InsertEnter   * set nocursorline
autocmd ColorScheme * highlight Normal guibg=none
autocmd ColorScheme * highlight SignColumn guibg=none
autocmd ColorScheme * highlight EndOfBuffer guifg=#222222
autocmd BufRead,BufNewFile *.[ch] nmap <silent><buffer> <Leader>f :silent CFamilyFMT<CR>
autocmd BufRead,BufNewFile *.[chi]pp nmap <buffer> <Leader>f :silent CFamilyFMT<CR>
" autocmd FileType python nmap <buffer> <Leader>f :silen PEPFMT<CR>
autocmd BufRead,BufNewFile *.rlib nmap <buffer> <Leader>f :silent RustFMT<CR>
autocmd BufRead,BufNewFile *.rs nmap <buffer> <Leader>f :silent RustFMT<CR>
autocmd BufRead,BufNewFile *.tex nmap <Leader>r <Leader>ll<Leader>lv
autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
autocmd BufRead,BufNewFile *.wiki setlocal filetype=tex
autocmd BufRead,BufNewFile *.tex nnoremap <C-q> <Plug>Tex_FastEnvironmentInsert
autocmd BufRead,BufNewFile *.tex vnoremap <C-q> <Plug>Tex_FastEnvironmentInsert
autocmd TermOpen * setlocal nonumber norelativenumber
" autocmd BufRead,BufNewFile *.cpp syntax match Entity "main" conceal cchar=
" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                         « Indent Configurations »                                 │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
set autoindent                  " 改行したりした時にインデントを保持してくれます。
set expandtab                   " タブを押すと空白が挿入されるようにする
set nowrap                      " 折り返しをしない
set shiftwidth=2                " vimのインデントでいくつ空白を挿入するか
set softtabstop=2               " tabを押した時に空白何個分のインデントをとるか。
set tabstop=2                   " 一個のタブを空白何個分にとるか。
augroup fileTypeIndent
  autocmd!
  autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
  autocmd FileType markdown setlocal filetype=markdown
  autocmd FileType markdown nnoremap o A<CR>
  autocmd FileType qf setlocal wrap
  autocmd FileType text setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
  autocmd FileType rust let g:rust_recommended_style = 1
  autocmd FileType rust let g:rustfmt_autosave = 1
  autocmd FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END  " }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                               « Treesitter »                                      │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true              -- false will disable the whole extension
  },
  indent = {
    enable = false,              -- false will disable the whole extension
  -- disable = { "c", "cpp", "python"},
  },
  incremental_selection = {
    enable = true              -- false will disable the whole extension
  },
  textobjects = {
    select = {
    enable = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      -- Or you can define your own textobjects like this
      ["iF"] = {
        python = "(function_definition) @function",
        cpp = "(function_definition) @function",
        c = "(function_definition) @function",
        java = "(method_declaration) @function",
        },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>sp"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>sP"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  refactor = {
    -- highlight_definitions = { enable = true },
    -- highlight_current_scope = { enable = true },
    -- smart_rename = {
     -- enable = false,
     -- keymaps = {
       -- smart_rename = "grr",
     -- },
   -- },
  },
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd FileType vim setlocal foldmethod=marker 

" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                        « Folding Configurations »                                 │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
if has("folding")
  set foldtext=MyFoldText()
  function! MyFoldText()
    " for now, just don't try if version isn't 7 or higher
    if v:version < 701
      return foldtext()
    endif
    " clear fold from fillchars to set it up the way we want later
    let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
    let l:numwidth = (v:version < 701 ? 8 : &numberwidth)
    if &fdm=='diff'
      let l:linetext=''
      let l:foldtext='---------- '.(v:foldend-v:foldstart+1).' lines the same ----------'
      let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strwidth(line('$'))+1, l:numwidth) : 0)
      let l:align = (l:align / 2) + (strwidth(l:foldtext)/2)
      " note trailing space on next line
      setlocal fillchars+=fold:\ 
    elseif !exists('b:foldpat') || b:foldpat==0
      let l:foldtext = '┈ '.(v:foldend-v:foldstart).' ﲐ'.' ┠'
      let l:endofline = 106 " (&textwidth>0 ? &textwidth : 100 + 6)
      let l:linetext = strpart(getline(v:foldstart),0,l:endofline-strwidth(l:foldtext))
      let l:align = l:endofline-strwidth(l:linetext)
      setlocal fillchars+=fold:─ " 空白
    elseif b:foldpat==1
      let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strwidth(line('$'))+1, l:numwidth) : 0)
      let l:foldtext = ' '.v:folddashes
      let l:linetext = substitute(getline(v:foldstart),'\s\+$','','')
      let l:linetext .= '▤ × '.(v:foldend-v:foldstart-1).' lines--- '
      let l:linetext .= substitute(getline(v:foldend),'^\s\+','','')
      let l:linetext = strpart(l:linetext,0,l:align-strwidth(l:foldtext))
      let l:align -= strwidth(l:linetext)
      setlocal fillchars+=fold:-
    endif
    return printf('%s%*s', l:linetext, l:align, l:foldtext)
  endfunction
endif

set viewoptions-=options

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.+ silent! loadview
augroup END
autocmd BufRead,BufNewFile * hi Folded guifg=#928374 guibg=none gui=undercurl " }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                                 « Others »                                        │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
set runtimepath+=~/.vim/JpFormat.vim
set formatexpr=jpfmt#formatexpr()
set formatexpr=jpvim#formatexpr()
let g:jpvim_remove_youon = 1 " }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼

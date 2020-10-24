"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')
    call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    let g:config_dir  = expand('~/.vim/dein')
    let s:toml_file   = g:config_dir . '/plugins.toml'
    call dein#load_toml(s:toml_file)  " TOML を読み込み、キャッシュしておく
    call dein#end()
    call dein#save_state()
endif
filetype plugin indent on
if dein#check_install()
    call dein#install()
endif
"　必要なときにコメントアウトを戻してpluginを削除してください。
" call map(dein#check_clean(), "delete(v:val, 'rf')")
" call dein#recache_runtimepath()
"End dein Scripts-------------------------

"シンタックスハイライトを有効
"###############################################################################
syntax enable
set syntax=markdown
colorscheme mountaineer

"インデント関係
"###############################################################################
set expandtab                   " タブを押すと空白が挿入されるようにする
set tabstop=4                   " 一個のタブを空白何個分にとるか。
set shiftwidth=4                " vimのインデントでいくつ空白を挿入するか
set softtabstop=4               " tabを押した時に空白何個分のインデントをとるか。
set autoindent                  " 改行したりした時にインデントを保持してくれます。

" Airline用
set statusline=2                " ステータスラインの記述
set laststatus=2                " 下のステータスライン
set noshowmode                  " デフォルトのステータスラインを消す

"検索関係
"###############################################################################
set incsearch                   " 文字検索時にリアルタイムで検索してくれます。
set smartcase                   " 大文字小文字を区別せずに検索してくれます。
set hlsearch                    " 検索した文字がハイライトされます。

"その他
"###############################################################################
set autoread                    " 編集中に別のところで編集されたら自動で読み込みます。
set showcmd                     " 入力中のコマンドを表示します。右下に表示されます。
set whichwrap=b,s,h,l,<,>,[,]   " 行末、行頭で行を跨ぐことができるようになります。
set colorcolumn=81              " 81文字目にラインが入ります。
let &colorcolumn="81,"  ".join(range(121,999),",")
set noswapfile                  " swapファイルは使いません
set mouse+=a                    " マウスでカーソルの位置を指定できる
set cursorline                  " 今いる行をハイライト
set vb t_vb=                    " ベルをオフにするこれを使用すると、いちいちビープ音が鳴らない
set title                       " タイトルにパスを表示する
set number                      " 行頭に数字を表示する
set clipboard+=unnamed          " クリップボードにコピーできるようにする
set backspace=indent,eol,start  " deleteキーの有効化
    
let var = expand('%:e')
if var == "html"                " htmlではタブを2個に
    retab 2
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
endif

"Functions
"###############################################################################
function! s:clang_format()      " clang-format　をしてくれる関数
    let now_line = line(".")
    :%! clang-format -style=file
    exec ":" . now_line
endfunction

function! s:prettier_format()   "prettier-format　をしてくれる関数
    let now_line = line(".")
    :silent! w
    :%! prettier %
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

if executable('prettier') 
    augroup prettier_format
        autocmd!
        autocmd BufWrite,FileWritePre,FileAppendPre *.html call s:prettier_format()
        autocmd BufWrite,FileWritePre,FileAppendPre *.css call s:prettier_format()
        autocmd BufWrite,FileWritePre,FileAppendPre *.js call s:prettier_format()
    augroup END
endif

function! Run() "
    let var = expand('%:e') 
    if var == "cpp"
        :w
        :!g++-10 % -o %:r.out -lstdc++fs -std=c++17
        :!./%:r.out
    elseif var == "c"
        :w
        :!gcc-10 % -o %:r.out
        :!./%:r.out
    elseif var == "py"
        :w
        :!python3 %
        :!echo "End"
    elseif var == "sh"
        :w
        :!bash %
        :!echo "End"
    else
        :w
        exec ":!echo cannot Run this file" 
    endif
endfunction

function! Run_Kp()          " 競技プログラミング用の実行環境。
    let var = expand('%:e') 
    if var == "cpp"
       :w
       :!g++-9 % -o %:r.out -lstdc++fs -std=c++17
       :!./%:r.out < Normal_input
    endif
endfunction

function! CmakeRun()
    :w
    :!cd build; cmake ..; make ;./main
    :!echo "END"
endfunction

"ここ以降はコマンドを規定
"###############################################################################
command! Run call Run()
command! RunKp call Run_Kp()
command! CmakeRun call CmakeRun()

"キーマップを規定
"###############################################################################
noremap <F2> :Run<CR>
noremap <F3> :CmakeRun<CR>
noremap <F4> :RunKp<CR>

"プラグインの設定
"###############################################################################
set splitbelow
set completeopt-=preview " プレビューウインドウを表示しない

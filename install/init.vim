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
    let s:lazy_toml_file   = g:config_dir . '/lazy_plugins.toml'
    call dein#load_toml(s:toml_file, {'lazy': 0})  " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:lazy_toml_file, {'lazy': 1})  " TOML を読み込み、キャッシュしておく
    call dein#end()
    call dein#save_state()
endif
filetype plugin indent on
if dein#check_install()
    call dein#install()
endif
"　必要なときにコメントアウトを戻してpluginを削除してください。
"    call map(dein#check_clean(), "delete(v:val, 'rf')")
"    call dein#recache_runtimepath()
"End dein Scripts-------------------------
set runtimepath+=~/.vim/custom_runtime

"シンタックスハイライトを有効
"###############################################################################
syntax enable
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown
colo my-scheme

"インデント関係
"###############################################################################
set expandtab                   " タブを押すと空白が挿入されるようにする
set tabstop=2                   " 一個のタブを空白何個分にとるか。
set shiftwidth=2                " vimのインデントでいくつ空白を挿入するか
set softtabstop=2               " tabを押した時に空白何個分のインデントをとるか。
set autoindent                  " 改行したりした時にインデントを保持してくれます。

" Airline用
"検索関係
"###############################################################################
set incsearch                   " 文字検索時にリアルタイムで検索してくれます。
set smartcase                   " 大文字小文字を区別せずに検索してくれます。
set hlsearch                    " 検索した文字がハイライトされます。

"その他
"###############################################################################
filetype plugin indent on
set autoread                    " 編集中に別のところで編集されたら自動で読み込みます。
set showcmd                     " 入力中のコマンドを表示します。右下に表示されます。
set whichwrap=b,s,h,l,<,>,[,]   " 行末、行頭で行を跨ぐことができるようになります。
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="81,".join(range(100,999),",")
set noswapfile                  " swapファイルは使いません
set mouse+=a                    " マウスでカーソルの位置を指定できる
set cursorline                  " 今いる行をハイライト
set vb t_vb=                    " ベルをオフにするこれを使用すると、いちいちビープ音が鳴らない
set title                       " タイトルにパスを表示する
set number                      " 行頭に数字を表示する
set relativenumber
set clipboard+=unnamed          " クリップボードにコピーできるようにする
set backspace=indent,eol,start  " deleteキーの有効化

"Functions
"###############################################################################
tnoremap <Esc> <C-\><C-n>
tnoremap <C-]> <C-\><C-n>
let mapleader = "\<Space>"
nnoremap <Leader>s :SourcetrailActivateToken <CR>
nmap j gj
nmap k gk

"プラグインの設定
"###############################################################################
set splitbelow
set completeopt-=preview " プレビューウインドウを表示しない

set foldmethod=marker
au FileType cpp setlocal foldmarker={,}
au FileType c setlocal foldmarker={,}
au FileType cpp setlocal foldmarker={,}
set nofoldenable

function! s:arrangeCSV() abort
  :%UnArrangeColumn
  :%ArrangeColumn
endfunction

autocmd BufWrite,FileWritePre,FileAppendPre *.csv call s:arrangeCSV()
autocmd FileType tex let g:indentLine_enabled=0
autocmd FileType tex let g:Imap_UsePlaceHolders=0
set updatetime=3000
let g:markdown_minlines = 100
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'cpp']
let g:ycm_auto_hover='CursorHold'



"######################
"###### 表示設定#######
"######################
set number  "行番号 
set title   
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set list
set nrformats-=octal
set hidden
set history=100
set virtualedit=block
set whichwrap=b,s,[,],<,>   "カーソルのまわりこみ
set backspace=indent,eol,start
set wildmenu
colorscheme desert
set laststatus=2
set ruler
set showcmd"コマンド表示


"###################
"カーソル設定
"###################
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"


"## 検索設定 ##"
set ignorecase "大小区別なく検索



"###################
" % 拡張プラグイン
"###################
runtime macros/matichit.vim



"################################
"  key mapping without plugin
"  プラグイン以外のキーマッピング
"################################

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> B] :blast<CR>





"""""""""""""""""""""""""""""
"mode change color statusline
"""""""""""""""""""""""""""""
let g:hi_insert='highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
    augroup InsertHook
        autocmd!
        autocmd InsertEnter * call s:StatusLine('Enter')
        autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
    if a:mode == 'Enter'
        silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
    else
        highlight clear StatusLine
        silent exec s:slhlcmd
    endif
endfunction

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx' ,'', '')
    return hl
endfunction



"#########################
"カーソル復元
"#########################
if has("autocmd")
    autocmd BufReadPost *
                \if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \endif
endif 




if 0 | endif
filetype off

if has('vim_starting')
    if &compatible
        set nocompatible
    endif
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein/'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
"以降プラグインを記入


" "unite.vim
" call dein#add( 'Shougo/unite.vim')
" call dein#add( 'Shougo/neomru.vim' )
"
" "############################
" "    Setting unit.vim
" "    <C-p>  バッファ一覧
" "    <C-n>  カレントディレクトリ以下のファイル一覧
" "    <C-z>  最近使ったファイルの一覧
" "
" "############################
" "入力モードで開始
" let g:unite_enable_start_insert=1
"
" "Buffer
" noremap <C-P> :Unite buffer<CR>
"
" "file list
" noremap <C-N> :Unite -buffer-name=file file<CR>
"
" "recently file
" noremap <C-Z> :Unite file_mru<CR>
"
" "sourcesを今開いているファイルのディレクトリにする
" noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
"
" "open to split windows
" au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"
" "open to vsplit windows
" au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"
" "Esc*2 is end
" au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
" au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"
" "#############################
"setting unite.vim(cannot use dein 07/23)
"


"NERDTree
call dein#add( 'scrooloose/nerdtree')
nnoremap :ntree :NERDTree

"syntastic
call dein#add( 'scrooloose/syntastic')

"autoclose かっこ
call dein#add( 'Townk/vim-autoclose')

"Emmet html
call dein#add( 'mattn/emmet-vim')

"quickrun
call dein#add( 'thinca/vim-quickrun')

"snippet コード補完
call dein#add( 'Shougo/neosnippet.vim')

"snippet 辞書
call dein#add( 'Shougo/neosnippet-snippets')

"javascript syntax
call dein#add( 'jelera/vim-javascript-syntax')

"ruby auto-end
call dein#add( 'tpope/vim-endwise')

"comment <C-(-)> 一括コメント化
call dein#add( 'tomtom/tcomment_vim')

"ruby コード補完
"call dein#add( 'Shougo/neocomplete.vim')
"call dein#add( 'marcus/rsence')
"call dein#add( 'supermomonga/neocomplete-rsence.vim')

"ruby ref-document
"call dein#add( 'thinca/vim-ref')
"call dein#add( 'yuka-t/vim-ref-ri')

"jump to method
call dein#add( 'szw/vim-tags')

"#######################
"Surround.vim
"S{デリミタ指定}
"デリミタで指定したものを囲む
"#######################

call dein#add('tpope/vim-surround')






"プラグイン記入終了
call dein#end()
filetype plugin indent on

"ネットワークエラー時にコメントアウト
"自動更新
" if dein#end()
"     call dein#install()
" endif



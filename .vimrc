
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

"-auto close and indent but so srow-
" inoremap { {}<LEFT>
" inoremap {<Enter> {}<LEFT><CR><ESC><S-o>
" inoremap ( ()<ESC>i
" inoremap (<Enter> ()<LEFT><CR><ESC><S-o>




"
"""""""""""""""""""""""""""""""
" "mode change color statusline
"""""""""""""""""""""""""""""""
" let g:hi_insert='highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
"
" if has('syntax')
"     augroup InsertHook
"         autocmd!
"         autocmd InsertEnter * call s:StatusLine('Enter')
"         autocmd InsertLeave * call s:StatusLine('Leave')
"     augroup END
" endif
"
" let s:slhlcmd = ''
" function! s:StatusLine(mode)
"     if a:mode == 'Enter'
"         silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
"         silent exec g:hi_insert
"     else
"         highlight clear StatusLine
"         silent exec s:slhlcmd
"     endif
" endfunction
"
" function! s:GetHighlight(hi)
"     redir => hl
"     exec 'highlight '.a:hi
"     redir END
"     let hl = substitute(hl, '[\r\n]', '', 'g')
"     let hl = substitute(hl, 'xxx' ,'', '')
"     return hl
" endfunction
"


"#########################
"カーソル復元
"#########################
if has("autocmd")
    autocmd BufReadPost *
                \if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \endif
endif 


"#########################################
"           dein.vim setting
"#########################################

if 0 | endif
filetype off

if has('vim_starting')
    if &compatible
        set nocompatible
    endif
endif

let g:rc_dir = expand('~/.vim')
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https:github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    "###pulagin list directory###
    call dein#begin(expand('~/.vim/dein/'))
    let s:toml      = g:rc_dir . '/dein/rc/dein.toml' 
    let s:lazy_toml = g:rc_dir . '/dein/rc/dein_lazy.toml' 

    call dein#load_toml(s:toml,     {'lazy': 0})
    call dein#load_toml(s:lazy_toml,{'lazy': 1})


nnoremap :ntree :NERDTree
    call dein#end()
    call dein#save_state()
    
endif

if dein#check_install()
    call dein#install()
endif


syntax on
"----------neocomplete.vim setting-------------

let g:asp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:neocomplete#sourses#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><C-g>    neocomplete#undo_completion()
inoremap <expr><C-l>    neocomplete#common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 

inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

inoremap <expr><Space> pumvisible() neocomplete#close_popup() :"\<Space>"

"--quickrun setting--
let g:quickrun_config = {'*':{'hook/time/enable':'1'},}



"----------before plagins---------------------------------------

" call dein#add('Shougo/dein.vim')
" call dein#add('Shougo/vimproc.vim', {'build': 'make'})
" "以降プラグインを記入
"
"
" "unite.vim
" " call dein#add( 'Shougo/unite.vim')
" " call dein#add( 'Shougo/neomru.vim' )
" "
" "############################
" "    Setting unit.vim
" "    <C-p>  バッファ一覧
" "    <C-n>  カレントディレクトリ以下のファイル一覧
" "    <C-z>  最近使ったファイルの一覧
" "
" "############################
" "入力モードで開始
" " let g:unite_enable_start_insert=1
" "
" "Buffer
" " noremap <C-P> :Unite buffer<CR>
" "
" "file list
" " noremap <C-N> :Unite -buffer-name=file file<CR>
" "
" "recently file
" " noremap <C-Z> :Unite file_mru<CR>
" "
" "sourcesを今開いているファイルのディレクトリにする
" " noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" "
" au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" "
" "open to vsplit windows
" " au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" " au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" "
" "Esc*2 is end
" " au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
" " au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" "
" "#############################
" "setting unite.vim(cannot use dein 07/23)
" "
" "プラグイン記入終了
" call dein#end()
" filetype plugin indent on
"
" "ネットワークエラー時にコメントアウト
" "自動更新
" " if dein#end()
" "     call dein#install()
" " endif
"
"

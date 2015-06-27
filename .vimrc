"-------------------------------
"表示設定
"-------------------------------
"行番号を表示
set number
"カーソルが何行目の何列目にいるかを表示
set ruler
"コマンドラインに使われる画面上の行数
set cmdheight=2
"ステータス行を常に表示する
set laststatus=2
"編集中のファイル名を表示
set title
"vimの行間設定
set linespace=0
"コマンドを表示する
set showcmd
"現在のモードを表示
set showmode
"コメントアウトの色を水色に
highlight Comment ctermfg=2

"-------------------------------
"検索設定
"-------------------------------
"大文字／小文字の区別なく検索
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索
set smartcase
"検索時に最後まで行ったら最初に戻る
set wrapscan
"検索文字の強調表示
set hlsearch
"インクリメンタルサーチ
set incsearch

"-------------------------------
"編集設定
"-------------------------------
"新しい行のインデントを現在行と同じにする
set autoindent
"C言語の自動インデントを始める
set cindent
"対応する括弧に一時的に移動する
set showmatch
"バックスペースキーでも削除できるように
set backspace=indent,eol,start
"スワップファイルは使わない
set noswapfile
"クリップボードを共有
set clipboard=unnamed
"マウスを有効にする
set mouse=a
"上と一緒に使う
set ttymouse=xterm2

"-------------------------------
"タブ設定
"-------------------------------
"インデントをスペース2つ分に設定
set tabstop=2
"タブの代わりに空白文字を指定する
set expandtab
"新しい行を作った時に高度な自動インデントを行う
set smarttab
"自動インデントのスペース数
set shiftwidth=2
"コマンド"<"">"がshiftwidth分だけ移動する
set shiftround
"長い行の折り返しを有効
set wrap

"-------------------------------
"補完設定
"-------------------------------
"コマンドライン補完が拡張モードで行われる
set wildmenu

"-------------------------------
"文字コード設定
"-------------------------------
set encoding=utf-8
set fileencodings=utf-8
set foldmethod=marker

"-------------------------------
"キーマップ設定
"-------------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"-------------------------------
"NeoBundle設定
"-------------------------------
"
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neomru.vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"-------------------------------
"Neocomplcacheのプラグイン
"-------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
hi Pmenu ctermbg=4
hi PmenuSel ctermbg=1
hi PMenuSbar ctermbg=4

"-------------------------------
"Markdownのプラグイン
"-------------------------------
"NeoBundle 'plasticboy/vim-markdown'
"NeoBundle 'kannokanno/previm'
"NeoBundle 'tyru/open-browser.vim'
"au BufRead,BufNewFile *.md set filetype=markdown

filetype plugin indent on
filetype indent on
syntax on

"-------------------------------
"vimprocのプラグイン
"-------------------------------
let g:vimproc_dll_path = $HOME . '/.vim/bundle/vimproc/autoload/vimproc_mac.so'

"-------------------------------
"Unite.vimのプラグイン
"-------------------------------
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 履歴一覧
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"-------------------------------
"gitのプラグイン
"-------------------------------
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" ステータス行に現在のgitブランチを表示する
"set statusline+=%{fugitive#statusline()}

"-------------------------------
"neocomplete.vimのプラグイン
"-------------------------------
"luaがないと動かないので、下記やる
"brew install vim --with-lua
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'

"-------------------------------
"全角スペースの表示
"-------------------------------
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

"-------------------------------
"最後のカーソル位置を復元する
"-------------------------------
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

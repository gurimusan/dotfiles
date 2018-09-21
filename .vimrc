" -----
" Dein
" -----
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.cache/dein'))
  call dein#begin(expand('~/.cache/dein'))

  call dein#load_toml('~/.config/dein/dein.toml',      {'lazy': 0})
  call dein#load_toml('~/.config/dein/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

syntax enable

" -----
" Base
" -----
filetype plugin on
filetype indent on
let mapleader = "\<Space>"      " キーマップリーダー
set scrolloff=5                 " スクロール時の余白
set textwidth=0                 " 1行に長い文章を書いても自動で折り返ししない
set nobackup                    " バックアップを作成しない
set autoread                    " 他で書き換えられても自動で開く
set noswapfile                  " スワップファイルを作らない
set hidden                      " 保存していなくても他のファイルを開ける
set backspace=indent,eol,start  " Backspaceキーの影響範囲に制限を設けない
set formatoptions=lmoq
set browsedir=buffer
set whichwrap+=h,l,<,>,[,],b,s  " 行末・行頭から次の行へ移動可能に
set modelines=0
set visualbell                  " ビープ音は鳴らさない
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    colorscheme molokai
endif
if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
endif

" ------
" Mouse
" ------
set clipboard=unnamed,unnamedplus " クリップボードをOSと共有
set mouse=a                       " 仮想端末上のvimでマウスを使う
if !has('nvim')
  set ttymouse=xterm2
endif

" ------------
" Status line
" ------------
set laststatus=2  " ステータス行を常に表示
set ruler         " カーソル位置表示
set showcmd       " コマンドをステータス行に表示
set showmode      " モードをステータス行に表示

" ------------------
" Quick fix command
" ------------------
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

" -------
" indent
" -------
set autoindent        " 自動でインデント
set smartindent       " 改行時のインデントを揃える
set cindent           " C言語のファイルの自動インデント
set tabstop=2
set shiftwidth=2
set softtabstop=0
autocmd BufNewFile,BufRead *.wsgi set filetype=python
autocmd BufNewFile,BufRead *.vimrc set filetype=vim
autocmd BufNewFile,BufRead *.vimperatorrc set filetype=vim
autocmd BufNewFile,BufRead *.vrapperrc set filetype=vim
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.jinja2 set filetype=jinja
autocmd BufNewFile,BufRead *.twig set filetype=jinja
autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
autocmd FileType jinja      setlocal sw=2 sts=2 ts=2 et

" --------
" Dsiplay
" --------
set showmatch       " 括弧の対応をハイライト
set number          " 行番号表示
set list            " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex    " 印字不可能文字を16進数で表示
set cursorline      " カーソル行をハイライト
set lazyredraw      " コマンド実行中は再描画しない
set ttyfast         " 高速ターミナル接続を行う

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" -----------
" Completion
" -----------
set wildmenu              " コマンド補完を強化
set wildchar=<tab>        " コマンド補完を行うキー
set wildmode=list:full    " リスト表示、最長マッチ
set history=1000          " コマンド・検索パターンの履歴数
set complete+=k           " 補完に辞書ファイルを追加
cnoremap <C-p> <Up>
cnoremap <Up> <C-p>
cnoremap <C-n> <Down>
cnoremap <Down> <C-n>

" --------
"  Search
" --------
set wrapscan    " 最後まで検索したら先頭へ戻る
set ignorecase  " 大文字小文字無視
set smartcase   " 検索文字に大文字が含まれている場合は区別して検索
set incsearch   " インクリメントサーチ
set hlsearch    " 検索文字をハイライト
" ESCを2回押したらハイライト消去
nnoremap <ESC><ESC> :<C-u>set nohlsearch<Return>

" --------
"  Moving
" --------
nnoremap j gj
nnoremap k gk
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" -----
" Edit
" -----
set expandtab
" undo ファイルを作る
set undofile
" undo ファイルを一箇所にまとめる
set undodir=~/.vim/undo
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" XMLの閉じタグを自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END
" <leader>j でJSONをformat
map <Leader>j !python -m json.tool<CR>
" insertモードを抜けるとIMEオフ
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>

" ------
" Gtags
" ------
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" ----------
" Syntastic
" ----------
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['html',  'javascript'] }
let g:syntastic_auto_loc_list = 1
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_disabled_filetypes=['scss']

" ---------
" Encoding
" ---------
set encoding=utf-8
set ffs=unix,dos,mac
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

" -------------
" RangerChooser
" -------------
function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>

" Auto generete with save
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

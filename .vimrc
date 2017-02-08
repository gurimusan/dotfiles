" -----
" Dein
" -----
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))
  call dein#add('tomasr/molokai')
  call dein#add('Shougo/neocomplcache')
  call dein#add('scrooloose/syntastic')
  call dein#add('godlygeek/tabular')
  call dein#add('plasticboy/vim-markdown')
endif

syntax enable

" -----
" Base
" -----
filetype plugin on
filetype indent on
let mapleader = "\<Space>"      " �����ޥåץ꡼����
set scrolloff=5                 " �����������;��
set textwidth=0                 " 1�Ԥ�Ĺ��ʸ�Ϥ�񤤤Ƥ⼫ư���ޤ��֤����ʤ�
set nobackup                    " �Хå����åפ�������ʤ�
set autoread                    " ¾�ǽ񤭴������Ƥ⼫ư�ǳ���
set noswapfile                  " ����åץե��������ʤ�
set hidden                      " ��¸���Ƥ��ʤ��Ƥ�¾�Υե�����򳫤���
set backspace=indent,eol,start  " Backspace�����αƶ��ϰϤ����¤��ߤ��ʤ�
set formatoptions=lmoq
set browsedir=buffer
set whichwrap+=h,l,<,>,[,],b,s  " ��������Ƭ���鼡�ιԤذ�ư��ǽ��
set modelines=0

" ------
" Mouse
" ------
set clipboard=unnamed,unnamedplus " ����åץܡ��ɤ�OS�ȶ�ͭ
set mouse=a                       " ����ü�����vim�ǥޥ�����Ȥ�
set ttymouse=xterm2

" ------------
" Status line
" ------------
set laststatus=2  " ���ơ������Ԥ���ɽ��
set ruler         " �����������ɽ��
set showcmd       " ���ޥ�ɤ򥹥ơ������Ԥ�ɽ��
set showmode      " �⡼�ɤ򥹥ơ������Ԥ�ɽ��

" ------------------
" Quick fix command
" ------------------
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

" -------
" indent
" -------
set autoindent        " ��ư�ǥ���ǥ��
set smartindent       " ���Ի��Υ���ǥ�Ȥ�·����
set cindent           " C����Υե�����μ�ư����ǥ��
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
set showmatch       " ��̤��б���ϥ��饤��
set number          " ���ֹ�ɽ��
set list            " �ԲĻ�ʸ��ɽ��
set listchars=tab:>.,trail:_,extends:>,precedes:< " �ԲĻ�ʸ����ɽ������
set display=uhex    " �����Բ�ǽʸ����16�ʿ���ɽ��
set cursorline      " ��������Ԥ�ϥ��饤��
set lazyredraw      " ���ޥ�ɼ¹���Ϻ����褷�ʤ�
set ttyfast         " ��®�����ߥʥ���³��Ԥ�

" ���ѥ��ڡ�����ɽ��
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /��/

" �����ȥ�����ɥ��ˤΤ߷��������
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
set wildmenu              " ���ޥ���䴰�򶯲�
set wildchar=<tab>        " ���ޥ���䴰��Ԥ�����
set wildmode=list:full    " �ꥹ��ɽ������Ĺ�ޥå�
set history=1000          " ���ޥ�ɡ������ѥ�����������
set complete+=k           " �䴰�˼���ե�������ɲ�
cnoremap <C-p> <Up>
cnoremap <Up> <C-p>
cnoremap <C-n> <Down>
cnoremap <Down> <C-n>

" --------
"  Search
" --------
set wrapscan    " �Ǹ�ޤǸ�����������Ƭ�����
set ignorecase  " ��ʸ����ʸ��̵��
set smartcase   " ����ʸ������ʸ�����ޤޤ�Ƥ�����϶��̤��Ƹ���
set incsearch   " ���󥯥���ȥ�����
set hlsearch    " ����ʸ����ϥ��饤��
" ESC��2�󲡤�����ϥ��饤�Ⱦõ�
nnoremap <ESC><ESC> :<C-u>set nohlsearch<Return>

" --------
"  Moving
" --------
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
" undo �ե�������ս�ˤޤȤ��
set undodir=~/.vim/undo
" ��¸���˹����ζ��������
autocmd BufWritePre * :%s/\s\+$//ge
" XML���Ĥ�������ư�䴰
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END
" <leader>j ��JSON��format
map <Leader>j !python -m json.tool<CR>
" insert�⡼�ɤ�ȴ�����IME����
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
set ffs=unix,dos,mac
set encoding=utf-8

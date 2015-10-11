""" Pathogen's Configuration - must be on top """

filetype off
filetype plugin indent off

execute pathogen#infect()
execute pathogen#infect('bundle/{}', '~/.vimfiles/vimbundle/{}')

filetype plugin indent on
syntax on


""" Personal Configuration """

" vim color theme
set t_Co=256
set guifont=Source\ Code\ Pro\ for\ PowerLine:h16
syntax on
colorscheme monokai

set nocompatible
set encoding=utf-8
set visualbell
set nomodeline

" note: editorconfig overrides this
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab """ tab is space

set autoindent
set number
set ruler
set cursorline
" syntax enable
set showcmd
set hidden
set wildmenu
set showmatch
set lazyredraw

set ignorecase
set smartcase
set gdefault

set wrap
set linebreak
set breakindent
set showbreak=»\
set textwidth=99
set formatoptions=qrn1

set mouse=a
set clipboard=unnamed

set nobackup
set nowritebackup
set noswapfile

" enable folding
" set foldenable
" open most folds by default
" set foldlevelstart=10
" 10 nested fold max
" set foldnestmax=10
" fold based on indent level
" set foldmethod=indent

" set tab and eol characters
set listchars=tab:▸\ ,eol:¬
" invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" change cursor shape in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" mapleader is either comma or space
let mapleader = ","
nmap <space> ,

" ctrl-s to save
noremap <c-s> :update<cr><esc>
vnoremap <c-s> <esc>:update<cr><esc>
inoremap <c-s> <esc>:update<cr><esc>
" close current buffer
nnoremap <leader>dd :bd<cr>
" save current buffer
nnoremap <leader>ww :w<cr>
" close saved buffer(s)
nnoremap <leader>qq :q<cr>
" home/end
nnoremap H ^
nnoremap L $
vnoremap L g_
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" jj is escape
inoremap jj <esc>
" highlight last inserted text
nnoremap gV `[v`]
" create new splits with Qs or Qv, or Qq to close split
nnoremap Q <c-w>
" select all text
nnoremap <leader>aa ggVG
" relativenumber toggle
nnoremap <leader>rn :set relativenumber!<cr>
" visual warning when text past 99 column
" match ErrorMsg '\%>99v.\+'
nnoremap <leader>99 :match ErrorMsg '\%>99v.\+'<cr>
nnoremap <leader>00 :match none<cr>
" switch filetype
nnoremap <leader>fth :set ft=html<cr>
nnoremap <leader>ftj :set ft=javascript<cr>
nnoremap <leader>ftc :set ft=css<cr>


""" Autocmd / Autogroup """

autocmd BufRead,BufNewFile *.es6 setfiletype javascript

augroup JavaScript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>rr :!clear && node %<cr>
  autocmd FileType javascript nnoremap <buffer> <leader>rb :!clear && babel-node %<cr>
  autocmd FileType javascript nnoremap <buffer> <leader>rl :!clear && jshint %<cr>
  " Work around to indent and tab when pressing return after the open brace
  autocmd FileType javascript inoremap {<cr> {<cr>}<c-o>O
  autocmd FileType javascript inoremap [<cr> [<cr>]<c-o>O
  autocmd FileType javascript inoremap (<cr> (<cr>)<c-o>O
augroup END


""" Plugin-dependent Mapping """

" Nerdtree
nnoremap <leader>nt :NERDTreeToggle<cr>

" CtrlP
nnoremap <leader>ff :CtrlP<cr>
nnoremap <leader>fb :CtrlPBuffer<cr>
nnoremap <leader>fr :CtrlPMRU<cr>
nnoremap <leader>fm :CtrlPMixed<cr>
nnoremap <leader>fc :CtrlPCurWD<cr>
nnoremap <leader>bb :CtrlPBuffer<cr>
nnoremap <leader>bn :bn<cr> """ switch between last 2 buffers being edited

" Gundo
nnoremap <leader>hu :GundoToggle<cr>
nnoremap <leader>he :earlier 1f<cr>
nnoremap <leader>hl :later 1f<cr>

" Autoformat
noremap <c-g> :Autoformat<cr>

" Emmet
imap <c-e> <c-y>,

" Dash
nmap <leader>hh <Plug>DashSearch

" Vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


""" Plugin Settings """

" Ag.vim
set runtimepath^=~/.vimfiles/vimbundle/ag

" CtrlP
let g:ctrlp_map = '<c-\>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_match_window = 'min:4,max:28' "results imposed by max height
let g:ctrlp_match_window_reversed = 0

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='!'
let g:syntastic_auto_loc_list=2
let g:syntastic_loc_list_height=5
let g:syntastic_javascript_checkers=['jshint', 'jscs']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute" ,"trimming empty", "unescaped &" , "is not recognized!", "discarding unexpected", "inserting implicit", "missing", "lacks", "element not empty", "letter not allowed here"]

" YouCompleteMe
set complete=.,b,u,]
set wildmode=longest,list,full
set completeopt=menu,preview
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vimfiles/vimsnippets']
autocmd CompleteDone * pclose

" Rainbow
autocmd FileType javascript syntax clear jsFuncBlock " hack to work with js
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'php': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}


" Gundo
set undodir=~/.vimfiles/vimundo
set undofile
set history=1000
set undolevels=1000
let g:gundo_width = 30


""" END """

" turn filetype detection off and, even if it's not strictly
" necessary, disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off

" pathogen runntime injection and help indexing
execute pathogen#infect()
" execute pathogen#helptags()
execute pathogen#infect('bundle/{}', '~/.vimfiles/vimbundle/{}')

" turn filetype detection, indent scripts and filetype plugins on
" and syntax highlighting too
filetype plugin indent on
syntax on

" vim color theme
set t_Co=256
set guifont=Source\ Code\ Pro\ for\ PowerLine:h16
syntax on
set background=dark
color distinguished

set nocompatible
set encoding=utf-8
set nomodeline

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab """ tab is space
set autoindent

set mouse=a
set clipboard=unnamed

set number
set ruler
syntax enable
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
set textwidth=98
" set formatoptions+=t
set formatoptions=qrn1

set nobackup
set nowritebackup
set noswapfile

set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

let mapleader = ","

nnoremap <leader>bn :bn<cr>
" ctrl-s to save
noremap <c-s> :update<cr><esc>
vnoremap <c-s> <esc>:update<cr><esc>
inoremap <c-s> <esc>:update<cr><esc>
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
" match ErrorMsg '\%>98v.\+'
nnoremap <leader>99 :match ErrorMsg '\%>99v.\+'<CR>
nnoremap <leader>00 :match none<CR>
" CtrlP mapping
nnoremap <leader>ff :CtrlP<cr>
nnoremap <leader>fb :CtrlPBuffer<cr>
nnoremap <leader>fr :CtrlPMRU<cr>
nnoremap <leader>fm :CtrlPMixed<cr>
nnoremap <leader>fc :CtrlPCurWD<cr>
" switch filetype
nnoremap <leader>fth :set ft=html<CR>
nnoremap <leader>ftj :set ft=javascript<CR>
nnoremap <leader>ftc :set ft=css<CR>
" select all text
nnoremap <leader>aa ggVG
" create new splits with Qs or Qv, or Qq to close split
nnoremap Q <C-W>

" ag.vim
set runtimepath^=~/.vimfiles/vimbundle/ag

" CtrlP settings
let g:ctrlp_map = '<c-\>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_match_window = 'min:4,max:28' "results imposed by max height
let g:ctrlp_match_window_reversed = 0

" Syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='!'
let g:syntastic_auto_loc_list=2
let g:syntastic_loc_list_height=5
let g:syntastic_javascript_checkers=['jshint', 'jscs']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute" ,"trimming empty", "unescaped &" , "is not recognized!", "discarding unexpected", "inserting implicit", "missing", "lacks", "element not empty", "letter not allowed here"]

" YCM configuration
set complete=.,b,u,]
set wildmode=longest,list,full
set completeopt=menu,preview
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

" ultisnips config
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vimfiles/vimsnippets']
autocmd CompleteDone * pclose

autocmd BufRead,BufNewFile *.es6 setfiletype javascript

augroup JavaScript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>rr :!clear && node %<CR>
  autocmd FileType javascript nnoremap <buffer> <leader>er :!clear && babel-node %<CR>
  autocmd FileType javascript nnoremap <buffer> <leader>jl :!clear && jshint %<CR>
  " Work around to indent and tab when pressing return after the open brace
  autocmd FileType javascript inoremap {<CR> {<CR>}<C-o>O
  autocmd FileType javascript inoremap [<CR> [<CR>]<C-o>O
  autocmd FileType javascript inoremap (<CR> (<CR>)<C-o>O
augroup END

" *********************************************************************
" Description: Vim Custom Configuration
" Version: 3.0
" Author: Felipe Apostol <flipjs.io@gmail.com>
" Date: 11 October 2015
" *********************************************************************


" ------------ Pathogen's Configuration - must be on top ------------ "

set nocompatible
filetype off
filetype plugin indent off

execute pathogen#infect()
" git clone vim-plugins inside ~/.vimfiles/vimbundle directory
execute pathogen#infect('bundle/{}', '~/.vimfiles/vimbundle/{}')

filetype plugin indent on
syntax on


" ---------------------- Custom Configuration ----------------------- "

" Ensure vim-sensible is installed, for set defaults

" vim color theme
set t_Co=256
set guifont=Source\ Code\ Pro\ for\ PowerLine:h16
colorscheme monokai

" override colorscheme monokai background color
highlight Normal guibg=black guifg=white
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" no error bell, no visual bell
set noeb vb t_vb=
set encoding=utf-8
set nomodeline

" may be overridden in .editorconfig
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab """ tab is space

set number
set relativenumber
set cursorline
set hidden
set showmatch
set showmode
set lazyredraw

set ignorecase
set smartcase
set gdefault

set wrap
set linebreak
set breakindent
set showbreak=»\
set textwidth=96
set formatoptions=qrn1
set nolist
set listchars=tab:▸\ ,eol:¬

set splitbelow
set splitright

set mouse=a
set clipboard=unnamed

set nobackup
set nowritebackup
set noswapfile

" change cursorline and matchparen colors (cterm only)
highlight CursorLine ctermbg=233
highlight MatchParen cterm=none ctermbg=201 ctermfg=black
" change matchparen colors to match cursorline on insert mode
autocmd InsertEnter * highlight MatchParen ctermbg=233 ctermfg=15
autocmd InsertLeave * highlight MatchParen ctermbg=201 ctermfg=black

" folds
set viewdir=~/.vimfiles/vimviews
" Note: javascript folds defined in ftplugin directory
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


" --------------------------- Map Leader ---------------------------- "

" mapleader is comma
let mapleader = ","
" get comma functionality back using ,,
nnoremap ,, ,


" ------------------------- Plugin Settings ------------------------- "

" Buftabline
let g:buftabline_show = 1
let g:buftabline_indicators = 1

" Gitgutter
" tell gitgutter to allow overriding gutter color
let g:gitgutter_override_sign_column_highlight = 0
" override gutter color
highlight SignColumn ctermfg=118

" Typescript
let g:typescript_indent_disable = 1
let g:typescript_compiler_options = '-sourcemap'
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Easyclip
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipShareYanks = 1
" do not autoformat pasted text
let g:EasyClipAutoFormat = 0
" disable this feature, see settings at the top (search modern editors)
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 0

" Operator-highlight (flipjs forked version)
let g:ophigh_color = 196
let g:ophigh_color_gui = "#FF0000"

" Ag.vim
set runtimepath^=~/.vimfiles/vimbundle/ag

" CtrlP
let g:ctrlp_map = '<c-\>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l -U --nocolor -g ""'
let g:ctrlp_match_window = 'min:4,max:28' "results imposed by max height
let g:ctrlp_match_window_reversed = 0

" Vimfiler
let g:vimfiler_as_default_explorer = 1

" Autoformat
let g:formatdef_standard_js = '"standard-format --stdin"'
let g:formatters_javascript = ['standard_js']

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = 'X'
let g:syntastic_warning_symbol = '!'
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
" if theres jshintrc, use jshint. if theres eslintrc, use eslint. otherwise use standard
autocmd FileType javascript let b:syntastic_checkers = findfile('.jshintrc', '.;') != '' ?
      \ ['jshint', 'jscs'] : findfile('.eslintrc', '.;') != '' ?
      \ ['eslint'] : ['standard']
" see https://github.com/feross/eslint-config-standard to extend feross/standard

let g:syntastic_html_tidy_ignore_errors = [
      \ "proprietary attribute" ,"trimming empty", "unescaped &" , "is not recognized!",
      \ "discarding unexpected", "inserting implicit", "missing", "lacks",
      \ "element not empty", "letter not allowed here"
      \ ]

" YouCompleteMe
if !exists("g:ycm_semantic_triggers")
   let g:ycm_semantic_triggers = {}
endif
set complete=.,b,u,]
set wildmode=longest,list,full
set completeopt=menu,preview
autocmd CompleteDone * pclose
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'erlang' : [':'],
  \ }
" let g:ycm_filetype_specific_completion_to_disable = { 'javascript': 1 }
" let g:ycm_semantic_completion_toggle = '<c-f>'

" Ultisnips
" put ultisnips snippets inside ~/.vim/UltiSnips
" put snipmate snippets inside ~/.vim/snippets
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-g> :TmuxNavigatePrevious<cr>

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.php call s:syntastic()
augroup END

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" Rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': [81, 208, 148, 197],
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


" ---------------------------- Functions ---------------------------- "

function! FileHeader()
let s:line=line(".")
call setline(s:line,  "/***********************************************************************")
call append(s:line,   " * Description - ")
call append(s:line+1, " * Author - Felipe Apostol")
call append(s:line+2, " * Date - ".strftime("%d %b %Y"))
call append(s:line+3, " ***********************************************************************/")
unlet s:line
endfunction

function! LineHeader(width, word)
    let a:inserted_word = ' ' . a:word . ' '
    let a:word_width = strlen(a:inserted_word)
    let a:length_before = (a:width - a:word_width) / 2
    let a:hashes_before = repeat('-', a:length_before)
    let a:hashes_after = repeat('-', a:width - (a:word_width + a:length_before))
    let a:hash_line = repeat('-', a:width)
    let a:word_line = a:hashes_before . a:inserted_word . a:hashes_after . ' //'

    " :put =a:hash_line
    :put =a:word_line
    " :put =a:hash_line
endfunction

function! DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
endfunction


" -------------------------- Autocommands --------------------------- "

augroup JavaScript
  autocmd!
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript
  autocmd FileType javascript nnoremap <buffer> <leader>rr :!clear && node %<cr>
  autocmd FileType javascript nnoremap <buffer> <leader>rb :!clear && babel-node %<cr>
  autocmd FileType javascript nnoremap <buffer> <leader>rl :!clear && jshint %<cr>
augroup END

augroup TypeScript
  autocmd!
  autocmd FileType typescript nnoremap <buffer> <leader>rr :!clear && tsc %<cr>
  " insert empty line between brackets on <enter> and explicit <tab>
  autocmd FileType typescript inoremap <buffer> {<cr> {<cr>}<c-o>O<tab>
  autocmd FileType typescript inoremap <buffer> [<cr> [<cr>]<c-o>O<tab>
  autocmd FileType typescript inoremap <buffer> (<cr> (<cr>)<c-o>O<tab>
augroup END

augroup CoffeeScript
  autocmd!
  autocmd FileType coffee nnoremap <buffer> <leader>rr :CoffeeRun<cr>
  autocmd FileType coffee nnoremap <buffer> <leader>rl :!clear && coffeelint %<cr>
  autocmd FileType coffee nnoremap <buffer> <leader>rc :CoffeeCompile vert<cr>
  autocmd FileType coffee nnoremap <buffer> <leader>rw :CoffeeWatch vert<cr>
augroup END

augroup PHP
  autocmd!
  autocmd FileType php nnoremap <buffer> <leader>rr :!clear && php %<cr>
augroup END

augroup Elixir
  autocmd!
  autocmd FileType elixir nnoremap <buffer> <leader>rr :!clear && elixir %<cr>
  autocmd FileType elixir nnoremap <buffer> <leader>re :!clear && mix test<cr>
augroup END


" -------------------------- Abbreviations -------------------------- "

" Note: some abbreviations are defined inside ftplugin directory
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
inoreabbrev funciton function
inoreabbrev functon function
" kke is being used as a map to equal sign, use abbrev below for affected words
inoreabbrev bkp bookkeep
inoreabbrev Bkp Bookkeep
inoreabbrev BKP BOOKKEEP
inoreabbrev bkping bookkeeping
inoreabbrev Bkping Bookkeeping
inoreabbrev BKPING BOOKKEEPING


" ------------------------- for iTerm only -------------------------- "

if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end


" -------------------- Plugin-dependent Mapping --------------------- "

" Visual-star-search
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<cr>
vnoremap <leader>* :<c-u>call VisualStarSearchSet('/', 'raw')<cr>:call ag#Ag('grep', '--literal ' . shellescape(@/))<cr>

" Easyclip
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
" easyclip shadows m, rebind m to gm
nnoremap gm m

" Nerdtree
nnoremap <leader>nt :NERDTreeToggle<cr>

" Vimfiler
nnoremap <leader>fe :VimFiler<cr>

" CtrlP
nnoremap <leader>ff :CtrlP<cr>
nnoremap <leader>fb :CtrlPBuffer<cr>
nnoremap <leader>fr :CtrlPMRU<cr>
nnoremap <leader>fm :CtrlPMixed<cr>
nnoremap <leader>fc :CtrlPCurWD<cr>

" Tagbar
nnoremap <leader>tb :TagbarToggle<cr>

" Gundo
nnoremap <leader>uu :GundoToggle<cr>
nnoremap <leader>ue :earlier 1f<cr>
nnoremap <leader>ul :later 1f<cr>

" Autoformat
noremap <c-u> :Autoformat<cr>

" Emmet
imap <c-e> <c-y>,

" Dash
nmap <leader>hh <Plug>DashSearch

" Vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" ------------------------ Function Mapping ------------------------- "

" file heading
nnoremap <leader>hf mz:execute FileHeader()`zjA
" line heading
nnoremap <leader>hl :call LineHeader(67, '
" delete empty buffers
nnoremap <leader>ee :call DeleteEmptyBuffers()<cr>


" ------------------------- Custom Mapping -------------------------- "

" edit and source .vimrc
nnoremap <leader>ve :edit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
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
" quit without saving
nnoremap <leader>QQ :q!<cr>
" remap % ^ $
nnoremap Q %
nnoremap H ^
nnoremap L $
vnoremap L g_
" remove original mapping for ^ and $
nnoremap ^ <nop>
nnoremap $ <nop>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" jj is escape
inoremap jj <esc>
" make copy & paste behave like in modern editors
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" highlight last inserted text
nnoremap gV `[v`]
" stay on visual mode when indenting
vnoremap < <`[v`]
vnoremap > >`[v`]
" select all text
nnoremap <leader>aa ggVG
" visual warning when text past 96 column
" match ErrorMsg '\%>96v.\+'
nnoremap <leader>le :match ErrorMsg '\%>96v.\+'<cr>
nnoremap <leader>ln :match none<cr>
" syntactic error window
nnoremap <leader>ll :Errors<cr>
nnoremap <leader>lo :SyntasticToggleMode<cr>
" switch buffers
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bp :bprev<cr>
nnoremap <silent> <leader>bb :b #<cr>
" splits shortcuts
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>sb :split<cr>
nnoremap <leader>sc <c-w>c
nnoremap <leader>sq :qa<cr>
nnoremap <leader>ss :vertical resize 120<cr>
nnoremap <leader>se <c-w>=
nnoremap <leader>sf <c-w>\|
nnoremap <leader>sd :bp\|bd #<cr>
" switch filetype
nnoremap <leader>ftt :set ft?<cr>
nnoremap <leader>ftj :set ft=javascript<cr>
nnoremap <leader>fts :set ft=typescript<cr>
nnoremap <leader>fth :set ft=html<cr>
nnoremap <leader>ftc :set ft=css<cr>
nnoremap <leader>ftv :set ft=vue<cr>
" center screen when doing n, N, { and }
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz
" insert empty line between brackets on <enter>
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O
" 2 commas become a dot
inoremap ,, .
" kk mapping for hard to reach keyboard keys
inoremap kkp ()<esc>i
inoremap kkc {}<esc>i
inoremap kks []<esc>i
inoremap kka <><esc>i
inoremap kkq ''<esc>i
inoremap kkw ""<esc>i
inoremap kkd <cr><esc>O
inoremap kkh <esc>i
inoremap kkl <esc>la
inoremap kkm <esc>la,
" note: have side effect for word booKKEeping, see word abbrev
inoremap kke =
inoremap kkn :
inoremap kko ;
inoremap kkA <esc>A
" join 2 lines on insert mode when cursor is on second line
inoremap kkj <esc>kJxi


" ----------------------- Bugfix / Workaround ----------------------- "

" CtrlP not finding files in some projects/directories
set shell=/bin/bash

" Rainbow doesn't work well with JavaScript
autocmd FileType javascript syntax clear jsFuncBlock


" ------------------------------ Notes ------------------------------ "

" vim tips
" http://zzapper.co.uk/vimtips.html

" :%s/\r//g                   : Delete DOS returns ^M
" Is your Text File jumbled onto one line? use following
" :%s/\r/\r/g                 : Turn DOS returns ^M into real returns

" find and replace
" http://jezenthomas.com/how-i-find-and-replace-in-vim/

" :args `ack -l '\bClass\b' --ignore-dir=compiled`
" :argdo %s/\<Class\>/MooTools.Class/gc | update

" profiling vim performance
" :profile start profile.log
" :profile func *
" :profile file *
" " At this point do slow actions
" :profile pause
" :noautocmd qall!

" sample code how to use repeatable mapping
" nnoremap <silent> <Plug>TransposeLines ddp
" \:call repeat#set("\<Plug>TransposeLines")<cr>
" nmap cp <Plug>TransposeLines


" ------------------------------- END ------------------------------- "

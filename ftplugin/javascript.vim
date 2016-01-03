" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99

" Abbreviations
inoremap <buffer> iff if ()<esc>i
inoremap <buffer> kki ${}<esc>i
inoremap <buffer> kkf =>

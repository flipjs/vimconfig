" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99

" Abbreviations
inoreabbrev <buffer> usestr 'use strict'
inoreabbrev <buffer> <buffer> usestrict 'use strict'
inoremap <buffer> iff if ()<c-o>i
inoremap <buffer> ,ai ${}<c-o>h
inoremap <buffer> ,af =>

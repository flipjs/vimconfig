" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99

" Abbreviations
inoreabbrev <buffer> usestr 'use strict'
inoreabbrev <buffer> usestrict 'use strict'


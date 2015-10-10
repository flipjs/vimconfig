call pathogen#infect()
call pathogen#helptags()
call pathogen#infect('bundle/{}', '~/.vimfiles/vimbundle/{}')

set nocompatible
syntax on
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab """ tab is space


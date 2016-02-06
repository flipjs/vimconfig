#!/bin/sh

#Ensure you have vim pathogen setup and the line below in your .vimrc
#call pathogen#infect('bundle/{}', '~/.vimfiles/vimbundle/{}')
#
#Post Install: additional steps to do inside the plugin
#* YouCompleteMe
#  - git submodule update --init --recursive
#  - ./install.py --clang-completer --tern-completer
#* tern_for_vim
#  - npm install
#  - (ensure you have .tern-project in project dir or home dir)
#* vimproc.vim
#  - make

git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/tpope/vim-unimpaired.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/rking/ag.vim.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/tpope/vim-commentary.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/tpope/vim-repeat.git
git clone https://github.com/Raimondi/delimitMate.git
git clone https://github.com/jelera/vim-javascript-syntax.git
git clone https://github.com/othree/javascript-libraries-syntax.vim.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/crusoexia/vim-javascript-lib.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/ternjs/tern_for_vim.git
git clone https://github.com/Valloric/YouCompleteMe.git
git clone https://github.com/SirVer/ultisnips.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/editorconfig/editorconfig-vim.git
git clone https://github.com/luochen1990/rainbow.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/rizzatti/dash.vim.git
git clone https://github.com/Chiel92/vim-autoformat.git
git clone https://github.com/mattn/emmet-vim.git
git clone https://github.com/elixir-lang/vim-elixir.git
git clone https://github.com/wavded/vim-stylus.git
git clone https://github.com/kchmck/vim-coffee-script.git
git clone https://github.com/junegunn/vim-easy-align.git
git clone https://github.com/crusoexia/vim-monokai.git
git clone https://github.com/elzr/vim-json.git
git clone https://github.com/itchyny/lightline.vim.git
git clone https://github.com/christoomey/vim-tmux-navigator
git clone https://github.com/ryanss/vim-hackernews.git
git clone https://github.com/joshhartigan/vim-reddit.git
git clone https://github.com/Shougo/unite.vim.git
git clone https://github.com/Shougo/vimfiler.vim.git
git clone https://github.com/Shougo/vimproc.vim.git
git clone https://github.com/Shougo/vimshell.vim.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/tommcdo/vim-exchange.git
git clone https://github.com/flipjs/vim-operator-highlight.git
git clone https://github.com/tpope/vim-abolish.git
git clone https://github.com/svermeulen/vim-easyclip.git
git clone https://github.com/bronson/vim-visual-star-search.git
git clone https://github.com/leafgarland/typescript-vim.git
git clone https://github.com/mxw/vim-jsx.git
git clone https://github.com/othree/yajs.vim.git
git clone https://github.com/ap/vim-buftabline.git
git clone https://github.com/spiiph/vim-space.git
git clone https://github.com/digitaltoad/vim-jade.git
git clone https://github.com/posva/vim-vue.git
git clone https://github.com/vim-scripts/TwitVim.git
git clone https://github.com/terryma/vim-multiple-cursors.git
git clone https://github.com/cakebaker/scss-syntax.vim.git
git clone https://github.com/habamax/vim-skipit.git
git clone git://github.com/mustache/vim-mustache-handlebars.git

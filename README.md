# flipjs.io Vim Configuration

Ensure vim plugins are installed to work with this configuration.
See bundle.txt for list of required vim plugins.

Also, ensure vim has python support compiled to it.
For compiling vim on linux, see below:

sudo apt-get install mercurial python python-dev python3 python3-dev ruby ruby-dev libx11-dev libxt-dev libgtk2.0-dev  libncurses5  ncurses-dev

sudo ./configure \
    --enable-perlinterp \
    --enable-pythoninterp \
    --enable-rubyinterp \
    --enable-luainterp \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gnome-check \
    --with-features=huge \
    --enable-multibyte \
    --with-x \
    --with-compiledby="Felipe Apostol" \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu

sudo make
sudo make install


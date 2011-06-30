Here we dragons

Install
=======

### Automatic Install ###

Run this from your terminal:

    curl https://raw.github.com/igorgue/dotvim/master/install.rb | ruby

Y U NO TRUST ME?

### Manual Install ###

Get it from git:

    cd $HOME
    git clone git://github.com/igorgue/dotvim.git .vim

    ln -s $HOME/.vim/vimrc $HOME/.vimrc
    ln -s $HOME/.vim/gvimrc $HOME/.gvimrc

    cd $HOME/.vim
    git submodule init
    git submodule update

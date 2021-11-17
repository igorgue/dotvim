#!/bin/bash

if [ -d "~/.vim" ]
then
    mv ~/.vim ~/.vim.old
fi

if [ -d "~/config/nvim" ]
then
    mv ~/.config/nvim ~/.config/nvim.old
fi

if [ -d "~/.coc.local.vim" ]
then
    mv ~/.coc.local.vim ~/.coc.local.vim.old
fi

if [ -d "~/.vimrc.local.vim" ]
then
    mv ~/.vimrc.local.vim ~/.vimrc.local.vim.old
fi

if [ -d "~/.vimrc" ]
then
    mv ~/.vimrc ~/.vimrc.old
fi

mkdir ~/.vim
mkdir ~/.config/nvim

cp -r vimrc ~/.vim/vimrc
cp -r vimrc ~/.config/nvim/init.vim
cp -r ginit.vim ~/.config/nvim/ginit.vim
cp -r coc-settings.json ~/.vim/coc-settings.json
cp -r coc-settings.json ~/.config/nvim/coc-settings.json
cp -r coc.local.vim ~/.coc.local.vim
cp -r vimrc.local.vim ~/.vimrc.local.vim

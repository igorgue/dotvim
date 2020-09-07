#!/bin/bash

if [ -d "~/.vim" ]
then
    cp -r ~/.vim ~/.vim.old
    rm -r ~/.vim
fi

if [ -d "~/config/nvim" ]
then
    cp -r ~/.config/nvim ~/.config/nvim.old
    rm -r ~/.config/nvim
fi

cp ~/.coc.local.vim ~/.coc.local.vim.old
cp ~/.vimrc.local.vim ~/.vimrc.local.vim.old

rm -r ~/.coc.local.vim
rm -r ~/.vimrc.local.vim

mkdir ~/.vim
mkdir ~/.config/nvim

cp -r vimrc ~/.vim/vimrc
cp -r vimrc ~/.config/nvim/init.vim
cp -r coc-settings.json ~/.vim/coc-settings.json
cp -r coc-settings.json ~/.config/nvim/coc-settings.json
cp -r coc.local.vim ~/.coc.local.vim
cp -r vimrc.local.vim ~/.vimrc.local.vim

#!/bin/bash

git submodule foreach git checkout master
git submodule foreach git pull --rebase
cd bundle/vim-powerline && git checkout develop && git pull --rebase

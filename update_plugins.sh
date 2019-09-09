#!/bin/bash

git submodule foreach git checkout master
git submodule foreach git checkout -- .
git submodule foreach git pull --ff-only
cd bundle/vim-powerline && git checkout develop && git checkout -- . && git pull --ff-only

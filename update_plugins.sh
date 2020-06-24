#!/bin/bash

# Cleanup
rm -rf bundle/vim-rust-doc/doc/tags

# Checkout and stuff
git submodule foreach git checkout master
git submodule foreach git checkout -- .
git submodule foreach git pull --ff-only

# Extra special modulesthat use develop as main branch
cd bundle/vim-python-mode && git checkout develop && git checkout -- . && git pull --ff-only
cd -
cd bundle/vim-powerline && git checkout develop && git checkout -- . && git pull --ff-only
cd -

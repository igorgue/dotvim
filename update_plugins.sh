#!/bin/bash

# Cleanup
rm -rf bundle/vim-rust-doc/doc/tags

# Checkout and stuff
git submodule foreach git checkout master
git submodule foreach git checkout -- .
git submodule foreach git pull --ff-only

# Extra special modulesthat use develop as main branch
cd bundle/vim-gitgutter && git reset --hard 5f6048da13ed8dee3bd5e453036e1f50e4ed7045
cd -
cd bundle/vim-python-mode && git checkout develop && git checkout -- . && git pull --ff-only
cd -
cd bundle/vim-powerline && git checkout develop && git checkout -- . && git pull --ff-only
cd -

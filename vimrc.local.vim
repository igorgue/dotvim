" Colorscheme one more time
set background=dark
set nonumber
set cmdheight=1

if filereadable(expand("~/.vimrc.local.extras.vim"))
    source ~/.vimrc.local.extras.vim
endif

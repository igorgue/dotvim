if has("gui_macvim")
    " Remove Toolbar
    set guioptions-=T

    " Remove scrollbars
    set guioptions-=L
    set guioptions-=r

    set guifont=Bitstream\ Vera\ Sans\ Mono:h14

    " Command-Shift-F for Ack
    map <D-F> :Ack<space>"

    " Command-/ to toggle comments
    map <D-/> <plug>NERDCommenterToggle<CR>
    imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

    " Don't beep
    set visualbell

    "colorscheme white
    "colorscheme candy
    "colorscheme candycode
    "colorscheme ir_black
    "colorscheme solarized
    colorscheme vividchalk
    "colorscheme grb4
endif

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
    source ~/.gvimrc.local
endif

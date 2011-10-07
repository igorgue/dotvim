if has("gui_macvim")
    " Remove Toolbar
    set guioptions-=T

    " Remove scrollbars
    set guioptions-=L
    set guioptions-=r

    "set guifont=Bitstream\ Vera\ Sans\ Mono:h12
    "set guifont=Anonymous\ Pro:h14

    " Command-F for FufFile
    map <D-F> :PeepOpen<CR>

    " Command-Return for fullscreen
    macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

    " Command-/ to toggle comments
    map <D-/> <plug>NERDCommenterToggle<CR>
    imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

    " Gist command
    let g:gist_clip_command = 'pbcopy'

    " Don't beep
    set visualbell

    "colorscheme white
    "colorscheme candy
    "colorscheme candycode
    "colorscheme ir_black
    "colorscheme solarized
    "colorscheme vividchalk
    "colorscheme molokai
    colorscheme molokai+
    "colorscheme darkbone
    "colorscheme grb4
endif

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
    source ~/.gvimrc.local
endif

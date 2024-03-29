if exists('g:fvim_loaded') && !exists('g:GtkGuiLoaded')
    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
    "nnoremap <C-0> :FVimToggleFullScreen<CR>

    " Nice cursors
    FVimCursorSmoothMove v:false
    FVimCursorSmoothBlink v:false
    FVimUIWildMenu v:true
    FVimUIPopupMenu v:true

    " Background composition (NO WORKEE?)
    "FVimBackgroundComposition 'acrylic'   " 'none', 'transparent', 'blur' or 'acrylic'
    "FVimBackgroundOpacity 0.85            " value between 0 and 1, default bg opacity.
    "FVimBackgroundAltOpacity 0.85         " value between 0 and 1, non-default bg opacity.
    "FVimBackgroundImageVAlign 'center'    " vertial position, 'top', 'center' or 'bottom'
    "FVimBackgroundImageHAlign 'center'    " horizontal position, 'left', 'center' or 'right'
    "FVimBackgroundImageStretch 'fill'     " 'none', 'fill', 'uniform', 'uniformfill'
    "FVimBackgroundImageOpacity 0.85       " value between 0 and 1, bg image opacity

    " Moar configurations
    "FVimCustomTitleBar v:true
    FVimFontSubpixel v:true

    " Font configuration
    FVimFontLigature v:false
    FVimFontAutoSnap v:false

    function Font10()
        set guifont=Iosevka:h10
    endfunction
    command! Font10 call Font10()

    function Font11()
        set guifont=Iosevka:h10
    endfunction
    command! Font11 call Font11()

    function Font12()
        set guifont=Iosevka:h12
    endfunction
    command! Font12 call Font12()

    function Font13()
        set guifont=Iosevka:h13
    endfunction
    command! Font13 call Font13()

    function Font14()
        set guifont=Iosevka:h14
    endfunction
    command! Font14 call Font14()

    function Font15()
        set guifont=Iosevka:h15
    endfunction
    command! Font15 call Font15()

    function Font16()
        set guifont=Iosevka:h16
    endfunction
    command! Font16 call Font16()

    function Font17()
        set guifont=Iosevka:h17
    endfunction
    command! Font17 call Font17()

    function Font18()
        set guifont=Iosevka:h18
    endfunction
    command! Font18 call Font18()

    function Font20()
        set guifont=Iosevka:h20
    endfunction
    command! Font20 call Font20()

    function Font25()
        set guifont=Iosevka:h25
    endfunction
    command! Font25 call Font25()

    "Font17
    set guifont=Iosevka:h18

    " Set the mouse so I can copy to clipboard
    set mouse=a
else " Asume nvim-qt :P
    " Enable Mouse
    set mouse=a

    " Set Editor Font
    if exists(':GuiFont')
        " Use GuiFont! to ignore font errors

        function Font10()
            GuiFont! Iosevka:h10
        endfunction
        command! Font10 call Font10()

        function Font11()
            GuiFont! Iosevka:h10
        endfunction
        command! Font11 call Font11()

        function Font12()
            GuiFont! Iosevka:h12
        endfunction
        command! Font12 call Font12()

        function Font13()
            GuiFont! Iosevka:h13
        endfunction
        command! Font13 call Font13()

        function Font14()
            GuiFont! Iosevka:h14
        endfunction
        command! Font14 call Font14()

        function Font15()
            GuiFont! Iosevka:h15
        endfunction
        command! Font15 call Font15()

        function Font16()
            GuiFont! Iosevka:h16
        endfunction
        command! Font16 call Font16()

        function Font17()
            GuiFont! Iosevka:h17
        endfunction
        command! Font17 call Font17()

        function Font18()
            GuiFont! Iosevka:h18
        endfunction
        command! Font18 call Font18()

        function Font20()
            GuiFont! Iosevka:h20
        endfunction
        command! Font20 call Font20()

        function Font25()
            GuiFont! Iosevka:h25
        endfunction
        command! Font25 call Font25()

        call Font16()
    endif

    " Disable GUI Tabline
    if exists(':GuiTabline')
        GuiTabline 0
    endif

    " Disable GUI Popupmenu
    if exists(':GuiPopupmenu')
        GuiPopupmenu 0
    endif

    " Enable GUI ScrollBar
    if exists(':GuiScrollBar')
        GuiScrollBar 0
    endif

    " Right Click Context Menu (Copy-Cut-Paste)
    nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
    inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
    xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
    snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
endif

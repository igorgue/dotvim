" Env variables everyone needs!
let $BAT_THEME="danger"

if exists('g:vscode')
    call plug#begin('~/.config/nvim/plugged')
        " Keep Plug commands between plug#begin/end.
        Plug 'michaeljsmith/vim-indent-object'
        Plug 'preservim/nerdcommenter'
        Plug 'tpope/vim-speeddating'
        Plug 'tpope/vim-surround'
    call plug#end()

    set nocompatible " use vim defaults
    set backspace=indent,eol,start " Allow backspacing over everything in insert mode
    let mapleader=","
    command! W :w " Seriously, guys. It's not like :W is bound to anything anyway.

    map <C-5> :noh<CR>

    " Window movement without the extra ctrl+w press only ctrl+(h,j,k,l)
    nmap <C-h> <C-w>h
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
    nmap <C-l> <C-w>l

    " Shortcut to rapidly toggle `set list`
    nmap <leader>l :set list!<CR>

    " Shortcut to map ; to :
    nnoremap ; :
    set nostartofline   " don't jump to first character when paging
    set sm              " show matching braces

    " Searching
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    set wildignorecase

    set omnifunc=syntaxcomplete#Complete
    let g:omnicomplete_fetch_full_documentation=1

    finish
endif

call plug#begin('~/.config/nvim/plugged')
    " Keep Plug commands between plug#begin/end.
    Plug 'AndrewRadev/linediff.vim'
    Plug 'antoinemadec/coc-fzf'
    Plug 'elixir-editors/vim-elixir'
    Plug 'honza/vim-snippets'
    Plug 'igorgue/danger'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mattn/gist-vim'
    Plug 'mattn/webapi-vim'
    Plug 'mhinz/vim-startify'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'preservim/nerdcommenter'
    Plug 'preservim/nerdtree'
    Plug 'preservim/tagbar'
    Plug 'puremourning/vimspector'
    Plug 'sainnhe/edge'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-git'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'vim-crystal/vim-crystal'
    Plug 'vim-python/python-syntax'

    " Nvim only pluggins
    if has('nvim')
        Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
        Plug 'neovim/nvim-lspconfig'
        Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
        Plug 'p00f/nvim-ts-rainbow'
    endif
call plug#end()

" Coc default extensions
let g:coc_global_extensions=[
    \ 'coc-clangd', 'coc-css', 'coc-git', 'coc-highlight',
    \ 'coc-html', 'coc-json', 'coc-omnisharp', 'coc-pairs',
    \ 'coc-pyright', 'coc-sh', 'coc-snippets', 'coc-sql',
    \ 'coc-tsserver', 'coc-vetur', 'coc-xml', 'coc-vimlsp',
    \ 'coc-yaml', 'coc-tag', 'coc-dictionary', 'coc-prettier',
    \ 'coc-marketplace', 'coc-diagnostic', 'coc-elixir'
\ ]

" My theme: Danger
set background=dark
colorscheme danger

set nocompatible    " use vim defaults
set number          " show line numbers
set numberwidth=4   " line numbering takes up to 4 spaces
set ruler           " show the cursor position all the time

" Set encoding
set encoding=utf-8

" Whitespace stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Show invisibles
"set list

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildignorecase

" Completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.bak,*.exe,*.pyc,*.dll,*.pdb,*.DS_Store,*.db,env,*/debug/*,*/Debug/*,*/publish/*

" Nerdtree ignores
let NERDTreeSortOrder=['^__\.py$', '\.pyc$', '__pycache__$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeShowBookmarks=1

" Tab movement on normal mode via:
" Tab + j or l (next), k or h (previous), x or q (close), or, n (new)
nnoremap <silent> <Tab>j :tabnext<CR>
nnoremap <silent> <Tab>l :tabnext<CR>

nnoremap <silent> <Tab>h :tabprevious<CR>
nnoremap <silent> <Tab>k :tabprevious<CR>

nnoremap <silent> <Tab>x :tabclose<CR>
nnoremap <silent> <Tab>q :tabclose<CR>

nnoremap <silent> <Tab>n :tabnew<CR>

" Setting 't' also because I keep using it
nnoremap <silent> tj :tabnext<CR>
nnoremap <silent> tl :tabnext<CR>

nnoremap <silent> th :tabprevious<CR>
nnoremap <silent> tk :tabprevious<CR>

nnoremap <silent> tx :tabclose<CR>
nnoremap <silent> tq :tabclose<CR>

nnoremap <silent> tn :tabnew<CR>

if has("autocmd")
    " Remember last location in file
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif

    au BufRead,BufNewFile {*.local} set ft=vim

    " Make Python follow PEP8 (http://www.python.org/dev/peps/pep-0008/)
    au FileType python set softtabstop=4 tabstop=4 shiftwidth=4

    au FileType less set softtabstop=2 tabstop=2 shiftwidth=2
    au FileType slim set softtabstop=2 tabstop=2 shiftwidth=2
    au FileType sql set softtabstop=2 tabstop=2 shiftwidth=2
    au FileType cs set softtabstop=4 tabstop=4 shiftwidth=4

    " Code indentation and file detection
    " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
    au BufRead,BufNewFile {Procfile,Procfile.*,Gemfile,Rakefile,Capfile,Vagrantfile,Thorfile,*.ru,*.feature} set ft=ruby
    au BufNewFile,BufRead *.feature setlocal tabstop=2 shiftwidth=2 softtabstop=2

    " Code indentation
    au FileType nim setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType crystal setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType coffee setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType vuejs setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType haskell setlocal ai
    au FileType less setlocal ai
    au FileType less setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType scala setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType xhtml setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au FileType xml setlocal tabstop=2 shiftwidth=2 softtabstop=2
endif

" Extra nerd commenter configs
let g:NERDCustomDelimiters={
    \ 'nim': { 'left': '# ', 'right': '' },
    \ 'python': { 'left': '# ', 'right': '' },
    \ 'ruby': { 'left': '# ', 'right': '' },
    \ 'json': { 'left': '// ', 'right': '' },
    \ 'javascript': { 'left': '// ', 'right': '' }
\ }

" Add support for jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use modeline overrides
set modeline

" Use zsh as shell
set shell=zsh

" Better mapleader
let mapleader=","

" Default tab settings
set tabstop=4       " number of spaces for tab character
set shiftwidth=4    " number of spaces to (auto) indent
set softtabstop=4   " another tab change that I don't remember
set expandtab       " tabs are converted to spaces

" Don't use Ex mode, use Q for formatting
"map Q gq

" Undofile vim 7.3 only
if has("undofile")
  set undofile
endif

set viminfo='20,<50,s10,h

" Omni completion
set omnifunc=syntaxcomplete#Complete
let g:omnicomplete_fetch_full_documentation=1

" Syntax for multiple tag files are
" Set tags=/my/dir1/tags, /my/dir2/tags
set tags=tags;$HOME/.config/nvim/tags/;$HOME/tmp/tags/ "recursively searches directory for 'tags' file

" Useful keyboard-shortcuts
if has("mac")
  map <D-2> :NERDTreeToggle<CR>
  map <D-3> :TagbarToggle<CR>
  map <D-4> :noh<CR>
  map <D-j> gj
  map <D-k> gk
else
  " TODO <C-2> Does not work...
  map <C-3> :NERDTreeToggle<CR>
  map <C-4> :TagbarToggle<CR>
  map <C-5> :noh<CR>
endif

" Better mappings anyways
if has("nvim")
    map <leader>1 :CHADopen<CR>
else
    map <leader>1 :NERDTreeToggle<CR>
endif
map <leader>2 :TagbarToggle<CR>
map <leader>3 :noh<CR>

" Window movement without the extra ctrl+w press only ctrl+(h,j,k,l)
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Fzf mappings, since I don't use ctrl+p, ctrl+n or ctrl+f to go up and down
if has("nvim")
    nmap <C-p> :Telescope git_files<CR>
    nmap <C-n> :Telescope find_files<CR>
    nmap <C-m> :Telescope live_grep<CR>
else
    nmap <C-p> :GFiles<CR>
    nmap <C-n> :Files<CR>
    nmap <C-m> :Rg<CR>
endif

" Map ,e to open files in the same directory as the current file
map <leader>e :e <C-R>=expand("%:h")<cr>/

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Shortcut to map ; to :
nnoremap ; :
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Hard mode!
let g:hard_mode=0
function! HardMode()
    map <up> iisuckatvi
    map <down> iisuckatvi
    map <left> iisuckatvi
    map <right> iisuckatvi
    imap <up> isuckatvi
    imap <down> isuckatvi
    imap <left> isuckatvi
    imap <right> isuckatvi

    let g:hard_mode=1
endfunction
function! UnHardMode()
    if g:hard_mode
        unmap <up>
        unmap <down>
        unmap <left>
        unmap <right>
    endif

    let g:hard_mode=0
endfunction
command! UnHardMode call UnHardMode()
command! HardMode call HardMode()

HardMode

" Set tabs to the thing I say!!!
function! SetTabs(amount)
  set tabstop=amount       " number of spaces for tab character
  set shiftwidth=amount    " number of spaces to (auto) indent
  set softtabstop=amount   " another tab change that I don't remember
endfunction
command! -nargs=1 SetTabs call SetTabs(<f-args>)

" Show syntax highlighting groups for word under cursor
nmap <leader>x :call SynStack()<CR>
function! SynStack()
  if !exists("*synstack")
    return
  endif

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if has("cscope")
  " Uncoment this and set if vim can't find it
  set csto=0
  set cst
  set nocsverb

  " Add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " Else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif

  set csverb
endif

" Use ack to grep
set grepprg=rg

" All the small things(tm)
set mouse=a         " enable mouse
set ls=2            " always show status line
set scrolloff=5     " keep 5 lines when scrolling
set showcmd         " display incomplete commands
set showmode        " display the current mode
set laststatus=2    " show last status?
set linebreak       " linebreaks
set wrap            " set wrap for lines
set title           " show title in the console title bar
set sm              " show matching braces
set ttyfast         " smoother changes
set shortmess=atI   " abbreviate messages
set nostartofline   " don't jump to first character when paging
"set undolevels=200
set backupdir=/tmp
set showtabline=1
set hidden
set cursorline      " Cursor line to see where my cursor is, smart.
set t_Co=256
set lazyredraw

let g:JSLintHighlightErrorLine=0

set encoding=utf-8

let g:racer_experimental_completer=1
let g:racer_insert_paren=1
let g:rustfmt_autosave=1

" Gist command (Linux version)
let g:gist_clip_command='xsel --clipboard --input'

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" python-syntax highlight all
let g:python_highlight_all=1

" OmniSharp configuration
"let g:OmniSharp_diagnostic_showid=1
let g:OmniSharp_highlighting=3
"let g:OmniSharp_diagnostic_overrides='None'
let g:OmniSharp_popup=1 " Show vim popups or floats
let g:OmniSharp_selector_findusages='fzf' " Use fzf.vim for ui stuff
let g:OmniSharp_selector_ui='fzf'
let g:OmniSharp_timeout=60000 " Basically no timeout
"let g:OmniSharp_loglevel='debug'
"let g:OmniSharp_prefer_global_sln=0
"let g:OmniSharp_server_stdio=0
"let g:OmniSharp_server_type='roslyn'
"let g:OmniSharp_server_use_mono=0
"let g:OmniSharp_want_snippet=0
let g:OmniSharp_server_use_net6=1

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " Omnifunc
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <silent> <buffer> gi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <silent> <buffer> gu <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
    autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

    " Navigate up and down by method/property/field
    autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
    autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
    " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
    autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
    " Repeat the last code action performed (does not use a selector)
    autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
    autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

    autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

    autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

    autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

" fzf
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" fzf layout config
let g:fzf_layout={ 'window': { 'width': 0.8, 'height': 0.5, 'border': 'sharp' } }

" Nvim only stuff
if has('nvim')
    " Semshi config

    " Semchi
    let g:semshi#simplify_markup=0

    exe 'hi pythonBuiltinFunc guifg=none ctermfg=none'
    exe 'hi pythonBuiltinObj guifg=none ctermfg=none'
    exe 'hi pythonBuiltinType guifg=none ctermfg=none'

    set termguicolors
endif

" Mac stuff
if has("gui_macvim")
    " Remove Toolbar
    set guioptions-=T

    " Remove scrollbars
    set guioptions-=L
    set guioptions-=r

    " Command-Return for fullscreen
    let g:mac_fullscreen=0
    function! ToggleMacFullScreen()
        if g:mac_fullscreen
            set nofu
            let g:mac_fullscreen=0
        else
            set fu
            let g:mac_fullscreen=1
        endif
    endfunction
    command! ToggleMacFullScreen call ToggleMacFullScreen()
    nmap <D-CR> :ToggleMacFullScreen<CR>

    " Command-/ to toggle comments
    map <D-/> <plug>NERDCommenterToggle<CR>
    imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

    " Gist command
    let g:gist_clip_command='pbcopy'

    " Font
    set guifont=Iosevka:h18

    " Don't beep
    set visualbell
endif

" Gvim
if has('gui_running') && has('gui_gtk3')
    set guifont=Iosevka\ Term\ 14

    let g:menu_hidden=0
    function! ToggleMenu()
        if g:menu_hidden
            set guioptions+=m
            let g:menu_hidden=0
        else
            set guioptions-=m
            let g:menu_hidden=1
        endif
    endfunction
    command! ToggleMenu call ToggleMenu()
    nmap <C-0> :ToggleMenu<CR>

    "set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif

" Make mouse on terminal work be able to copy paste
if !has('gui_running') && !has('gui_macvim') && !has('GtkGuiLoaded') && !exists("g:gnvim")
    set mouse-=a
endif

" GNvim
if exists("g:gnvim")
    " Font
    set guifont=Iosevka:h14

    " Mouse blinking: on
    set guicursor+=a:blinkon333
endif

" Eovim
if exists("g:eovim_running")
  set guifont=Iosevka\ Term-18
  let g:eovim_theme_bell_enabled = 1
  let g:eovim_theme_react_to_key_presses = 1
  let g:eovim_theme_react_to_caps_lock = 1
  let g:eovim_cursor_animation_style = 'sinusoidal'

  let g:eovim_theme_completion_styles = {
      \ 'default': 'font_weight=bold color=#ffffff',
      \ 'm': 'color=#ff00ff',
      \ 'v': 'color=#00ffff',
      \ 'f': 'color=#ffff00',
      \ 't': 'color=#0000ff',
      \ 'd': 'color=#0000ff',
  \}
endif

" NVIMGtk functions
if exists('g:GtkGuiLoaded')
    " This is my main editor

    " Setup fonts
    function Font10()
        call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term 10')
    endfunction
    command! Font10 call Font10()

    function Font11()
        call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term 11')
    endfunction
    command! Font11 call Font11()

    function Font12()
        call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term 12')
    endfunction
    command! Font12 call Font12()

    function Font13()
        call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term 13')
    endfunction
    command! Font13 call Font13()

    function Font14()
        call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term 14')
    endfunction
    command! Font14 call Font14()

    function Font15()
        call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term 15')
    endfunction
    command! Font15 call Font15()

    function Font16()
        call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term 16')
    endfunction
    command! Font16 call Font16()

    function Font25()
        call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term 25')
    endfunction
    command! Font25 call Font25()

    " Use GTK  clipboard
    let g:GuiInternalClipboard=1

    " Disable native popup an use nvim one instead
    call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)

    " Use Iosevka's font without features. Fira Code style (ss05)
    call rpcnotify(1, 'Gui', 'FontFeatures', 'calt off,ss05')

    " or with with C-Like features for operators and other characters
    " call rpcnotify(1, 'Gui', 'FontFeatures', 'CLIK,ss05')

    " Set font to 14 works on my laptop on my monitor though I like 12 on bigger monitors (:Font12)
    Font14

    " Set the mouse so I can copy to clipboard
    set mouse=a
endif

" Vimspector mappings (issue with F11!, that's why is not using human mode, and it's Shift+F11 now)
" but the rest of the bindings are human: https://github.com/puremourning/vimspector#human-mode
nmap <F3> <Plug>VimspectorStop
nmap <S-F3> :VimspectorReset<CR>
nmap <F4> <Plug>VimspectorRestart
" Start or continue Vimspector
nmap <C-F5> :make<CR>
nmap <F5> <Plug>VimspectorContinue
nmap <F6> <Plug>VimspectorPause
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <S-F9> <Plug>VimspectorToggleConditionalBreakpoint
nmap <F8> <Plug>VimspectorAddFunctionBreakpoint
nmap <F10> <Plug>VimspectorStepOver
nmap <S-F11> <Plug>VimspectorStepInto
nmap <F12> <Plug>VimspectorStepOut

" Since Iosevka doesn't support the default glyphs, this looks better though
" also change the highlight colors
sign define vimspectorBP text=o texthl=MatchParen
sign define vimspectorBPCond text=o? texthl=Constant
sign define vimspectorBPDisabled text=o! texthl=Comment
sign define vimspectorPC text=\ > texthl=CursorColumn linehl=CursorLine
sign define vimspectorPCBP text=o> texthl=Constant

" Lightline
let g:lightline={
\   'active': {
\       'left': [
\           [ 'mode', 'paste' ],
\           [ 'gitbranch', 'filename', 'readonly', 'modified' ]
\       ],
\       'right':[
\           [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
\           [ 'blame' ]
\       ],
\   },
\   'component_function': {
\       'gitbranch': 'FugitiveHead'
\   },
\   'colorscheme': 'danger'
\ }

if has("nvim")
    let g:symbols_outline = {
        \ "highlight_hovered_item": v:true,
        \ "show_guides": v:true,
        \ "position": 'right',
        \ "auto_preview": v:true,
        \ "show_numbers": v:false,
        \ "show_relative_numbers": v:false,
        \ "show_symbol_details": v:true,
        \ "keymaps": {
            \ "close": "<Esc>",
            \ "goto_location": "<Cr>",
            \ "focus_location": "o",
            \ "hover_symbol": "<C-space>",
            \ "rename_symbol": "r",
            \ "code_actions": "a",
        \ },
        \ "lsp_blacklist": [],
    \ }
endif

" Use <leader><space> to run CocAction to show possible solutions to errors
" my leader key is `,` so `,<space>` then navigate via jk on the quickfix
" window
nmap <leader>a :CocAction<CR>
nmap <leader><space> :CocDiagnostics<CR>

" Configure snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next='<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev='<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Include coc configuration
if filereadable(expand("~/.coc.local.vim"))
    source ~/.coc.local.vim
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
}
EOF

" Extra quirks that I like to get rid of
set cmdheight=1
set updatetime=300
set signcolumn=auto
set noshowmode

" Include user's local nvim config and rewrites
if filereadable(expand("~/.vimrc.local.vim"))
    source ~/.vimrc.local.vim
endif

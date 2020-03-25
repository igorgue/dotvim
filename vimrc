" Igor's VIM configuration file

" Mark as loaded if it's not compatible.
let g:CSApprox_verbose_level = 0

" Pymode options.
let g:pymode_lint = 0 " Disable annoying pylint mode plugin
let g:pymode_virtualenv = 0 " Disable broken virtualenv plugin
let g:pymode_options_fold = 0 " I don't like folding

" Fancy powerline.
let g:Powerline_symbols = 'fancy'

" JavaScript's linter
let g:syntastic_javascript_checker = 'jsl'

" Disable python if not found
if !has('python')
  let g:pymode = 0
end

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

" Set syntax highlighting
set background=dark
syntax on

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
"set list            " show list chars

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.bak,*.exe,*.pyc,*.DS_Store,*.db,env

" NerdThree config
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeShowBookmarks=1

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" adds less syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 (http://www.python.org/dev/peps/pep-0008/)
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4
au FileType less set softtabstop=2 tabstop=2 shiftwidth=2
au FileType slim set softtabstop=2 tabstop=2 shiftwidth=2
au FileType sql set softtabstop=2 tabstop=2 shiftwidth=2

" Python highlighting errors
let python_highlight_all=1
let python_highlight_indent_errors=1
let python_highlight_space_errors=1

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use modeline overrides
set modeline
"set modelines=2

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement=1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

set shell=zsh

" Better mapleader
let mapleader=","

" Tab settings
set tabstop=4       " number of spaces for tab character
set shiftwidth=4    " number of spaces to (auto) indent
set softtabstop=4   " another tab change that I don't remember
set expandtab       " tabs are converted to spaces

" Don't use Ex mode, use Q for formatting
map Q gq

" Undofile vim 7.3 only
if has("undofile")
  set undofile
endif

set viminfo='20,<50,s10,h
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" omni completion
set omnifunc=syntaxcomplete#Complete

" syntax for multiple tag files are
" set tags=/my/dir1/tags, /my/dir2/tags
set tags=tags;$HOME/.vim/tags/;$HOME/tmp/tags/ "recursively searches directory for 'tags' file

" Useful keyboard-shortcuts
if has("mac")
  map <D-2> :NERDTreeToggle<CR>
  map <D-3> :TagbarToggle<CR>
  map <D-4> :noh<CR>
  map <D-j> gj
  map <D-k> gk
else
  map <F2> :NERDTreeToggle<CR>
  map <F3> :TagbarToggle<CR>
  map <F4> :noh<CR>
endif

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" code indentation and file detection
au BufNewFile,BufRead .vimrc setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.feature setfiletype ruby
au BufNewFile,BufRead *.feature setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.ru setfiletype ruby
au BufNewFile,BufRead Gemfile setfiletype ruby
au BufNewFile,BufRead Capfile setfiletype ruby

au FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType crystal setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType coffee setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType vuejs setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType haskell setlocal ai
au FileType less setlocal ai
au FileType less setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType scala setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType xhtml setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType htmldjango setlocal tabstop=2 shiftwidth=2 softtabstop=2

au BufNewFile,BufRead admin.py setlocal filetype=python.django
au BufNewFile,BufRead urls.py setlocal filetype=python.django
au BufNewFile,BufRead models.py setlocal filetype=python.django
au BufNewFile,BufRead views.py setlocal filetype=python.django
au BufNewFile,BufRead settings.py setlocal filetype=python.django
au BufNewFile,BufRead forms.py setlocal filetype=python.django
au BufNewFile,BufRead *.as setlocal filetype=actionscript

" Map ,e to open files in the same directory as the current file
map <leader>e :e <C-R>=expand("%:h")<cr>/

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" shortcut to change to htmldjnago
nmap <leader>d :set ft=htmldjango<CR>

" shortcut to search in project
nnoremap <leader>a :Ack<space>

" shortcut to map ; to :
nnoremap ; :
 
" use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Taliban mode!!! alalallalallalallala!
function TalibanMode()
    map <up> iisuckatvi
    map <down> iisuckatvi
    map <left> iisuckatvi
    map <right> iisuckatvi
    imap <up> isuckatvi
    imap <down> isuckatvi
    imap <left> isuckatvi
    imap <right> isuckatvi
endfunction
command! TalibanMode call TalibanMode()

TalibanMode

" Copy shit
function Tcmd()
  !echo be rake test TEST=% | tr -d '\n' | pbcopy
endfunction
command! Tcmd call Tcmd()

" Set tabs to the thing I say!!!
function SetTabs(amount)
  set tabstop=a:amount       " number of spaces for tab character
  set shiftwidth=a:amount    " number of spaces to (auto) indent
  set softtabstop=a:amount   " another tab change that I don't remember
endfunction
command! -nargs=1 SetTabs call s:SetTabs(<f-args>)

" Show syntax highlighting groups for word under cursor
nmap <C-S-X> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if has("cscope")
  " uncoment this and set if vim can't find it
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif

" Use ack to grep
set grepprg=ack

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
"set ttyfast         " smoother changes
"set shortmess=atI   " abbreviate messages
set nostartofline   " don't jump to first character when paging
"set undolevels=200
set backupdir=/tmp
"set hls
set showtabline=2
"set hidden
set cursorline      " Cursor line to see where my cursor is, smart.
"set t_Co=256

" Autoclean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

let g:JSLintHighlightErrorLine = 0

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Include powerline
set rtp+=$HOME/.vim/bundle/vim-powerline/powerline/bindings/vim
set encoding=utf-8

let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
let g:rustfmt_autosave = 1
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" Nim's JumpToDef
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

set lazyredraw

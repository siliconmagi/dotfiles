" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


"set autoindent		" always set autoindenting on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nowrap		" turns off text wrapping
set nospell 		" turns on spell check for all files
" autocmd BufNewFile,BufRead *.txt,*.html,README set spell "turns on spell check only for specified files
set paste		" turns on traditional pasting of text
" set number 		" turns line numbering on
colorscheme elflord	" sets color scheme;  default (black bkgr), torte (black bgr), murphy (black bkgr), elflord (black bkgr), blue (blue bkgr), morning (white bkgr), shine (white bkgr)
set ruler		" show the cursor position all the time

" For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell'
" instruct to use your own .screenrc file
let g:vimrplugin_noscreenrc = 1
" For integration of r-plugin with screen.vim
let g:vimrplugin_screenplugin = 1
" Don't use conque shell if installed
let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R
let g:vimrplugin_map_r = 1
" see R documentation in a Vim buffer
let vimrplugin_vimpager = "no"
"set expandtab
set shiftwidth=4
set tabstop=8
" start R with F2 key
map <F2> <Plug>RStart
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection
" send line to R with space bar
nmap <Space> <Plug>RDSendLine

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" set folding scheme; more on this see:
" http://www.dgp.toronto.edu/~mjmcguff/learn/vim/folding.txt
" http://vim.dindinx.net/orig/usr_28.txt
"set foldcolumn=0 " if set to > 1 together with 'set number', then the copy&paste of screen will include the line numbers
"highlight Folded ctermfg=yellow ctermbg=blue
" highlight  works only when colorscheme is uncommented
"set foldmethod=indent
"hi FoldColumn ctermbg=NONE

" For Latex work: open *.pdf files in evince/xpdf upon opening of *.tex files in vim
" more on this on this page: http://ubuntuforums.org/showthread.php?p=5351607
au BufRead *.tex silent !xpdf %<.pdf 2>/dev/null &
au BufRead *.Rnw silent !xpdf %<.pdf 2>/dev/null &

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" Sort function from Gerald Lai at http://www.vim.org/tips/tip.php?tip_id=923 (use last
" script on page, not first!!!!!).
" paste in vimrc file - tested with GVim 6.3

"** use visual block <Ctrl-V> to select lines to sort and hit <F3> **
vmap <F3> :call Sort(Prompt("0","1"),Prompt("1","f"),"Strcmp")<CR>

"sort lines function
function Sort(wnum, order, cmp) range
  normal `<
  execute "let startcol = col(\".\")"
  normal `>
  execute "let endcol = col(\".\")"
  if startcol <= endcol
    let firstcol = startcol
    let lastcol = endcol
  else
    let firstcol = endcol
    let lastcol = startcol
  endif

  call SortR(a:firstline, a:lastline, firstcol, lastcol, a:wnum, a:order, a:cmp)
  normal gv
endfunction

"sort lines recursively
function SortR(start, end, first, last, wnum, order, cmp)
  if a:start >= a:end
    return
  endif

  let partition = a:start - 1
  let middle = partition
  let partstr2 = Words2(getline((a:start + a:end) / 2), a:first, a:last, a:wnum)
  let i = a:start

  while i <= a:end
    let str = getline(i)
    let partstr = Words2(str, a:first, a:last, a:wnum)
    if a:order == "r"
      execute "let result = ".a:cmp."(partstr2, partstr)"
    else
      execute "let result = ".a:cmp."(partstr, partstr2)"
    endif

    if result <= 0
      "swap i before partition
      let partition = partition + 1

      if result == 0
        let middle = partition
      endif

      if i != partition
        let str2 = getline(partition)
        call setline(i, str2)
        call setline(partition, str)
      endif
    endif

    let i = i + 1
  endwhile

  "make sure middle element at end of partition
  if middle != partition
    let str = getline(middle)
    let str2 = getline(partition)
    call setline(middle, str2)
    call setline(partition, str)
  endif

  call SortR(a:start, partition - 1, a:first, a:last, a:wnum, a:order, a:cmp)
  call SortR(partition + 1, a:end, a:first, a:last, a:wnum, a:order, a:cmp)
endfunction

"determine compare strings
function Words2(line, first, last, wnum)
  if a:wnum == "v"
    return strpart(a:line, a:first - 1, a:last - a:first + 1)
  elseif a:wnum > 1
    return strpart(a:line, matchend(a:line, "\\s*\\(\\S*\\s*\\)\\{".(a:wnum - 1)."}"))
  elseif a:wnum == 1
    return strpart(a:line, matchend(a:line, "\\s*"))
  elseif a:wnum < 0
    return matchstr(a:line, "\\(\\S*\\s*\\)\\{".(-a:wnum)."}$")
  else
    return a:line
  endif
endfunction

"compare two strings
function Strcmp(str1, str2)
  if a:str1 < a:str2
    return -1
  elseif a:str1 > a:str2
    return 1
  else
    return 0
  endif
endfunction

"prompt user for settings
function Prompt(str, ...)
  let default = a:0 ? a:1 : ""
  if a:str == "0"
    let str = "Sort by which word [(0)whole line (<0)count from right (v)isual]? "
  elseif a:str == "1"
    let str = "Order [(f)orward (r)everse]? "
  endif

  execute "let ret = input(\"".str."\", \"".default."\")"

  return ret
endfunction



" silicon magi vimrc

" Basics {{{

set nocompatible
filetype plugin indent on

set autoread
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set foldlevelstart=0
set foldmethod=marker
set gdefault
set hidden
set history=1000
set ignorecase
set incsearch
set iskeyword-=_
set lazyredraw
" set matchpairs+=<1>
set nobackup
set noswapfile
set nowritebackup
set showbreak=>
set smartcase
set splitbelow
set splitright
set termencoding=utf-8
set visualbell
set wildmenu
set wildmode=list:longest

" block select not limited by shortest line
set virtualedit=
set wildmenu
set laststatus=2
set wrap linebreak nolist
set wildmode=full

let g:netrw_localrmdir='rm -r'
let g:netrw_banner=0

" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged\')
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekprior/vim-trimmer'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sjl/gundo.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'w0ng/vim-hybrid'
Plug 'scrooloose/nerdcommenter'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'dag/vim-fish'
Plug 'dNitro/vim-pug-complete'
Plug 'digitaltoad/vim-pug'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim'
Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug 'othree/jsdoc-syntax.vim', {'for': 'javascript'}
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'hail2u/vim-css3-syntax', {'for':['css','scss']}
Plug 'ap/vim-css-color'
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'vimlab/mdown.vim', {'do': 'npm install'}
Plug 'tyru/markdown-codehl-onthefly.vim'
Plug 'stephpy/vim-yaml', {'for': 'yaml'}
Plug 'Konfekt/FastFold'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'jalvesaq/Nvim-R'
call plug#end()

" }}}

" Tabs, spaces & wrapping {{{

set backspace=indent,eol,start
set expandtab
set formatoptions=tcr
set formatoptions+=l
set formatoptions+=1
set formatoptions+=jq
" set formatoptions+=tab:*.,trail:-,nbsp: |
set nojoinspaces
set scrolloff=3
set shiftround
set shiftwidth=2
set sidescroll=1
set sidescrolloff=5
set softtabstop=2
set textwidth=80
set wrap

" }}}

" Files and paths {{{

set wildignore+=*.gem,vendor/cache/**,vendor/rails/**
set wildignore+=*.o,*.obj,*.a,*.so
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*DS_Store*
set wildignore+=*sass-cache*
set wildignore+=.hg,.git,_darcs
set wildignore+=build,lib,node_modules
set wildignore+=log/**,tmp/**
" undo files
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"

" }}}

" Visuals {{{

syntax enable
set background=dark
set cursorline
set hlsearch
set number
set relativenumber
set ruler
set showtabline=0
set t_Co=256
colorscheme hybrid

" }}}

" GUI {{{

if has("gui_running")
    set guifont=Menlo:h13
    set guioptions-=r
    set guioptions-=L
endif

" }}}

" Mappings {{{
let mapleader = ','
set ttimeout
set ttimeoutlen=100

" yank copies to global clipboard
set clipboard=unnamedplus

" nerd comment
let g:NERDSpaceDelims = 1

" Remember cursor position between vim sessions
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz
set complete=.,w,b,u,t,k
let g:gitgutter_max_signs = 1000  " default value
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
let g:indentLine_char='│'
let g:table_mode_corner="|"
set formatoptions+=t

" Nicer defaults {{{
" Split switching
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" jk escaping
inoremap jk <esc>

" Fix movement around soft-wrapped lines
nnoremap j gj
nnoremap k gk

" Move multiple lines with shift and ctrl
noremap J 5j
noremap K 5k
noremap <C-j> :wincmd l
noremap <C-k> :wincmd h

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" DISABLED FOR VIM-R-PLUGIN
" " esc removes highlighting
" map <esc> :noh<cr>

" " Send chars deleted with 'x' to black hole
nnoremap x "_x

" EOL / BOL movement
noremap H ^
noremap L $
vnoremap L g_
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Go to match
nnoremap <tab> %

" Keep cursor position when '*'ing
nnoremap * *<c-o>

" Select the line sans indentation
nnoremap vv ^vg_

" Don't search man pages when I'm too slow to shift
vnoremap K k

" Copy / Paste to / from clipboard
xnoremap <c-c> "+y
nnoremap <c-p> "+p

" Start an external command with just !
nnoremap ! :!

" }}}

" Buffers & tabs {{{

" Quit single buffer
nnoremap <silent> <C-q> :q<CR>

" Quit all buffers
nnoremap <silent> <C-w> :qa<CR>

" Next tab
nnoremap <silent> <tab> :tabn<CR>

" Previous tab
nnoremap <silent> <s-tab> :tabp<CR>

" Quitting & writing
nnoremap <leader>q :bp <bar> bd #<cr>
nnoremap <leader>w :w<cr>

" Switching
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap <leader><leader>l :tabnext<cr>
nnoremap <leader><leader>h :tabprevious<cr>

"  }}}

" Files {{{

" CtrlP
" let g:ctrlp_map = ',<space>'
nnoremap ,, :CtrlPBuffer<cr>
nnoremap ,e :CtrlP %:p:h<cr>
nnoremap ,v :CtrlP $HOME/vim<cr>
nnoremap ,p :CtrlP $HOME/p<cr>

" Gundo
nnoremap ,u :GundoToggle<cr>

" }}}

" Display {{{

" space open/closes folds
" leader space closes all folds but the current one
nnoremap <space> za
nnoremap <leader><space> zMzO

" Remove search highlight
" nnoremap <leader><cr> :nohlsearch<cr>

" }}}

" Editing {{{

" Move lines around easily
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

" Re-wrap paragraph
nnoremap <silent> Q gqip

" Auto-indent pasted text
nnoremap p p=`]<c-o>
nnoremap P P=`]<c-o>

" Insert blank lines in normal mode
nnoremap <cr> o<esc>xk

" Keep search matches in the middle of the screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Enter prose mode
nnoremap <leader>p :call ToggleProseOptions()<cr>

" Search / replace word under cursor in file
nnoremap <leader>* :%s/\<<c-r><c-w>\>//<left>

" Ack
nnoremap <leader>a :Ack!<space>
xnoremap <leader>a y:Ack! <c-r>=fnameescape(@")<cr><cr>

" Sorting
xnoremap <leader>s :sort i<cr>
nnoremap <leader>S vi{:sort<space>i<cr><c-o>

" }}}

" Git {{{

" Fugitive bindings
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :call SplitDirtyFiles()<cr>

" }}}

" }}}

" Abbreviations {{{

" iabbrev (c)
" iabbrev (c)
iabbrev @@ siliconmagi@yandex.com

" }}}

" Prose {{{

" set spelllang=en_gb
" set spellfile=~/.vim/custom-dictionary.utf-8.add
" let g:is_in_prose_mode=0

" }}}

" Augroup {{{

augroup Vimrc
    au!
    " Set filetypes
    au BufRead,BufNewFile *.{es6,es6.erb} setfiletype javascript
    au BufRead,BufNewFile *.{jscs,jshint,eslint}rc setfiletype json
    au BufRead,BufNewFile *.md setfiletype markdown
    au BufRead,BufNewFile *.vue set filetype=html

    " Update splits when the window is resized
    au VimResized * :wincmd *

    " Only show cursor line in current window and insert mode
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline

    " Write everything when focus is lost
    au FocusLost * :silent! wall
augroup END

" }}}

" Functions {{{

function! ToggleProseOptions()
    if g:is_in_prose_mode == 0
        let g:is_in_prose_mode=1
        Goyo
        setlocal spell
    else
        let g:is_in_prose_mode=0
        setlocal nospell
        Goyo!
    endif
endfunction

function! SplitDirtyFiles()
    only " Close all windows, unless they're modified
    let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
    let filenames = split(status, "\n")
    exec "edit " . filenames[0]
    for filename in filenames[1:]
        exec "sp " . filename
    endfor
endfunction
" }}}

" RIPGREP FZF FISH {{{

" use rg for grepping
set grepprg=rg\ --vimgrep

" Use ripgrep with ack
if executable('rg')
    let g:ctrlp_user_command = 'rg --files %s'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_switch_buffer = 'et'
endif
let g:ackprg = 'rg --vimgrep --no-heading'

" wild ignore
set wildignore+=*/.git/*,*/tmp/*,*.swp

"fzf rg find code
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Set up :make to use fish for syntax checking.
autocmd FileType fish compiler fish

" Set this to have long lines wrap inside comments.
autocmd FileType fish setlocal textwidth=79

" Enable folding of block structures in fish.
autocmd FileType fish setlocal foldmethod=expr

" Rust
set hidden
let g:racer_cmd = "/home/oak/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" vim-racer enables C-x-C-o to search for completions and provides several <Plug> mappings for source code navigation
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" YCM
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_rust_src_path = '/home/zeal/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_min_num_of_chars_for_completion = 1

" CTRL-e to toggle tree view with CTRL-t
nmap <silent> <C-e> :NERDTreeToggle<CR>
" Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR>

" show Hidden files in nerdtree
let NERDTreeShowHidden=1

" ,f to format code, requires formatters: read the docs
noremap <leader>f :Autoformat<CR>
" init dictionary
let g:lmap =  {}
let g:lmap.f = { 'name' : 'Format file' }

" airline
let g:airline#extensions#tabline#enabled = 1
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
" let g:airline#extensions#neomake#error_symbol='✖ :'
" let g:airline#extensions#neomake#warning_symbol='⚠ :'
" let g:airline_theme='luna'
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" }}}

" Syntax {{{
" r lang
" nmap <silent> <C-k> :hi<CR>

" For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell'
" instruct to use your own .screenrc file
let g:vimrplugin_noscreenrc = 1
" For integration of r-plugin with screen.vim
let g:vimrplugin_screenplugin = 1
" Don't use conque shell if installed
let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R
let g:vimrplugin_map_r = 1
" see R documentation in a Vim buffer
let vimrplugin_vimpager = "no"
"set expandtab
set shiftwidth=4
set tabstop=8
" start R with F2 key
map <F5> <Plug>RStart
imap <F5> <Plug>RStart
vmap <F5> <Plug>RStart
" send selection to R with space bar
vmap <leader>t <Plug>RDSendSelection
" send line to R with space bar
nmap <leader>t <Plug>RDSendLine

if v:progname =~? "evim"
    finish
endif

"set autoindent   " always set autoindenting on
if has("vms")
    set nobackup   " do not keep a backup file, use versions instead
else
    set backup   " keep a backup file
endif
set history=50   " keep 50 lines of command line history
set showcmd    " display incomplete commands
set incsearch    " do incremental searching
set nowrap   " turns off text wrapping
set nospell    " turns on spell check for all files
" autocmd BufNewFile,BufRead *.txt,*.html,README set spell "turns on
" spell check only for specified files
set paste    " turns on traditional pasting of text
" set number     " turns line numbering on
" colorscheme hybrid  " sets color scheme
set ruler    " show the cursor position all the time

" Don't use Ex mode, use Q for formatting
map Q gq


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif



" }}}


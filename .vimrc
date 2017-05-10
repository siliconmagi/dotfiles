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
" Plug 'j5shi/ctrlp_delete.vim'
Plug 'junegunn/goyo.vim'
Plug 'mileszs/ack.vim'
" esc removes highlighting
map <esc> :noh<cr>Plug 'mtth/scratch.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
" Plug 'vim-syntastic/syntastic'
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
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-j>
nnoremap <c-h> <c-w><c-h>

" jk escaping
inoremap jk <esc>

" Fix movement around soft-wrapped lines
nnoremap j gj
nnoremap k gk

" Move multiple lines with shift and ctrl
noremap J 5j
noremap K 5k
noremap <C-k> 10k
noremap <C-j> 10j

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" esc removes highlighting
map <esc> :noh<cr>

" Send chars deleted with 'x' to black hole
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
nnoremap <silent> <C-q> :wq<CR>

" Quit all buffers
nnoremap <silent> <C-w> :wqa<CR>

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

" YCM
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_rust_src_path = '/home/zeal/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_min_num_of_chars_for_completion = 1

" CTRL-e to toggle tree view with CTRL-t
nmap <silent> <C-e> :NERDTreeToggle<CR>
" Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR>

" ,f to format code, requires formatters: read the docs
noremap <leader>f :Autoformat<CR>
" init dictionary
let g:lmap =  {}
let g:lmap.f = { 'name' : 'Format file' }

" }}}

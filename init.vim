"silicon magi neovim init.vim"
" Setup dein  ---------------------------------------------------------------{{{
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))
call dein#add('Shougo/dein.vim')
call dein#add('junegunn/fzf.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('neovim/node-host', {'build': 'npm install'})
call dein#add('haya14busa/dein-command.vim')

" syntax
call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'})
call dein#add('othree/jsdoc-syntax.vim', {'on_ft':['javascript', 'typescript']})
call dein#add('heavenshell/vim-jsdoc', {'on_ft':['javascript', 'typescript']})
call dein#add('moll/vim-node', {'on_ft':['javascript', 'typescript']})
call dein#add('elzr/vim-json', {'on_ft': 'json'})
" call dein#add('pangloss/vim-javascript', {'on_ft': 'javascript'})
call dein#add('mxw/vim-jsx', {'on_ft': 'javascript'})

call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css','scss']})
call dein#add('ap/vim-css-color', {'on_ft': ['css', 'scss', 'yaml']})

call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
" call dein#add('jtratner/vim-flavored-markdown', {'on_ft': 'markdown'})
call dein#add('dhruvasagar/vim-table-mode')
" call dein#add('suan/vim-instant-markdown')
call dein#add('vimlab/mdown.vim', {'build': 'npm install'})
call dein#add('nelstrom/vim-markdown-folding')
call dein#add('tyru/markdown-codehl-onthefly.vim')

call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})
call dein#add('HerringtonDarkholme/yats.vim', {'on_ft': ['typescript']})
call dein#add('tmux-plugins/vim-tmux')

call dein#add('Yggdroot/indentLine')
call dein#add('itmammoth/doorboy.vim')
call dein#add('valloric/MatchTagAlways', {'on_ft': 'html'})

call dein#add('tpope/vim-fugitive')
call dein#add('jreybert/vimagit')
call dein#add('airblade/vim-gitgutter')
call dein#add('scrooloose/nerdtree')

" call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('tpope/vim-repeat')

call dein#add('neomake/neomake')

call dein#add('majutsushi/tagbar')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('AndrewRadev/switch.vim')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('tpope/vim-surround')
" call dein#add('tomtom/tcomment_vim')
call dein#add('scrooloose/nerdcommenter')
call dein#add('mattn/emmet-vim')
call dein#add('Chiel92/vim-autoformat')
call dein#add('Shougo/vimfiler')
call dein#add('flazz/vim-colorschemes')
call dein#add('hecal3/vim-leader-guide')

" deoplete stuff
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Quramy/tsuquyomi')
call dein#add('Shougo/deoplete.nvim')
call dein#add('ternjs/tern_for_vim', {'build': 'npm install'})
call dein#add('carlitux/deoplete-ternjs')
call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
call dein#add('Shougo/neoinclude.vim')
call dein#add('ujihisa/neco-look', {'on_ft': ['markdown','text','html']})
call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})
call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
call dein#add('Konfekt/FastFold')

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('honza/vim-snippets')
call dein#add('matthewsimo/angular-vim-snippets')

call dein#add('mhinz/vim-sayonara')
call dein#add('mattn/webapi-vim')
call dein#add('mattn/gist-vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('vim-scripts/SyntaxRange')

call dein#add('tyru/open-browser.vim')
call dein#add('ryanoasis/vim-devicons')
" call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

call dein#add('jordwalke/flatlandia')
call dein#add('trevordmiller/nova-vim')

call dein#add('junegunn/vim-easy-align')
if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()
filetype plugin indent on
" }}}

" setup python interpreter {{{
let g:python_host_prog = '/home/xeno/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/xeno/.pyenv/versions/neovim3/bin/python'
" }}}

" Basics {{{

" Use deoplete.
let g:deoplete#enable_at_startup = 1

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

" Copy / Paste to / from clipboard
xnoremap <c-c> "+y
nnoremap <c-p> "+p
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
colorscheme antares
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
" }}}

" Abbreviations {{{

" iabbrev (c)
" iabbrev (c)
iabbrev @@ siliconmagi@yandex.com

" }}}

" Augroup {{{

augroup Vimrc
  au!
  " Set filetypes
  au BufRead,BufNewFile *.{vue,es6,es6.erb} setfiletype javascript
  au BufRead,BufNewFile *.{jscs,jshint,eslint}rc setfiletype json
  au BufRead,BufNewFile *.md setfiletype markdown
  au BufRead,BufNewFile *.vue set filetype=html
  " autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

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

" autoformat {{{
" ,f to format code, requires formatters: read the docs
noremap <leader>f :Autoformat<CR>

" autoformat verbose mode
let g:autoformat_verbosemode=1

" }}}

" linting {{{
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_in_file=1  " show
" }}}

" airline {{{
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

" Folding {{{
" space open/closes folds
" leader space closes all folds but the current one
nnoremap <space> za
nnoremap <leader><space> zMzO

" }}}

" Deoplete {{{

" force python 3 for jedi
let g:jedi#force_py_version = 3

" autostart Deoplete
let g:deoplete#enable_at_startup = 1

let g:deoplete#omni_patterns = {}

" autocomplete on just about any character
let g:deoplete#omni_patterns.go = '[a-zA-Z_\.]{3,}'

" tab for cycling through options
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" enter closes options if present and inserts linebreak
" apparently this has to be that complicated
inoremap <silent> <CR> <C-r>=<SID>close_and_linebreak()<CR>
function! s:close_and_linebreak()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

call deoplete#custom#set('buffer', 'mark', 'buffer')
call deoplete#custom#set('javascript', 'mark', '')
call deoplete#custom#set('typescript', 'mark', '')
call deoplete#custom#set('omni', 'mark', 'omni')
call deoplete#custom#set('file', 'mark', 'file')

function! Preview_func()
	if &pvw
		setlocal nonumber norelativenumber
	endif
endfunction
autocmd WinEnter * call Preview_func()
" }}}

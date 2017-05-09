"silicon magi neovim init.vim"

" Setup vim-plug  ---------------------------------------------------------------{{{

call plug#begin('~/.vim/plugged')

" Plug 'junegunn/fzf.vim'
" Plug 'Shougo/neomru.vim'
" Plug 'neovim/node-host', {'do': 'npm install'}
" Plug 'neomake/neomake'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" syntax
" Rust
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

" Postgresql
Plug 'lifepillar/pgsql.vim'

" Fish Shell
Plug 'dag/vim-fish'

" vue
Plug 'dNitro/vim-pug-complete'
Plug 'digitaltoad/vim-pug'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim'
" declare vue as type html to enable autoformat
au BufRead,BufNewFile *.vue set filetype=html

"javascript
" Plug 'mxw/vim-jsx', {'for': 'javascript'}
" Plug 'fleischie/vim-styled-components'
" Plug 'editorconfig/editorconfig-vim'
Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug 'othree/jsdoc-syntax.vim', {'for': 'javascript'}
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'elzr/vim-json', {'for': 'json'}

"css
Plug 'hail2u/vim-css3-syntax', {'for':['css','scss']}
Plug 'ap/vim-css-color'

" markdown
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'vimlab/mdown.vim', {'do': 'npm install'}
Plug 'tyru/markdown-codehl-onthefly.vim'
Plug 'stephpy/vim-yaml', {'for': 'yaml'}

" folding and tagging
Plug 'Konfekt/FastFold'
Plug 'nelstrom/vim-markdown-folding'
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'Yggdroot/indentLine'
Plug 'itmammoth/doorboy.vim'
Plug 'valloric/MatchTagAlways', {'for': ['html', 'vue']}

" git wrapper, nerdtree, tagbar
" Plug 'tpope/vim-fugitive'
" Plug 'jreybert/vimagit'
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

" formatting
" Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
" Plug 'mattn/emmet-vim'
Plug 'Chiel92/vim-autoformat'
" install js-beautify https://github.com/beautify-web/js-beautify for vuejs
" autoformat support

call plug#end()
" }}}

" System Settings  ----------------------------------------------------------{{{
" Enable filetype functionality
filetype plugin indent on

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" enable fold
set foldenable
" space open/closes folds
nnoremap <space> za

" highlight last inserted text
nnoremap gV `[v`]

" gundo graphical undo
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" CtrlP settings
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_user_command = 'rg'

" CtrlP with ripgrep
" if executable('rg')
" set grepprg=rg\ --color=never
" let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
" let g:ctrlp_use_caching = 0
" endif

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

" fish shell syntax options
" Set up :make to use fish for syntax checking.
autocmd FileType fish compiler fish

" Set this to have long lines wrap inside comments.
autocmd FileType fish setlocal textwidth=79

" Enable folding of block structures in fish.
autocmd FileType fish setlocal foldmethod=expr

" enable colors: preq for airline, lightline
set t_Co=256

" mouse support
set mouse=a

" autoreload when files change
set autoread
au CursorHold * checktime

" Rust
set hidden
let g:racer_cmd = "/home/oak/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" Postgresql
let g:sql_type_default = 'pgsql'

" YCM
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_rust_src_path = '/home/zeal/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_min_num_of_chars_for_completion = 1

" Nerd tree
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror

" CTRL-t to toggle tree view with CTRL-t
nmap <silent> <C-e> :NERDTreeToggle<CR>
""Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR>

" allow backspace to work in insert mode
set backspace=indent,eol,start

" cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

" auto reload changes
:set autoread

" fix font neovim update
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

" Relative numbering
set relativenumber

" yank copies to global clipboard
set clipboard=unnamedplus

" nerd comment
let g:NERDSpaceDelims = 1

" Let airline tell me my status
set noshowmode
set noswapfile
filetype on
set number
set tabstop=2 shiftwidth=2 expandtab
set conceallevel=0

" block select not limited by shortest line
set virtualedit=
set wildmenu
set laststatus=2
set wrap linebreak nolist
set wildmode=full

" leader is ,
let mapleader = ','

" undo files
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"

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

" System mappings  ----------------------------------------------------------{{{
" init dictionary
let g:lmap =  {}

" Save
nnoremap <silent> <C-s> :w<CR>

" Quit single buffer
nnoremap <silent> <C-q> :q<CR>

" Quit all buffers
nnoremap <silent> <C-w> :qa<CR>

" Next tab
nnoremap <silent> <tab> :tabn<CR>

" Previous tab
nnoremap <silent> <s-tab> :tabp<CR>


" open empty file in new buffer
nnoremap <silent> <A-S-n> :vnew<CR>
nnoremap <silent> <A-S-e> :vsp<space>

" Make go to file create the file, if not existent
nnoremap <silent> <leader>gf :e<cfile><CR>
nnoremap <silent> <C-w><c-f> :vsp +e<cfile><CR>
nnoremap <silent> <C-w>gf :tabe<cfile><CR>

" No need for ex mode
nnoremap Q <nop>
vnoremap // y/<C-R>"<CR>

" recording macros is not my thing
map q <Nop>

" Navigate between display lines
noremap  <silent> <Up>   gk
noremap  <silent> <Down> gj
noremap  <silent> k gk
noremap  <silent> j gj
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End> <C-o>g<End>

" copy current files path to clipboard
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" ,f to format code, requires formatters: read the docs
noremap <leader>f :Autoformat<CR>
let g:lmap.f = { 'name' : 'Format file' }

" Vim default formatting
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0

" verbose autoformat
" let g:autoformat_verbosemode=1

" highlight code
noremap H ^
noremap L g_

" shift jk move 5 lines, ctrl jk move 10 lines
noremap J 5j
noremap K 5k
noremap <C-k> 10k
noremap <C-j> 10j

" Copy to ubuntu clipboard
vnoremap <C-c> "+y<CR>
vnoremap y myy`y
vnoremap Y myY`y"

" Start interactive EasyAlign in visual mode (e.g. vipga)
" https://github.com/junegunn/vim-easy-align
" xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" esc removes highlighting
map <esc> :noh<cr>
"}}}"

" Themes, Commands, etc  ----------------------------------------------------{{{
" Theme
" Enable syntax
syntax on
" Color schemes @ https://github.com/flazz/vim-colorschemes/tree/master/colors
" colorscheme luna
" }}}

" Javascript ----------------------------------------------------------------{{{
let g:tigris#enabled = 1
let g:tigris#on_the_fly_enabled = 1
let g:jsdoc_input_description = 1
let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0
" neomake keybindings for linting window
" nmap <Leader><Space>o :lopen<CR>      " open location window
" nmap <Leader><Space>c :lclose<CR>     " close location window
" nmap <Leader><Space>, :ll<CR>         " go to current error/warning
" nmap <Leader><Space>n :lnext<CR>      " next error/warning
" nmap <Leader><Space>p :lprev<CR>      " previous error/warning
" }}}

" NERDTree ------------------------------------------------------------------{{{

let NERDTreeMapJumpFirstChild = ''
map <silent> <F3> :NERDTreeToggle<CR>

" let g:WebDevIconsOS = 'Darwin'
autocmd StdinReadPre * let s:std_in=1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
"}}}

" fzf ----------------------------------------------------------------------{{{
" set rtp+=~/.fzf

" Search files really fast
" nnoremap <silent> <A-s> :Ag<CR>

" search open buffers
" nnoremap <silent> <A-h> :History:<CR>
" nnoremap <silent> <A-f> :Files ~<CR>
" nnoremap <silent> <A-b> :Buffers<CR>
" " Insert mode completion
" imap <leader><c-k> <plug>(fzf-complete-word)
" imap <leader><c-f> <plug>(fzf-complete-path)
" imap <leader><c-j> <plug>(fzf-complete-file-ag)
" imap <leader><c-l> <plug>(fzf-complete-line)

"}}}

" vim-airline ---------------------------------------------------------------{{{
let g:airline#extensions#tabline#enabled = 1
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
" let g:airline#extensions#neomake#error_symbol='✖ :'
" let g:airline#extensions#neomake#warning_symbol='⚠ :'
let g:airline_theme='wombat'
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'

"mappings

" Rust
" vim-racer enables C-x-C-o to search for completions and provides several <Plug> mappings for source code navigation
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

nmap <leader>t :term<cr>
nmap <leader>, :bnext<CR>
" tmap <leader>, <C-\><C-n>:bnext<cr>
nmap <leader>. :bprevious<CR>
" tmap <leader>. <C-\><C-n>:bprevious<CR>
let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
"}}}

"" vim:fdm=expr:fdl=0
"" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='

" Linting -------------------------------------------------------------------{{{
" let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}

" hi NeomakeError gui=undercurl

" Required for eslint to work with neomake
" let g:neomake_javascript_enabled_makers = ['eslint']

" use local version of eslint
" let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
" autocmd! BufWritePost * Neomake
"}}}

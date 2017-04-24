"silicon magi neovim init.vim"

" Setup vim-plug  ---------------------------------------------------------------{{{

call plug#begin('~/.local/share/nvim/plugged')
" Plug 'junegunn/fzf.vim'
Plug 'Shougo/neomru.vim'
Plug 'neovim/node-host', {'do': 'npm install'}
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'

" syntax
" rust
Plug 'racer-rust/vim-racer'

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
" Plug 'nelstrom/vim-markdown-folding'
Plug 'tyru/markdown-codehl-onthefly.vim'
Plug 'stephpy/vim-yaml', {'for': 'yaml'}

" folding and tagging
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
" Plug 'majutsushi/tagbar'

" formatting
" Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
" Plug 'mattn/emmet-vim'
Plug 'Chiel92/vim-autoformat'
" install js-beautify https://github.com/beautify-web/js-beautify for vuejs
" autoformat support

call plug#end()
" }}}

" System Settings  ----------------------------------------------------------{{{
filetype plugin indent on

" cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set encoding=utf-8
let TERM = "xterm-256color"

" auto reload changes
:set autoread

" fix font neovim update
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

" Neovim Settings relative numbering, clipboard
set relativenumber
set clipboard+=unnamedplus

" nerd comment
let g:NERDSpaceDelims = 1

" Let airline tell me my status
set noshowmode
set noswapfile
filetype on
set  number
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

" ctrl + s to save
nnoremap <silent> <C-o> :w<CR>

" ctrl + q to quit all buffers
nnoremap <silent> <C-p> :qa<CR>

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
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" verbose autoformat
let g:autoformat_verbosemode=1

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
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning
" }}}

" NERDTree ------------------------------------------------------------------{{{

let NERDTreeMapJumpFirstChild = ''
map <silent> <F3> :NERDTreeToggle<CR>

" let g:WebDevIconsOS = 'Darwin'
autocmd StdinReadPre * let s:std_in=1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=35
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

" Deoplete ------------------------------------------------------------------{{{
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

"multiple cursors
" function! Multiple_cursors_before()
	" let b:deoplete_disable_auto_complete=2
" endfunction
" function! Multiple_cursors_after()
	" let b:deoplete_disable_auto_complete=0
" endfunction

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
"}}}

" vim-airline ---------------------------------------------------------------{{{
let g:airline#extensions#tabline#enabled = 1
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#neomake#error_symbol='✖ :'
let g:airline#extensions#neomake#warning_symbol='⚠ :'
let g:airline_theme='luna'
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'

"mappings
nmap <leader>t :term<cr>
nmap <leader>, :bnext<CR>
tmap <leader>, <C-\><C-n>:bnext<cr>
nmap <leader>. :bprevious<CR>
tmap <leader>. <C-\><C-n>:bprevious<CR>
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

" Linting -------------------------------------------------------------------{{{
let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}

hi NeomakeError gui=undercurl

" Required for eslint to work with neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" use local version of eslint
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
autocmd! BufWritePost * Neomake
"}}}

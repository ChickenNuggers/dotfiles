filetype plugin indent on
syntax on

set clipboard=unnamed " use + register
set hidden " don't nuke buffer when not displayed
set wildmenu " wildcard menu displayed when tab completing
set path+=** " glob current directory into path
set showcmd " show the current command being typed in
set hlsearch " turn on highlighting when searching via /
set ignorecase " ignore the case when searching
set smartcase  " ^ unless there's an uppercase in the pattern
set backspace=indent,eol,start " text-editor-like backspacing
set autoindent " obviously automatically indents
set nostartofline " use actual start of the line
set ruler " show line and column in bottom right
set laststatus=2 " keep status window when editing with multiple windows
set confirm " add confirmation text to errors in :q :e et cetera
set visualbell
set mouse=a " allow using the mouse when in normal, visual, insert, & cmdline
set cmdheight=2 " set height of command input to two to show status bar?
set number cursorcolumn relativenumber cc=80 cul " line numbers and crosshairs
set modeline " allows support for modeline (vim:set noet sts=0 sw=8 ts=0 tw=8:)
set notimeout ttimeout ttimeoutlen=200 " timeout after .2 seconds on key combos
set pastetoggle=<F11> " toggle paste! via this key
set foldmethod=syntax foldnestmax=1
" set noet sts=0 ts=4 tw=78

" Automatically place quotes
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
" Color overrides
 let g:jellybeans_overrides = { 'VertSplit': { 'guifg': '262626', 'guibg': '262626', 'attr': '', 'ctermfg': '235', 'ctermbg': '235' } }
let g:lightline = {'colorscheme': 'jellybeans'}

map Y y$

nnoremap <C-L> :nohl<CR>
nnoremap <C-S> :w<CR>
nnoremap <C-Q> :qa<CR>
nnoremap ,, <C-W><C-W>
nnoremap <space> za
inoremap <C-S> <C-O>:w<CR>
inoremap <C-Q> <C-O>:qa<CR>
inoremap jj <ESC>
inoremap jk <C-O>
inoremap <C-K> <C-O>dd
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

filetype off                  " required

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" show invisibles
set listchars=tab:▸\ ,eol:¬ " shows whitespace
nmap <leader>l :set list!<CR>
set list " shows whitespace via chars

" Syntax highlighting
set background=dark
colorscheme jellybeans

filetype plugin indent on

" UltiSnips configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger=",,"
let g:UltiSnipsJumpForwardTrigger="nn"
let g:UltiSnipsJumpBackwardTrigger="pp"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" UltiSnips filetype automatic
autocmd FileType * exec 'UltiSnipsAddFiletypes ' . expand('<amatch>')

augroup filetype_lua
	autocmd!
	autocmd FileType lua setlocal iskeyword+=.
augroup END

" NERDTree tree
autocmd StdinReadPre * let s:std_in=1

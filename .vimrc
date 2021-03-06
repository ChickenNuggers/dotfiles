syntax on

set hidden                              " don't nuke buffer when not displayed
set wildmenu                            " wildcard menu displayed when tab completing
set path=.,**                           " glob current directory into path
set showcmd                             " show the current command being typed in
set hlsearch                            " turn on highlighting when searching via /
set ignorecase                          " ignore the case when searching
set smartcase                           " ^ unless there's an uppercase in the pattern
set backspace=indent,eol,start          " text-editor-like backspacing
set autoindent                          " obviously automatically indents
set nostartofline                       " use actual start of the line
set ruler                               " show line and column in bottom right
set laststatus=2                        " keep status window when editing with multiple windows
set confirm                             " add confirmation text to errors in :q :e et cetera
set visualbell                          " use a visual screen flash instead of beep
set mouse=a                             " allow using the mouse when in normal, visual, insert, & cmdline
set cmdheight=2                         " set height of command input to two to show status bar?
set number relativenumber cc=80         " line numbers and 80 char limit
set cursorcolumn cursorline             " crosshairs for cursor
set modeline                            " allows support for modeline (vim:set noet sts=0 sw=8 ts=0 tw=8:)
set notimeout ttimeout ttimeoutlen=200  " timeout after .2 seconds on key combos
set clipboard^=unnamedplus              " set clipboard to yank to system clipboard
set pastetoggle=<Leader>p               " toggle paste! via this key

nnoremap Y y$
nnoremap <C-L> :nohl<CR>
nnoremap <C-S> :w<CR>
nnoremap <C-Q> :qa<CR>
nnoremap ,, <C-W><C-W>
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
nnoremap <Space> za
nnoremap <Leader>t :TagbarToggle<CR>
inoremap ,s <C-O>:w<CR>
inoremap ,q <C-O>:qa<CR>
inoremap jj <ESC>
inoremap jk <C-O>
inoremap ,k <C-O>dd
imap ,n <Plug>vim_completes_me_forward
imap ,p <Plug>vim_completes_me_backward

let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<': '>'}
let g:lightline = {'colorscheme': 'gruvbox'}

let g:netrw_winsize = -28
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'

autocmd vimenter * Lexplore | wincmd l | TagbarToggle
autocmd bufenter * if (winnr("$") == 2 && (&ft ==# "netrw" || &ft ==# "tagbar")) | qa | endif

let g:easytags_async = 1

let g:ctrlp_map = ',p'

let g:vcm_default_maps = 0 " see imap ,n | ,p

let g:UltiSnipsExpandTrigger=",,"
let g:UltiSnipsJumpForwardTrigger="nn"
let g:UltiSnipsJumpBackwardTrigger="pp"

filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on

set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>
set list

set background=dark
colorscheme gruvbox

hi Normal ctermbg=none

let g:UltiSnipsEditSplit="vertical"
autocmd FileType * exec 'UltiSnipsAddFiletypes ' . expand('<amatch>')

augroup filetype_lua
	autocmd!
	autocmd FileType lua setlocal iskeyword+=.
	autocmd FileType lua setlocal iskeyword+=:
augroup END

set exrc secure " per-project RC files

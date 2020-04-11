filetype off                  " required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle') " Calls vundle to use plugins

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'morhetz/gruvbox' " Colorscheme
Plugin 'haya14busa/incsearch.vim' " Better searching
Plugin 'christoomey/vim-tmux-navigator' " tmux window pane navigation
Plugin 'airblade/vim-gitgutter' " Shows changes from master on vim sidebar
Plugin 'vim-airline/vim-airline' " Airline setup
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim' " File manager
Plugin 'tpope/vim-surround' " Modifying quotes/brackets, etc
Plugin 'tpope/vim-commentary' " Commenting lines
Plugin 'w0rp/ale' "Linter
Plugin 'powerman/vim-plugin-viewdoc' " Documentation viewer
Plugin 'ludovicchabant/vim-gutentags' " Tags plugin
" Code completion
Plugin 'roxma/nvim-completion-manager'
if !has('nvim')
    Plugin 'roxma/vim-hug-neovim-rpc'
endif


" All of your Plugins must be added before the following line
call vundle#end()            " end of vundle plugins
filetype plugin indent on    " enables filetype detection, plugin, and indentation scripts

" Setting the leader key
let mapleader ="\<space>"

" NOTE: 'noremap' makes the mapping nonrecursive (which is good to avoid
" conflicts and mapping infinite loops. 'n' or 'i' specifies the mode
" Maps 'ev' to open vimrc for edit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Maps 'sv' to reload vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Maps '-' to delete the current line and paste it directly below
noremap <leader>- ddp
" Maps '_' to delete the current line and paste it directly after
noremap <leader>_ ddkP
" Maps " to surround a word with double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" Maps ' to surround a word with single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" Maps the window navigation commands such that you do not need to press <C-W>
" to use them
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>

" Mappings to ensure tab selects completion option
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Mapping for ALE to fix with F8
nmap <F8> <Plug>(ale_fix)

" System settings
augroup formatting
    autocmd!
    autocmd BufEnter * setlocal 
                \ formatoptions=t,c,q,j
                \ formatoptions-=cro 
    " t = wrap text using textwidth
    " c = wrap comments using textwidth
    " q = allow formatting of comments with 'gq'
    " j = remove comment character when joining comment lines
augroup END

set timeoutlen=1000 " Used to increase vim responsiveness
set ttimeoutlen=0
set backspace=indent,eol,start " Proper backspace behavior.
set ignorecase " Case insensitive searching
set smartcase " but become case sensitive if you type uppercase characters

" General file settings
set autoindent " Carry the indent to the next line
set textwidth=79 " How many characters per line
set expandtab " Turns tabs to spaces
set tabstop=4 " A tab counts for 4 spaces
set softtabstop=4 " Not sure but set it anyways
set shiftwidth=4 " Sets '>>' and '<<' to indent 4 spaces

" Visual stuff
set number " Line numbers
set background=dark " Use colors that look good on a dark background
syntax enable " Turns on syntax highlighting
set laststatus=2 " Always display statusline
set incsearch " search as characters are entered
set showmatch " shows matching bracket

" Colorscheme
colorscheme gruvbox

" Tmux cursor compatability settings
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Plugin specific settings

" Enable incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1 " Shows git branch
let g:airline#extensions#ale#enabled = 1 " Shows ale warnings

" Ale settings
let g:ale_sign_column_always = 1 " Keeps gutter on
" Makes error signs more pleasant
let g:ale_sign_warning='●'
hi ALEErrorSign ctermfg=red ctermbg=none
let g:ale_sign_error='●'
hi ALEWarningSign ctermfg=yellow ctermbg=none
" Custom linting/fixing settings
let g:ale_fixers = {
\    'python': [
\        'remove_trailing_lines',
\        'trim_whitespace',
\        'yapf'
\    ],
\     'javascript': [
\        'remove_trailing_lines',
\        'trim_whitespace',
\        'eslint'
\    ]            
\}

" TODO: So that gq will properly fix python lines (not put on multiple lines
" without accounting for expressions)

set number
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Indentation plugin
Plugin 'vim-scripts/indentpython.vim'

" Autocomplete plugins
Plugin 'ervandew/supertab'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-completion-manager' "Wrapper for vim instead of neovim

" Syntax plugin
Plugin 'w0rp/ale'

" Color scheme
Plugin 'w0ng/vim-hybrid'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tomasr/molokai'
Plugin 'jnurmine/Zenburn'

" Airline setup
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Whitespace plugin
Plugin 'ntpeters/vim-better-whitespace'

" File manager
Plugin 'ctrlpvim/ctrlp.vim'

" Git plugins
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <silent><C-l> :nohlsearch<CR><C-l>

" Style stuff

" BetterWhitespace Settings
" Don't highlight for curr line
au BufEnter * CurrentLineWhitespaceOff hard
" Strips whitespace on save
au BufEnter * EnableStripWhitespaceOnSave

" General file settings
au BufNewFile,BufRead *
    \ set autoindent |
    \ set fileformat=unix |
    \ set tw=79 |
    \ set expandtab |
    \ set formatoptions+=tcq
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
au BufNewFile,BufRead *.js, *.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Allowing copypaste from regular clipboard
set clipboard=unnamed

" Visual stuff
syntax enable
set background=dark
colorscheme jellybeans
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#branch#enabled=1 " Shows git branch in statusbar
let g:ale_lint_delay=1000 " Lint after a delay

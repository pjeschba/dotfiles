" TODO: So that gq will properly fix python lines (not put on multiple lines
" without accounting for expressions)

" Get gutentags working!

set number
set nocompatible              " required
set hidden " Hides buffers instead of closing them
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
Plugin 'roxma/vim-hug-neovim-rpc' "Wrapper for vim instead of neovim
Plugin 'roxma/nvim-completion-manager'
Plugin 'roxma/clang_complete' " C/C++ autocompletion
Plugin 'roxma/nvim-cm-tern',  {'do': 'npm install'} " Javascript autocompletion
Plugin 'jiangmiao/auto-pairs' " Autopairing for brackets, quotes, etc

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' " Default snippets for some languages

" Tags plugin
Plugin 'ludovicchabant/vim-gutentags'

" Syntax plugin
Plugin 'w0rp/ale'

" Color scheme
Plugin 'w0ng/vim-hybrid'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tomasr/molokai'
Plugin 'jnurmine/Zenburn'
Plugin 'tomasiser/vim-code-dark'

" Airline setup
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Whitespace plugin
Plugin 'ntpeters/vim-better-whitespace'

" File manager
Plugin 'ctrlpvim/ctrlp.vim'

" Git plugins
Plugin 'tpope/vim-fugitive' " Interface to execute git commands w/in vim
Plugin 'airblade/vim-gitgutter' " Shows changes from master on vim sidebar

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
" au BufEnter * EnableStripWhitespaceOnSave

" General file settings
" tells completion manager where clang is for cpp completion
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

au BufNewFile,BufRead *
    \ set autoindent |
    \ silent! set fileformat=unix | " Silent in case it's read only
    \ set tw=79 |
    \ set expandtab |
    \ set formatoptions+=t,c,r,o,q,w,a
au BufNewFile,BufRead *.py,*.cpp,*.h
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4
au BufNewFile,BufRead *.js,*.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Allowing copypaste from regular clipboard
set clipboard=unnamed

" Visual stuff
syntax enable
set background=dark
colorscheme codedark
let g:airline_theme='codedark'
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#branch#enabled=1 " Shows git branch in statusbar
let g:ale_lint_delay=1000 " Lint after a delay

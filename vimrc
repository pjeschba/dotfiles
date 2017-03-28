" TODO: So that gq will properly fix python lines (not put on multiple lines
" without accounting for expressions)
" 2. Bind ALENextWrap and ALEPreviousWrap to shortcutted key bindings


set number " Line numbers
set nocompatible              " required
set hidden " Hides buffers instead of closing them
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle') " Calls vundle to use plugins

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Indentation plugin
Plugin 'vim-scripts/indentpython.vim'

" Autocomplete plugins
" Plugin 'ervandew/supertab'
Plugin 'roxma/vim-hug-neovim-rpc' "Wrapper for vim instead of neovim
Plugin 'roxma/nvim-completion-manager'
Plugin 'roxma/clang_complete' " C/C++ autocompletion
Plugin 'roxma/nvim-cm-tern',  {'do': 'npm install'} " Javascript autocompletion

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
call vundle#end()            " end of vundle plugins
filetype plugin indent on    " enables filetype detection, plugin, and indentation scripts

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

" File settings
" tells completion manager where clang is for cpp completion
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" General settings
autocmd BufNewFile,BufRead * call GenericOptions()
function GenericOptions()
	set autoindent
	set formatoptions=t,c,r,q
	silent! set fileformat=unix " Silent in case it's read only
	set tw=79
	set expandtab
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
endfunction
" Filetype specific settings
au BufNewFile,BufRead *.js,*.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
" Opens any file with doc in it in a vertical split
augroup helpfiles
    au!
    au BufRead,BufEnter */doc/* wincmd L
augroup END

" Sets vim clipboard to be the same as the system clipboard
" Lets you copy/paste into vim and vice versa
set clipboard=unnamed

" Visual stuff
syntax enable
set background=dark
colorscheme jellybeans
let g:ale_sign_column_always = 1 " Makes ale linting gutter always on
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#branch#enabled=1 " Shows git branch in statusbar
" let g:ale_lint_delay=1000 " Lint after a delay

" Nvim completion settings
" don't give |ins-completion-menu| messages.  For example,
" '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
set shortmess+=c
" Tab completion for vim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

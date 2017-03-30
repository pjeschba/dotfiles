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
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'

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

" Sets vim clipboard to be the same as the system clipboard
" Lets you copy/paste into vim and vice versa
set clipboard=unnamed

" General file settings
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

" Search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <silent><C-l> :nohlsearch<CR><C-l>

" Visual stuff
syntax enable
set background=dark
colorscheme jellybeans
set laststatus=2 " Always display statusline

" BetterWhitespace Settings
" Don't highlight for curr line
au BufEnter * CurrentLineWhitespaceOff hard

" Airline Settings
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1 " Shows git branch in statusbar

" Ale settings
let g:ale_sign_column_always = 1 " Makes ale linting gutter always on
let g:ale_lint_delay = 2000 " Lint after a delay

" YCM Settings
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" So YCM knows where our compiler flag file is
let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data   = [ '&filetype' ]
" So YCM knows where to find libclang
let g:clang_library_path ='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
" Close the preview (docs) window after autocompleting.
let g:ycm_autoclose_preview_window_after_completion = 1
" Also close it when leaving insert mode, so that it doesn't stay open 24/7
let g:ycm_autoclose_preview_window_after_insertion = 1

" UltiSnips settings
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

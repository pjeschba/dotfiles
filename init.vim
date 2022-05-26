set number " Line numbers
set hidden " Hides buffers instead of closing them
set visualbell " So I don't have to hear the beep noise
" Maps both completion types to language server
" set omnifunc=LanguageClient#complete
" set completefunc=LanguageClient#complete
set incsearch " Search as I type
" Case sensitive if there's a capital letter, otherwise its not
set ignorecase
set smartcase
set list " Show visible whitespace
" Pretties up what whitespace chars look like
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" NOTE: 'noremap' makes the mapping nonrecursive (which is good to avoid
" conflicts and mapping infinite loops"
" Maps '-' to delete the current line and paste it directly below
noremap - ddp
" Maps '_' to delete the current line and paste it directly after
noremap _ ddkP
" Maps <c-u> to uppercase current word in insert mode
inoremap <c-u> <esc>viwU

" Maps the window navigation commands such that you do not need to press <C-W>
" to use them
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Setting the leader key
let mapleader = " "

" Getting rid of netrw banner
let g:netrw_banner = 0
" tree-view for netrw
let g:netrw_liststyle = 3

" Clearing search
nnoremap <silent> <leader>l :let @/=""<cr>

" Opening netrw
nnoremap <silent> <leader>o :Explore<cr>

" Moves weird vim delete functionality to 'm' key
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')
" Language client
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Fuzzy selection
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Color Scheme
Plug 'romainl/Apprentice'

" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'

" Commenter plugin
Plug 'tpope/vim-commentary'

" Shows git diff in the sign column
Plug 'airblade/vim-gitgutter'

" Vim session plugin (used with tmux to save where you left off"
Plug 'tpope/vim-obsession'

" Enables the use of `.` with plugin mappings - used for gitgutter hunk navigation
Plug 'tpope/vim-repeat'

" Makes delete actually delete
Plug 'svermeulen/vim-cutlass'

call plug#end()

" Colorscheme
colorscheme apprentice

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>y <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <leader>m <Plug>(coc-rename)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"fzf mappings
"Search filenames
nnoremap <c-p> :FZF<cr>
"Search file contents
nnoremap <leader>f :Ag<cr>
"Search open files
nnoremap <leader>b :Buffers<cr>

" General file settings
autocmd BufNewFile,BufRead * call GenericOptions()
function! GenericOptions()
	set autoindent
	set formatoptions=t,c,r,q
	silent! set fileformat=unix " Silent in case it's read only
	set tw=79
	set expandtab
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
endfunction
" Js/HTML specific settings to use reduced spacing
au BufNewFile,BufRead *.js,*.html,*.less,*.css,*.json,*.ts,*.jsx,*.tsx
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
au BufNewFile,BufRead *.html
    \ set formatoptions-=t
" Makefile specific settings to use tabs instead of spaces
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif
if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif

augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter [/\?] :set hlsearch " When you enter the cmdline with either of these characters, highlight all matches
  autocmd CmdlineLeave [/\?] :set nohlsearch " When you leave, stop highlighting
augroup END

set rtp+=/usr/local/opt/fzf

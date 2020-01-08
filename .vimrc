" --------------------------------------------------------------------
" VANILLA
" --------------------------------------------------------------------

let mapleader =","                   " Set the map leader to ','.
set shell=/bin/zsh                   " Set the default shell to zsh.

filetype plugin on                   " Enable recognition of file types.
syntax on                            " Enable syntax highlighting.

set mouse=a                          " Turn on mouse support.
set ignorecase                       " Ignore cases in searching.

set autoindent                       " Auto indentation.
set breakindent                      " Keep indentation when wrapping.
set wrap linebreak                   " Nice line wrapping with words.
set display=lastline                 " Show parts of a wrapped line not @'s.

filetype plugin indent on            " Enable changing of tabs.
set tabstop=4 shiftwidth=4           " Set the tabsize to 4.

set number relativenumber            " Use relative line numbers.
highlight LineNr ctermfg=grey        " Set a nice color for line numbers.
highlight clear SignColumn           " No color for the sign column.

highlight clear SpellCap             " Clear the highlight color.
highlight clear SpellBad             " Clear the highlight color.
highlight SpellCap ctermbg=Yellow    " Highlighting color for misspelled words.
highlight SpellBad ctermbg=DarkGrey  " Highlighting color for misspelled words.

" Start with a block cursor and leave with a beam cursor.
au VimEnter * silent exec "! echo -ne '\e[1 q'"
au VimLeave * silent exec "! echo -ne '\e[5 q'"
" Leaving insert mode will instantly change the cursor to a beam.
au InsertEnter * set timeoutlen=0
au InsertLeave * set timeoutlen=1000
" Change the cursor when changing the mode.
au InsertEnter * silent exec "! echo -ne '\e[5 q'"
au InsertLeave * silent exec "! echo -ne '\e[1 q'"

" Automatic closing bracket generation.
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Set all kinds of format options, see `:h fo-table`.
set textwidth=80
au FileType *       setlocal formatoptions-=ro
au FileType *       setlocal formatoptions+=c1j
au FileType tex     setlocal formatoptions+=tn
au FileType haskell setlocal shiftwidth=2 tabstop=2 expandtab

" Run make, open corresponding PDF and run shellcheck.
map <leader>m :!make<CR>
map <leader>p :!open-pdf %<CR><CR>
map <leader>s :!shellcheck -x %<CR>

" Shortcut for saving, sudo saving, showing whitespace and set columns to 80.
map <leader>l     :set invlist<CR>
map <leader>zc    :set columns=80<CR>
map <leader>w     :w<CR>
map <leader><S-w> :w !sudo tee > /dev/null %<CR><CR>

" Remap shortcuts for moving around in windows.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Auto markdown to pdf on save, auto restart sxhkd and auto restart shortcuts.
au BufWritePost *.md silent !mdtopdf % &
au BufWritePost sxhkdrc !killall sxhkd; sxhkd 2> /dev/null &\!
au BufWritePost ~/.config/shortcuts/bmdirs,~/.config/shortcuts/bmfiles !shortcuts

" --------------------------------------------------------------------
" PLUGINS
" --------------------------------------------------------------------

" Auto install Vim-Plug if not available.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged') " Specify directory for plugins.
	Plug 'ntpeters/vim-better-whitespace' " Whitespace cleaning like a pro.
	Plug 'scrooloose/nerdcommenter'       " Toggle comments: <leader>c<space>.
	Plug 'farmergreg/vim-lastplace'       " Remember the last position.
	Plug 'airblade/vim-gitgutter'         " Show git status in the file.
	Plug 'scrooloose/nerdtree'            " Tree file system explorer.
call plug#end()

" Mapping for NerdTree.
map <leader>t :NERDTree<CR>

" Setting for git gutter.
set updatetime=500

" Settings for better whitespace.
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:better_whitespace_enabled=1
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1

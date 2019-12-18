let mapleader =","                   " Set the map leader to ','.
set shell=/bin/zsh                   " Set the default shell to zsh.

filetype plugin on                   " Enable recognition of file types.
syntax on                            " Enable syntax highlighting.

set mouse=a                          " Turn on mouse support.
set ignorecase                       " Ignore cases in searching.

set autoindent                       " Auto indentation.
set breakindent                      " Keep indentation when wrapping.
set wrap linebreak                   " Nice line wrapping with words.
set display=lastline                 " Show parts of a wrapped line not just @'s.

" Auto soft line wrapping at 80 columns for some file types.
autocmd FileType   tex,markdown set columns=80
autocmd VimResized *.tex,*.md   set columns=80

filetype plugin indent on            " Enable changing of tabs.
set tabstop=4 shiftwidth=4           " Set the tabsize to 4.

set number relativenumber            " Use relative line numbers.
highlight LineNr ctermfg=grey        " Set a nice color for line numbers.
highlight clear SignColumn           " No color for the sign column.

highlight clear SpellCap             " Clear the highlight color.
highlight clear SpellBad             " Clear the highlight color.
highlight SpellCap ctermbg=Yellow    " Highlighting color for misspelled words.
highlight SpellBad ctermbg=DarkGrey  " Highlighting color for misspelled words.

" Automatic closing bracket generation.
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" No auto commenting, set tabs to spaces and tabsize to 2 for sh and Haskell.
autocmd FileType *       setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType haskell setlocal shiftwidth=2 tabstop=2 expandtab

" Run make, open corresponding PDF to the current markdown doc.
map <leader>m :!make<CR>
map <leader>p :!open-pdf %<CR><CR>

" Shortcut for saving, sudo saving and showing whitespace.
map <leader>w     :w<CR>
map <leader><S-w> :w !sudo tee > /dev/null %<CR>
map <leader>l     :set invlist<CR>

" Remap shortcuts for moving around in windows.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Auto markdown to pdf on save, auto restart sxhkd and auto restart shortcuts.
autocmd BufWritePost *.md silent !mdtopdf % &
autocmd BufWritePost sxhkdrc !killall sxhkd; sxhkd &\!
autocmd BufWritePost ~/.config/shortcuts/bmdirs,~/.config/shortcuts/bmfiles !shortcuts

" --------------------------------------------------------------------
" PLUGINS
" --------------------------------------------------------------------

" Auto install Vim-Plug if not available.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')    " Specify directory for plugins.

Plug 'scrooloose/nerdtree'            " Tree file system explorer.
Plug 'vim-syntastic/syntastic'        " Syntax checking.
Plug 'scrooloose/nerdcommenter'       " Commenting like a pro.
Plug 'ntpeters/vim-better-whitespace' " Whitespace cleaning.
Plug 'jreybert/vimagit'               " Git plugin.

call plug#end()

" Mapping for NerdTree and Magit.
map <leader>t  :NERDTree<CR>
map <leader>g  :Magit<CR>
map <leader>gp :!git push<CR>

" Settings and mappings for Syntastic.
map <leader>sn     :lnext<CR>
map <leader>s<S-n> :lprevious<CR>
map <leader>se     :Errors<CR>
map <leader>sc     :lclose<CR>
map <leader>st     :SyntasticToggleMode<CR>
let g:syntastic_sh_checkers        = ['shellcheck']
let g:syntastic_sh_shellcheck_args = "-x"
let g:syntastic_check_on_open      = 1

" Settings and mapping for better whitespace.
map <leader>b :StripWhitespace<CR> :%s/\($\n\s*\)\+\%$//e<CR>
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:show_spaces_that_precede_tabs=1

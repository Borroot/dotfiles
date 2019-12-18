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

" Auto highlight whitespace: at the end of lines and spaces before tabs.
highlight ExtraWhite ctermbg=Red
match ExtraWhite /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhite / \+\ze\t/
autocmd InsertLeave * match ExtraWhite /\s\+$\| \+\ze\t/

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
autocmd FileType sh,bash setlocal expandtab
autocmd FileType haskell setlocal shiftwidth=2 tabstop=2 expandtab

" Run make, open corresponding PDF to the current markdown doc.
map <leader>m :!make<CR>
map <leader>p :!open-pdf %<CR><CR>
map <leader>b :%s/\s\+$//e<CR> :%s/\($\n\s*\)\+\%$//e<CR>

" Shortcut for saving and sudo saving.
map <leader>w     :w<CR>
map <leader><S-w> :w !sudo tee > /dev/null %<CR>

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

call plug#begin('~/.vim/plugged') " Specify directory for plugins.

Plug 'vim-syntastic/syntastic'    " Syntax checking.

call plug#end()


" Settings and mappings for Syntastic.
let g:syntastic_sh_checkers        = ['shellcheck']
let g:syntastic_sh_shellcheck_args = "-x"
let g:syntastic_check_on_open      = 1

map <leader>sn     :lnext<CR>
map <leader>s<S-n> :lprevious<CR>
map <leader>se     :Errors<CR>
map <leader>sc     :lclose<CR>
map <leader>st     :SyntasticToggleMode<CR>

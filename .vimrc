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
autocmd FileType   txt,tex,markdown set columns=80
autocmd VimResized *.txt,*.tex,*.md set columns=80

" Auto highlight whitespace: at the end of lines and spaces before tabs.
highlight ExtraWhite ctermbg=Red
match ExtraWhite /\s\+$\| \s\+\t/
autocmd InsertEnter * match ExtraWhite /\s\+\t/
autocmd InsertLeave * match ExtraWhite /\s\+$\|\s\+\t/

filetype plugin indent on            " Enable changing of tabs.
set tabstop=4 shiftwidth=4           " Set the tabsize to 4.

set number relativenumber            " Use relative line numbers.
highlight LineNr ctermfg=grey        " Set a nice color for line numbers.

highlight clear SpellBad             " Clear highlighting of misspelled words.
highlight SpellBad cterm=standout    " Set a good highlighting for misspelled words.

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
map <leader>s     :w<CR>
map <leader><S-s> :w !sudo tee > /dev/null %<CR>

" Auto markdown to pdf on save, auto restart sxhkd and auto restart shortcuts.
autocmd BufWritePost *.md silent !mdtopdf % &
autocmd BufWritePost sxhkdrc !killall sxhkd; sxhkd &\!
autocmd BufWritePost ~/.config/shortcuts/bmdirs,~/.config/shortcuts/bmfiles !shortcuts

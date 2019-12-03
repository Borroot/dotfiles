let mapleader =","                   " Set the map leader to ','.
set shell=/bin/zsh                   " Set the default shell to zsh.

filetype plugin on                   " Enable recognisition of filetypes.
syntax on                            " Enable syntax highlighting.

set mouse=a                          " Turn on mouse support.
set ignorecase                       " Ignore cases in searching.

set autoindent                       " Auto indentation.
set wrap linebreak                   " Nice line wrapping with words.

filetype plugin indent on            " Enable changing of tabs.
set tabstop=4 shiftwidth=4           " Set the tabsize to 4.

set number relativenumber            " Use relative line numbers.
highlight LineNr ctermfg=grey        " Set a nice color for line numbers.

highlight clear SpellBad             " Clear highlighting of misspelled words.
highlight SpellBad cterm=standout    " Set a good highlighting for misspelled words.

" Automatic closing bracket generation.
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" No auto commenting for all files and set tabs to spaces and tabsize to 2 for haskell.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType haskell setlocal shiftwidth=2 tabstop=2 expandtab

" Run make, open corresponding PDF to the current markdown doc and save as sudo.
" Remove \s at end of lines and remove \s at the end of file.
map <leader>s :w<CR>
map <leader>m :!make<CR>
map <leader>p :!open-pdf %<CR><CR>
map <leader>w :w !sudo tee > /dev/null %<CR>
map <leader>b :%s/\s\+$//e<CR> :%s/\($\n\s*\)\+\%$//e<CR>

" Auto markdown to pdf on save, auto update sxhkd on change and auto update shortcuts on change.
autocmd BufWritePost *.md silent !mdtopdf % &
autocmd BufWritePost sxhkdrc !killall sxhkd; sxhkd &\!
autocmd BufWritePost ~/.config/shortcuts/bmdirs,~/.config/shortcuts/bmfiles !shortcuts

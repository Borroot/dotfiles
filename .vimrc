" Syntax highlighting on.
filetype plugin on
syntax on

" Tabsize is 4.
filetype plugin indent on
set tabstop=4
set shiftwidth=4

" Automatic closing bracket generation.
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Ignore cases in searching.
set ignorecase

" Relative linenumbers.
set number relativenumber
highlight LineNr ctermfg=grey

" Disables automatic commenting on newline.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically convert markdown to pdf on save.
autocmd BufWritePost *.md silent !mdtopdf %

" When shortcut files are updated, renew configs with new material.
autocmd BufWritePost ~/.config/shortcuts/bmdirs,~/.config/shortcuts/bmfiles !shortcuts

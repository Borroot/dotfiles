let mapleader =","

" Set the default shell.
set shell=/bin/zsh

" Syntax highlighting on.
filetype plugin on
syntax on

" Tabsize is 4.
filetype plugin indent on
set tabstop=4 shiftwidth=4

" Nice line wrapping. 
set wrap linebreak

" Automatic indentation.
set autoindent

" Automatic closing bracket generation.
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Ignore cases in searching.
set ignorecase

" Relative linenumbers.
set number relativenumber
highlight LineNr ctermfg=grey

" Readable highlighting of wrongly spelled words.
highlight clear SpellBad
highlight SpellBad cterm=standout

" Disables automatic commenting on newline.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open corresponding pdf to this file.
map <leader>p :!open-pdf %<CR><CR>

" Automatically convert markdown to pdf on save.
autocmd BufWritePost *.md silent !mdtopdf %

" Automatically update sxhkd shortcuts in running environment.
autocmd BufWritePost sxhkdrc !killall sxhkd; sxhkd &\!

" When shortcut files are updated, renew configs with new material.
autocmd BufWritePost ~/.config/shortcuts/bmdirs,~/.config/shortcuts/bmfiles !shortcuts

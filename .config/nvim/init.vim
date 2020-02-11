" --------------------------------------------------------------------
" BASICS
" --------------------------------------------------------------------

let mapleader =","            " Set the map leader to ','.
set shell=/bin/zsh            " Set the default shell to zsh.

syntax on                     " Enable syntax highlighting.
filetype plugin on            " Enable recognistion of filetypes.

set mouse=a                   " Turn on mouse support.
set ignorecase                " Ignore cases in searching.

" --------------------------------------------------------------------
" VISUALS
" --------------------------------------------------------------------

set laststatus=0              " Show no statusbar, its a waste of space.
set conceallevel=2            " Conceal some latex commands.
set number relativenumber     " Use relative line numbers.

function Visuals()
	set bg=light                  " Set the default theme.

	hi clear Conceal              " No color for concealed text.
	hi clear SignColumn           " No color for the sign column.

	hi LineNr ctermfg=grey        " Nice color for line numbers.
	hi CursorLineNr ctermfg=grey  " Nice color for current line number.

	hi clear SpellBad             " Clear the color.
	hi SpellBad ctermbg=DarkGrey  " Color for misspelled words.
endfunction

call Visuals()

" --------------------------------------------------------------------
" FORMATTING
" --------------------------------------------------------------------

filetype plugin indent on     " Enable changing of tabs.
set tabstop=4 shiftwidth=4    " Set the tabsize to 4.

set autoindent smartindent    " Auto indent and smart indent.
set breakindent               " Keep indent when wrapping.
set wrap linebreak            " Nice line wrapping with words.
set display=lastline          " Show parts of a wrapped line not @'s.

" Set all kinds of format options, see `:h fo-table`.
au FileType * set fo-=t fo-=c fo-=r fo-=o
au FileType haskell setlocal shiftwidth=2 tabstop=2 expandtab

" --------------------------------------------------------------------
" MAPS & AUTOCMDS
" --------------------------------------------------------------------

" Always open the help in a vertical split.
cabbrev h vert h
cabbrev help vert help

" Remap shortcuts for moving around in windows.
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Shortcut for toggling 'list', clear highlighting, saving and sudo saving.
nmap <leader>l     :set invlist listchars=tab:>-,space:•,eol:$<CR>
nmap <leader>h     :noh<CR>
nmap <leader>w     :w<CR>
nmap <leader><S-w> :w !sudo tee > /dev/null %<CR><CR>

" Run make, open corresponding PDF and run shellcheck.
nmap <leader>m :make<CR>
nmap <leader>p :!open-pdf %<CR><CR>
nmap <leader>s :!shellcheck -x %<CR>

" Auto markdown to pdf on save, auto restart sxhkd and auto restart shortcuts.
au BufWritePost *.md    silent !mdtopdf % &
au BufWritePost sxhkdrc silent !killall sxhkd; sxhkd 2> /dev/null &\!
au BufWritePost ~/.config/shortcuts/bmdirs,~/.config/shortcuts/bmfiles !shortcuts

" Auto commands for tex editing.
au VimLeave     *.tex silent !tex-clear %
au BufWritePost *.tex silent !tex-build %

" --------------------------------------------------------------------
" CURSOR
" --------------------------------------------------------------------

" Start with a block cursor and leave with a beam cursor.
au VimEnter * silent exec "! echo -ne '\e[1 q'"
au VimLeave * silent exec "! echo -ne '\e[5 q'"

" Change the cursor when changing the mode.
au InsertEnter * silent exec "! echo -ne '\e[5 q'"
au InsertLeave * silent exec "! echo -ne '\e[1 q'"

" --------------------------------------------------------------------
" PLUGINS
" --------------------------------------------------------------------

" Auto install Vim-Plug if not available.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
	Plug 'junegunn/goyo.vim'              " Distraction free writing.
	Plug 'ntpeters/vim-better-whitespace' " Whitespace cleaning like a pro.
	Plug 'scrooloose/nerdcommenter'       " Toggle comments: <leader>c<space>.
	Plug 'tpope/vim-surround'             " Easy surrounding things.
	Plug 'farmergreg/vim-lastplace'       " Remember the last position.
	Plug 'airblade/vim-gitgutter'         " Show git status in the file.
	Plug 'kovetskiy/sxhkd-vim'            " Syntax highlighting for sxhkd.
	Plug 'scrooloose/nerdtree'            " Tree file system explorer.
	Plug 'sirver/ultisnips'               " Snippets are the best.
	Plug 'borroot/tex-conceal', {'for': 'tex'} " Better concealment.
call plug#end()

" Mapping for Goyo and fix colors.
nmap <leader>g :Goyo<CR>
let g:goyo_height=95

au User GoyoEnter cmap q qa
au User GoyoLeave cunmap q
au User GoyoEnter,GoyoLeave call Visuals() | syn off | syn on

" Mapping for NerdTree.
nmap <leader>t :NERDTree<CR>

" Setting for git gutter.
set updatetime=500

" Setting for tex conceal.
let g:tex_conceal='abdmg'

" Mapping and settings for UltiSnips.
nmap <leader>u :UltiSnipsEdit<CR>

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-h>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetDirectories=['ultisnips']

" Settings for better whitespace.
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:better_whitespace_enabled=1
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1

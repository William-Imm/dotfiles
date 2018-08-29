set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'jeaye/color_coded', { 'do': 'rm -f CMakeCache.txt && mkdir build && cd build && cmake .. && make && make install' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ludovicchabant/vim-gutentags' | Plug 'majutsushi/tagbar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/csv.vim'
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rake' | Plug 'tpope/vim-projectionist'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Type :Goyo to enter distraction free mode'

call plug#end()

let g:mustache_abbreviations = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

set listchars=tab:>-,trail:-
hi SpecialKey guifg=#303030 guibg=#262626

set ts=2 sts=2 sw=2 ai si noexpandtab number incsearch hlsearch ruler

let g:ycm_extra_conf_globlist = ['~/Projects/*', '~/git/*']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set updatetime=100

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

nmap <s-t> :TagbarToggle<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#whitespace#enabled = 1

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

let g:tmuxline_preset = {
			\ 'a': '#S',
			\ 'b': '#F',
			\ 'c': '#W',
			\ 'y': ['%Y-%m-%d', '%I:%M %p'],
			\ 'z': '#H'}

set undofile
set undodir=~/.vim/undodir
set clipboard=unnamedplus

let mapleader=","

nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>G :Grepper -tool ag<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

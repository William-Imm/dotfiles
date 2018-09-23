set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-plug'
Plug 'justinmk/vim-dirvish'
Plug 'godlygeek/tabular'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'jeaye/color_coded', { 'do': 'rm -f CMakeCache.txt && mkdir build && cd build && cmake .. && make && make install' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-endwise'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ludovicchabant/vim-gutentags' | Plug 'majutsushi/tagbar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/csv.vim'
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-afterimage'
Plug 'tpope/vim-jdaddy', { 'for': 'json' }
" Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
" autocmd! User goyo.vim echom 'Type :Goyo to enter distraction free mode'

call plug#end()

let g:mustache_abbreviations = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Dirvish | endif

map <C-n> :Dirvish<CR>

hi SrecialKey guifg=#303030 guibg=#262626

"set ts=2 sts=2 sw=2 ai si noexpandtab number incsearch hlsearch ruler
set ts=4 ai number

let g:ycm_extra_conf_globlist = ['~/Projects/*', '~/git/*']

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

set updatetime=100

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

nmap <s-t> :TagbarToggle<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_vim'
let g:airline_base16_improved_contrast = 1
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

" Use Ctrl+w to remove hightlighting after search
nnoremap <silent> <C-W> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-W>

syntax on
colorscheme desert
set noesckeys
let mapleader = ','
noremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
noremap <leader>t :NERDTree<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>e :tabedit 
nnoremap gr :tabprevious<cr>
" imap <Tab> <C-X><C-F><Left><Del>
set number
set noerrorbells
set incsearch
set laststatus=2
set nocompatible

set path=$PWD/**

set noswapfile
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'KKPMW/vim-sendtowindow'
Plug 'itchyny/lightline.vim'
Plug 'yegappan/taglist'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tmhedberg/SimpylFold'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'jalvesaq/Nvim-R'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'gaalcaras/ncm-R'
"Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'ivanov/vim-ipython'
Plug 'jiangmiao/auto-pairs'
call plug#end()

let r_syntax_folding = 1
"set nofoldenable

set undodir=~/.vim/undodir
set undofile
set timeoutlen=1000 
set ttimeoutlen=5
set backspace=indent,eol,start

set ts=4 sw=4
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

colorscheme gruvbox


" shortcuts:
" open new terminal split:
" 	:vsplit term
" 
" swap panes:
" 	ctrl+w, ctrl+r
"
" change width of pane:
" 	size, ctrl+w, |
" 	e.g. 300 ctrl+w, |
" open file in project path if you know the name but not the path:
" 	:find filename
" 	e.g. :find settings.py

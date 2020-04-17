syntax on
colorscheme desert
let mapleader = ','
noremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
noremap <leader>t :NERDTree<cr>
nnoremap gr :tabprevious<cr>
" imap <Tab> <C-X><C-F><Left><Del>
set number
set noerrorbells
set incsearch
set laststatus=2

set noswapfile
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tmhedberg/SimpylFold'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'jalvesaq/Nvim-R'
Plug 'preservim/nerdcommenter'
Plug 'gaalcaras/ncm-R'
"Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
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
"let g:gruvbox_contrast_dark = 'soft'
"set background=dark
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_color_term = 100
"set conceallevel=1
"let g:indentLine_conceallevel=1
"let g:indentLine_setColors = 100
"let g:indentLine_char = '|'
"let g:indentLine_enabled = 1

colorscheme gruvbox

"if has("terminfo")
	  "let &t_Co=16
	  "let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
	  "let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
  "else
		"let &t_Co=16
		"let &t_Sf="\<Esc>[3%dm"
		"let &t_Sb="\<Esc>[4%dm"
	"endif

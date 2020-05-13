syntax on
colorscheme desert
set noesckeys
let mapleader = ','
noremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
noremap <leader>t :NERDTree<cr>
nnoremap <leader>h :if exists("g:syntax_on") <Bar>              
        \   syntax off <Bar>                             
        \ else <Bar>                                     
        \   syntax enable <Bar>                                  
        \ endif <CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>e :tabedit 
nnoremap gr :tabprevious<cr>
" imap <Tab> <C-X><C-F><Left><Del>
set number
set noerrorbells
set incsearch
set laststatus=2
set nocompatible
nnoremap <F12> <C-]> 

"nnoremap <C-q> :tabnext<cr>
nmap <S-h> :tabprevious<cr>
nmap <S-l> :tabnext<cr>
nnoremap <C-S-`> :tabprevious<cr>
vmap <space> <Plug>RDSendSelection
nmap <space> <S-v><space>

"MOUSE SETTINGS
"set mouse=a
"set ttymouse=xterm2
"
"set path=$PWD/*
set path=/mnt/data/website/autoprimerpicker/*

set noswapfile
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-pandoc/vim-rmarkdown'
Plug 'jpalardy/vim-slime'
Plug 'maksimr/vim-jsbeautify'
Plug 'ajutsushi/tagbar'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'KKPMW/vim-sendtowindow'
Plug 'itchyny/lightline.vim'
"Plug 'yegappan/taglist'
Plug 'rafi/awesome-vim-colorschemes'
"Plug 'tmhedberg/SimpylFold'
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
"Plug 'jiangmiao/auto-pairs'
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



"nmap <leader>gd <Plug>(coc-definition)
"nmap <leader>gr <Plug>(coc-references)
nnoremap <leader>n :tabnew<CR>
nnoremap <C-p> :GFiles<CR>

" shortcuts:
" open new terminal split:
" 	:vert term
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
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"




let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 's:Section',
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
	\ }



nmap <F8> :TagbarToggle<CR>
let R_source = '~/.tmux_split.vim'


"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ }


"turn off nvimr replacement of _ with <-
let R_assign = 0



"select entire function
map <leader>fu ?=.*function(<cr>V/{<cr>%


"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


vmap <leader>2 di'<esc>pi'<esc>

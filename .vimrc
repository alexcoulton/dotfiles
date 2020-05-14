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
"nnoremap <C-S-`> :tabprevious<cr>
vmap <space> <C-c><C-c>
nmap <space> <S-v><C-c><C-c>
"nmap <space> <S-v><space>

"MOUSE SETTINGS
set mouse=a
set ttymouse=xterm2
"
"toggle mouse
map <F5> <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>

"set path=$PWD/*
set path=/mnt/data/website/autoprimerpicker/*

set noswapfile
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Unused
"Plug 'vim-airline/vim-airline'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-pandoc/vim-rmarkdown'
"Plug 'yegappan/taglist'
"Plug 'tmhedberg/SimpylFold'
"Plug 'gaalcaras/ncm-R'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'jiangmiao/auto-pairs'
"Plug 'jalvesaq/zotcite'
"Plug 'Shougo/unite.vim'
"Plug 'rafaqz/citation.vim'
"Plug 'maksimr/vim-jsbeautify'
"Plug 'tpope/vim-surround'
"Plug 'ivanov/vim-ipython'

"Bugged!
"Plug 'jalvesaq/Nvim-R'

"Plug 'SirVer/ultisnips'
Plug 'majutsushi/tagbar'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'jpalardy/vim-slime'
call plug#end()

nmap <C-S-a> :call NERDComment(0,"toggle")<CR>
vnoremap <C-S-a> :call NERDComment(0,"toggle")<CR>



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
map <leader>fu ?=.*function(<cr>V/{<cr>%<C-c><C-c>


"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <leader>vs :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


vmap <leader>2 di'<esc>pi'<esc>


" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " default location
if executable(s:clip)
   augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end


inoremap jj <ESC>


"vim session commands 
map <F2> :mksession! ~/vim_session " Quick write session with F2
map <F3> :source ~/vim_session     " And load session with F3


"let g:airline#extensions#wordcount#enabled = 1
"let g:airline#extensions#wordcount#filetypes = '\vnotes|help|markdown|rst|org|text|asciidoc|tex|mail'



"let g:citation_vim_bibtex_file="~/phd/rotation1scripts_v4/rmarkdown/references.bib"
"let g:citation_vim_mode="bibtex"
"let g:citation_vim_cache_path='~/.vim/bibcache'
"let g:citation_vim_outer_prefix="["
"let g:citation_vim_inner_prefix="@"
"let g:citation_vim_suffix="]"
"let g:citation_vim_et_al_limit=2


""nmap <leader>u [unite]
"nnoremap [unite] <nop>

"nnoremap <silent>[unite]c       :<C-u>Unite -buffer-name=citation-start-insert -default-action=append      citation/key<cr>

"function! ZoteroCite()
"" pick a format based on the filetype (customize at will)
   "let format = &filetype =~ '.*tex' ? 'citep' : 'pandoc'
   "let api_call = 'http://127.0.0.1:23119/better-bibtex/cayw?format='.format.'&brackets=1'
   "let ref = system('curl -s '.shellescape(api_call))
   "return ref
"endfunction

"noremap <leader>z "=ZoteroCite()<CR>p
"inoremap <C-z> <C-r>=ZoteroCite()<CR>
"
"
set iskeyword+=@-@
set dictionary+=~/phd/rotation1scripts_v4/rmarkdown/full_zotero_library_tags.bib
"<C-x><C-k> to insert reference 
imap <C-S-i> <C-x><C-k>

"get word count for Rmarkdown documents 
nmap <leader>wc :echom system('~/phd/rotation1scripts_v4/scripts/r/count_words.R' . ' ' . @%)<cr>

"custom editor commands for r markdown boilerplate (figures and tables)
:command -nargs=1 InsFig :normal! i fig.cap = paste0("**", fig("<args>"), "** ", "figure legend here")<esc>?figure legend here<cr>vwwwh

:command -nargs=1 InsTab :normal! i caption = paste0("**", tab("<args>"), "** ", "table legend here")<esc>?table legend here<cr>vwwwh

:command -nargs=1 RefFig :normal! i (figure `r fig("<args>", display = "num")`)

:command -nargs=1 RefTab :normal! i (table `r tab("<args>", display = "num")`)



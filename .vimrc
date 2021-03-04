"#### General Settings ####
set clipboard=
set nocompatible
syntax on

set noesckeys
set number
set noerrorbells
set incsearch
set laststatus=2
"set noswapfile
let r_syntax_folding = 1
set showcmd

set hidden "lets you make changes to a file and move to another buffer without saving the file"

set undodir=~/.vim/undodir
set undofile
set timeoutlen=1000 
set ttimeoutlen=5
set backspace=indent,eol,start
set re=1 "set vim to use an older regex engine. this makes it much faster
"https://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting

set display+=lastline   "make vim show wrapped lines (don't hide with @)


"writing markdown settings
"set linebreak "don't break words when wrapping text
"set formatoptions+=a "automatically format paragraphs when typing (introduce line breaks)
"set tw=120 "text width set to 120


"writing code settings
set formatoptions-=a "automatically format paragraphs when typing (introduce line breaks)
set tw=1000 "text width set to 120

set ts=4 sw=4
set number relativenumber "turn on relative line numbering

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


"#### Spelling settings ####
set spell 
set spelllang=en_gb
nmap <C-n> ]s

"#### MOUSE SETTINGS ####
set mouse=a
set ttymouse=xterm2

"#### Plugins ####
call plug#begin('~/.vim/plugged')

"Unused
"Plug 'vim-airline/vim-airline'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-pandoc/vim-rmarkdown'
"Plug 'yegappan/taglist'
"Plug 'tmhedberg/SimpylFold'
"Plug 'gaalcaras/ncm-R'
"Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
"Plug 'jalvesaq/zotcite'
"Plug 'Shougo/unite.vim'
"Plug 'rafaqz/citation.vim'
"Plug 'maksimr/vim-jsbeautify'
Plug 'tpope/vim-surround'
"Plug 'ivanov/vim-ipython'
Plug 'Asheq/close-buffers.vim'
"Bugged!
"Plug 'jalvesaq/Nvim-R'

"Plug 'SirVer/ultisnips'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'gaalcaras/ncm-R'

Plug '~/repos/vim_plugins/firstplugin'
Plug '~/.vim/plugged/line_spacing'

Plug 'tpope/vim-fugitive'
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


"#### Colour Scheme ####

colorscheme desert

"light color settings:
colorscheme summerfruit256
highlight LineNr ctermfg=grey ctermbg=white

colorscheme gruvbox
set bg=dark

"#### Plugin settings ####


let g:goyo_width = 150 


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

"Nvim-R tmux support
let R_source = '~/.tmux_split.vim'

"if executable(s:clip)
   "augroup WSLYank
        "autocmd!
        "autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    "augroup END
"end


"#### References ####

set iskeyword+=@-@
set dictionary+=~/project.phd.main/rotation1scripts_v4/rmarkdown/full_zotero_library_tags.bib
"<C-x><C-k> to insert reference 

"#### Custom commands ####

"custom editor commands for r markdown boilerplate (figures and tables)
:command -nargs=1 InsFig :normal! i fig.cap = paste0("**", fig("<args>"), "** ", "figure legend here")<esc>?figure legend here<cr>vwwwh

:command -nargs=1 InsTab :normal! i caption = paste0("**", tab("<args>"), "** ", "table legend here")<esc>?table legend here<cr>vwwwh

:command -nargs=1 RefFig :normal! i (figure `r fig("<args>", display = "num")`)

:command -nargs=1 RefTab :normal! i (table `r tab("<args>", display = "num")`)

:command InsChunk :normal! i```{r}<cr><cr>```<esc>

:command -nargs=1 InsSection :normal! i#### <args> ####<esc>

:command Td :colorscheme gruvbox | set bg=dark
:command Tl :colorscheme summerfruit256



filetype plugin on
set omnifunc=syntaxcomplete#Complete

"#### Custom functions ####
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<space>\<space>\<space>\<space>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  let has_at = match(substr, '[@]') != -1       " position of slash, if any
  if (has_at)
	return "\<C-x>\<C-k>"
  elseif (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
	return "\<C-N>"                  "any completion
	"return "\<C-X>\<C-O>" "Omnicompletion

  endif
endfunction

"#### Indentation ####

"Produce proper indentation after e.g. and lapply with an anonymous function.
"See :h ft-r-indent
let r_indent_align_args = 0
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0

"#### Key Mappings ####

let mapleader = ','
" imap <Tab> <C-X><C-F><Left><Del>
"imap <tab> <space><space><space><space>
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"nmap <C-S-i> :InsChunk<cr>
"nmap <leader>gd <Plug>(coc-definition)
"nmap <leader>gr <Plug>(coc-references)
"nmap <space> <S-v><space>
"nnoremap <C-S-`> :tabprevious<cr>
"nnoremap <C-q> :tabnext<cr>
imap <C-S-i> <C-x><C-k>
inoremap <tab> <c-r>=Smart_TabComplete()<CR>
inoremap jj <ESC>
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <F2> :mksession! ~/vim_session " Quick write session with F2
map <F3> :source ~/vim_session     " And load session with F3
map <F5> <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>

"Select entire function
map <leader>fu ?=.*function(<cr>V/{<cr>%<C-c><C-c> 
nmap <C-S> :call NERDComment(0,"toggle")<CR>
nmap <F8> :TagbarToggle<CR>
nmap <S-h> :tabprevious<cr>
nmap <S-l> :tabnext<cr>
nmap <leader>rr :source ~/.vimrc<cr>
nmap <leader>vn :vsp ~/.vimnotes<cr>
nmap <leader>vs :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nmap <leader>wc :echom system('~/project.phd.main/rotation1scripts_v4/scripts/r/count_words.R' . ' ' . @%)<cr>
nmap <space> <S-v><C-c><C-c>
nnoremap <C-p> :GFiles<CR>
nnoremap <F12> <C-]> 
nnoremap <leader>e :tabedit 
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>h :if exists("g:syntax_on") <Bar>              
        \   syntax off <Bar>                             
        \ else <Bar>                                     
        \   syntax enable <Bar>                                  
        \ endif <CR>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>s :w<cr>
nnoremap gr :tabprevious<cr>
noremap <leader>q :q<cr>
noremap <leader>t :NERDTree<cr>
vmap <leader>2 di'<esc>pi'<esc>
vmap <space> <C-c><C-c>
vnoremap <C-S-a> :call NERDComment(0,"toggle")<CR>


"toggle numbering
noremap <leader>5 :set invnumber invrelativenumber<CR>


"latex mappings
"nnoremap j gj
"nnoremap gj j
"nnoremap k gk
"nnoremap gk k

nnoremap <PageUp> <C-U>
nnoremap <PageDown> <C-D>


set conceallevel=0

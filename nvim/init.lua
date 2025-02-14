-- gd to go to these files
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.autocommands"
require "user.colorscheme"
require "user.cmp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.illuminate"
require "user.indentline"
--require "user.alpha"
require "user.lsp"
require "user.dap"


vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

vim.api.nvim_create_user_command('ToggleGutter', function()
    -- Toggle line numbers
    vim.opt.number = not vim.opt.number:get()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
    -- Toggle fold column
    vim.opt.foldcolumn = vim.opt.foldcolumn:get() == '0' and '1' or '0'
    -- Toggle sign column
    vim.opt.signcolumn = vim.opt.signcolumn:get() == 'no' and 'yes' or 'no'
end, {})

-- Map the function to a key, replace '<Leader>g' with your preferred shortcut
vim.api.nvim_set_keymap('n', '<Leader>g', ':ToggleGutter<CR>', { noremap = true, silent = true })


local result = vim.api.nvim_exec(
[[

let r_indent_align_args = 0
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0

]],
true)


local result = vim.api.nvim_exec(
[[

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

nnoremap <leader>k ?^\S<enter>
nnoremap <leader>j /^\S<enter>
vnoremap <leader>k ?^\S<enter>
vnoremap <leader>j /^\S<enter>

colorscheme gruvbox

nmap <leader>b yssbi
nmap <space> <S-v><C-c><C-c>
vmap <space> <C-c><C-c>

:command -nargs=1 IS :normal! i############################<enter>#<args> <enter>############################<esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ff A %>%<CR>filter()<esc>ha
nnoremap <leader>gg A %>%<CR>group_by()<esc>ha
nnoremap <leader>mm A %>%<CR>mutate()<esc>ha
nnoremap <leader>uu A %>%<CR>summarise()<esc>ha
nnoremap <leader>aa A %>%<CR>arrange()<esc>ha

autocmd BufRead,BufNewFile *.nf setfiletype groovy
autocmd BufRead,BufNewFile *.config setfiletype groovy

]],
true)


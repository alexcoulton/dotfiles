require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.autocommands"
-- require "user.colorscheme"
require "user.cmp"
require "user.telescope"
--require "user.treesitter"
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
require "user.alpha"
require "user.lsp"
require "user.dap"

vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
local result = vim.api.nvim_exec(
[[

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

nnoremap <leader>k ?^\S<enter>
nnoremap <leader>j /^\S<enter>
vnoremap <leader>k ?^\S<enter>
vnoremap <leader>j /^\S<enter>

nmap <leader>b yssbi
nmap <space> <S-v><C-c><C-c>
vmap <space> <C-c><C-c>

colorscheme gruvbox

]],
true)



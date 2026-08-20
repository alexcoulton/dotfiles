local opt = vim.opt

opt.backup = false
opt.clipboard = ""
opt.cmdheight = 1
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hlsearch = false
opt.ignorecase = true
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 1
opt.mouse = ""
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = false
opt.splitright = false
opt.swapfile = false
opt.termguicolors = true
opt.timeoutlen = 1000
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.cursorline = false
opt.number = true
opt.relativenumber = true
opt.laststatus = 3
opt.showcmd = false
opt.ruler = false
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.guifont = "monospace:h17"
opt.fillchars:append({ eob = " " })
opt.shortmess:append("c")
opt.whichwrap:append("<,>,[,],h,l")
opt.iskeyword:append("-")

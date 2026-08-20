local version = vim.version()
if version.major ~= 0 or version.minor ~= 12 or version.patch ~= 4 then
  error("This configuration requires Neovim 0.12.4 exactly")
end

vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("modern.options")
require("modern.tabline")
require("modern.keymaps")
require("modern.autocmds")
require("modern.lazy")

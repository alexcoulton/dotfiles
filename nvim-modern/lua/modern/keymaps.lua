local map = vim.keymap.set
local silent = { silent = true }

map("", ",", "<Nop>", silent)

map("n", "<C-h>", "<C-w>h", silent)
map("n", "<C-j>", "<C-w>j", silent)
map("n", "<C-k>", "<C-w>k", silent)
map("n", "<C-l>", "<C-w>l", silent)

map("n", "<C-Up>", "<cmd>resize -2<CR>", silent)
map("n", "<C-Down>", "<cmd>resize +2<CR>", silent)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", silent)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", silent)

map("n", "<S-l>", "<cmd>tabnext<CR>", silent)
map("n", "<S-h>", "<cmd>tabprevious<CR>", silent)
map("n", "<leader>n", "<cmd>tabnew<CR>", { desc = "New tab", silent = true })

map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight", silent = true })
map("n", "<leader>s", "<cmd>write<CR>", { desc = "Save", silent = true })
map("v", "p", '"_dP', silent)
map("i", "jj", "<Esc>", silent)

local function close_tab_or_exit()
  if #vim.api.nvim_list_tabpages() == 1 then
    vim.cmd("confirm quit")
  else
    vim.cmd("confirm bdelete")
  end
end

map("n", "<leader>q", close_tab_or_exit, { desc = "Close tab or exit", silent = true })

map("n", "<C-p>", function()
  Snacks.picker.files()
end, { desc = "Find files", silent = true })

local function pick_project()
  Snacks.picker.projects({
    dev = { "~/work" },
    patterns = { ".git" },
    max_depth = 4,
  })
end

local function live_grep()
  Snacks.picker.grep()
end

map("n", "<leader>F", live_grep, { desc = "Find in files", silent = true })
map("n", "<leader>ft", live_grep, { desc = "Live grep", silent = true })
map("n", "<leader>fp", pick_project, { desc = "Find project", silent = true })
map("n", "<C-g>", pick_project, { desc = "Find project", silent = true })
map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Find buffers", silent = true })

map("n", "<leader>lg", function()
  if vim.fn.executable("lazygit") == 0 then
    vim.notify("lazygit is not installed", vim.log.levels.WARN)
    return
  end
  Snacks.lazygit()
end, { desc = "Lazygit", silent = true })

map({ "n", "i", "t" }, "<C-\\>", function()
  Snacks.terminal.toggle(nil, {
    win = {
      position = "float",
      border = "rounded",
      width = 0.9,
      height = 0.9,
    },
  })
end, { desc = "Toggle terminal", silent = true })

map("n", "<leader>/", "gcc", { desc = "Comment line", remap = true, silent = true })
map("x", "<leader>/", "gc", { desc = "Comment selection", remap = true, silent = true })
map("n", "<leader>c<Space>", "gcc", { desc = "Toggle comment", remap = true, silent = true })
map("x", "<leader>c<Space>", "gc", { desc = "Toggle comment selection", remap = true, silent = true })

map("n", "<A-n>", function()
  Snacks.words.jump(vim.v.count1)
end, { desc = "Next reference", silent = true })
map("n", "<A-p>", function()
  Snacks.words.jump(-vim.v.count1)
end, { desc = "Previous reference", silent = true })

map("n", "<leader>ev", "<cmd>vsplit $MYVIMRC<CR>", { desc = "Edit config", silent = true })
map("n", "<leader>b", "yssbi", { desc = "Surround line with parentheses", remap = true, silent = true })

-- Preserve the effective R-oriented mappings from the existing config.
map("n", "<leader>ff", "A %>%<CR>filter()<Esc>ha", silent)
map("n", "<leader>gg", "A %>%<CR>group_by()<Esc>ha", silent)
map("n", "<leader>mm", "A %>%<CR>mutate()<Esc>ha", silent)
map("n", "<leader>uu", "A %>%<CR>summarise()<Esc>ha", silent)
map("n", "<leader>aa", "A %>%<CR>arrange()<Esc>ha", silent)
map("n", "<leader>k", "?^\\S<CR>", silent)
map("n", "<leader>j", "/^\\S<CR>", silent)
map("v", "<leader>k", "?^\\S<CR>", silent)
map("v", "<leader>j", "/^\\S<CR>", silent)

vim.api.nvim_create_user_command("ToggleGutter", function()
  vim.opt.number = not vim.opt.number:get()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
  vim.opt.foldcolumn = vim.opt.foldcolumn:get() == "0" and "1" or "0"
  vim.opt.signcolumn = vim.opt.signcolumn:get() == "no" and "yes" or "no"
end, { desc = "Toggle number, fold, and sign columns" })

map("n", "<leader>g", "<cmd>ToggleGutter<CR>", { desc = "Toggle gutter", silent = true })

vim.cmd([[command -nargs=1 IS normal! i############################<enter>#<args> <enter>############################<esc>]])

local group = vim.api.nvim_create_augroup("ModernUserConfig", { clear = true })

vim.filetype.add({
  extension = {
    nf = "groovy",
    config = "groovy",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "qf", "help", "man", "lspinfo", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "python",
  callback = function()
    vim.b.slime_bracketed_paste = 1
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = group,
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  pattern = "term://*",
  callback = function(event)
    local terminal_opts = { buffer = event.buf, silent = true }
    vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], terminal_opts)
    vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], terminal_opts)
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], terminal_opts)
    vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], terminal_opts)
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = group,
  callback = function()
    if vim.fn.winnr("$") == 1 and vim.bo.filetype == "NvimTree" then
      vim.cmd.quit()
    end
  end,
})

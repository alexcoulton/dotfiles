return {
  {
    "jpalardy/vim-slime",
    lazy = false,
    init = function()
      vim.g.slime_target = "tmux"
      vim.fn.mkdir(vim.fn.stdpath("cache"), "p")
      vim.g.slime_paste_file = vim.fn.stdpath("cache") .. "/slime_paste"
    end,
    config = function()
      vim.keymap.set("n", "<Space>", "<Plug>SlimeLineSend", {
        desc = "Send line to tmux REPL",
        remap = true,
        silent = true,
      })
      vim.keymap.set("v", "<Space>", "<Plug>SlimeRegionSend", {
        desc = "Send selection to tmux REPL",
        remap = true,
        silent = true,
      })
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
    },
  },

  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite" },
  },

  {
    "github/copilot.vim",
    event = "InsertEnter",
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
    config = function()
      vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', {
        expr = true,
        replace_keycodes = false,
        silent = true,
      })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▁" },
        topdelete = { text = "▔" },
        changedelete = { text = "▎" },
      },
    },
  },
}

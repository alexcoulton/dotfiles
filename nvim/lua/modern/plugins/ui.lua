return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      terminal_colors = true,
      contrast = "",
      transparent_mode = false,
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  {
    "folke/snacks.nvim",
    priority = 900,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      picker = {
        enabled = true,
        layout = { preset = "telescope" },
        win = {
          input = {
            keys = {
              ["<Down>"] = { "history_forward", mode = { "i", "n" } },
              ["<Up>"] = { "history_back", mode = { "i", "n" } },
            },
          },
        },
      },
      terminal = {
        enabled = true,
        win = {
          position = "float",
          border = "rounded",
          width = 0.9,
          height = 0.9,
        },
      },
      lazygit = { enabled = true },
      indent = {
        enabled = true,
        char = "▏",
        only_scope = false,
        animate = { enabled = false },
        scope = { enabled = true, char = "▏" },
      },
      words = { enabled = true },
    },
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        py = { icon = "󰌠", color = "#ffbc03", name = "Python" },
        sh = { icon = "", color = "#4d5a5e", name = "Shell" },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
    keys = {
      { "<leader>t", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local api = require("nvim-tree.api")

      local function on_attach(bufnr)
        api.config.mappings.default_on_attach(bufnr)
        local opts = function(desc)
          return { buffer = bufnr, desc = "NvimTree: " .. desc, nowait = true, silent = true }
        end
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close directory"))
        vim.keymap.set("n", "v", api.node.open.vertical, opts("Open vertical split"))
      end

      require("nvim-tree").setup({
        on_attach = on_attach,
        filesystem_watchers = {
          enable = false,
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = { enable = true },
        },
        renderer = {
          root_folder_label = ":t",
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_open = "▾",
                arrow_closed = "▸",
                default = "󰉋",
                open = "󰝰",
                empty = "󰉖",
                empty_open = "󰉖",
                symlink = "󰉋",
                symlink_open = "󰝰",
              },
              git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                untracked = "U",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        diagnostics = {
          enable = false,
          show_on_dirs = false,
          icons = {
            hint = "󰌵",
            info = "",
            warning = "",
            error = "",
          },
        },
        view = {
          width = 30,
          side = "left",
        },
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function wide_enough()
        return vim.fn.winwidth(0) > 80
      end

      require("lualine").setup({
        options = {
          globalstatus = true,
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "dashboard" },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              sections = { "error", "warn" },
              symbols = { error = " ", warn = " " },
              colored = false,
              always_visible = true,
            },
            "filename",
          },
          lualine_x = {
            {
              "diff",
              colored = false,
              symbols = { added = "", modified = "", removed = "" },
              cond = wide_enough,
            },
            function()
              return "spaces: " .. vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
            end,
            "encoding",
            { "filetype", icons_enabled = false },
          },
          lualine_y = { { "location", padding = 0 } },
          lualine_z = { "progress" },
        },
      })
    end,
  },
}

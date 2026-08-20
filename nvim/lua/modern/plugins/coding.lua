return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = {
        preset = "none",
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "accept", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 300 },
        menu = { max_height = 1 },
        ghost_text = { enabled = false },
      },
      sources = {
        default = { "lsp", "buffer", "path", "snippets" },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        sorts = { "exact", "score", "sort_text" },
      },
      signature = { enabled = true },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    build = function()
      if vim.fn.executable("tree-sitter") == 1 then
        vim.cmd.TSUpdate()
      end
    end,
    config = function()
      require("nvim-treesitter").setup()

      local parsers = {
        "bash",
        "css",
        "groovy",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "r",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }

      local highlighted_filetypes = {
        "bash",
        "groovy",
        "html",
        "java",
        "javascript",
        "javascriptreact",
        "json",
        "lua",
        "markdown",
        "python",
        "query",
        "r",
        "toml",
        "typescript",
        "typescriptreact",
        "vim",
        "vimdoc",
        "yaml",
      }

      local function install_parsers()
        if vim.fn.executable("tree-sitter") == 1 then
          require("nvim-treesitter").install(parsers)
        end
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MasonToolsUpdateCompleted",
        callback = install_parsers,
      })

      vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function()
          vim.defer_fn(install_parsers, 1000)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = highlighted_filetypes,
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}

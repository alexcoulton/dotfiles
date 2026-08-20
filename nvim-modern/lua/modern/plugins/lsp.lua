local servers = {
  "lua_ls",
  "cssls",
  "html",
  "ts_ls",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "r_language_server",
}

return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    opts = {
      -- mason-tool-installer is the single, version-pinned installer.
      ensure_installed = {},
      automatic_enable = servers,
    },
    config = function(_, opts)
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = { typeCheckingMode = "off" },
          },
        },
      })

      vim.lsp.config("r_language_server", {
        settings = {
          r = {
            lsp = {
              -- Keep completion, hover, navigation, and formatting without
              -- underlining every opinionated lintr style finding.
              diagnostics = false,
            },
          },
        },
      })

      require("mason-lspconfig").setup(opts)
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        { "bash-language-server", version = "5.6.0" },
        { "black", version = "26.5.1" },
        { "css-lsp", version = "4.10.0" },
        { "debugpy", version = "1.8.21" },
        { "flake8", version = "7.3.0" },
        { "google-java-format", version = "v1.36.1" },
        { "html-lsp", version = "4.10.0" },
        { "json-lsp", version = "4.10.0" },
        { "lua-language-server", version = "3.19.1" },
        { "prettier", version = "3.9.6" },
        { "pyright", version = "1.1.413" },
        { "r-languageserver", version = "v0.3.17" },
        { "stylua", version = "v2.5.2" },
        { "taplo", version = "0.10.0" },
        { "tree-sitter-cli", version = "v0.26.12" },
        { "typescript-language-server", version = "5.3.0" },
        { "yaml-language-server", version = "1.24.0" },
      },
      auto_update = false,
      run_on_start = true,
      start_delay = 1000,
      debounce_hours = 24,
    },
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        css = { "prettier" },
        html = { "prettier" },
        java = { "google_java_format" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "black" },
        scss = { "prettier" },
        toml = { "taplo" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        yaml = { "prettier" },
      },
      formatters = {
        black = { append_args = { "--fast" } },
        prettier = {
          append_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = { python = { "flake8" } }

      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("ModernLint", { clear = true }),
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local severity = vim.diagnostic.severity
      vim.diagnostic.config({
        virtual_text = false,
        signs = {
          text = {
            [severity.ERROR] = "",
            [severity.WARN] = "",
            [severity.HINT] = "󰌵",
            [severity.INFO] = "",
          },
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("ModernLspAttach", { clear = true }),
        callback = function(event)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc, silent = true })
          end

          map("gD", vim.lsp.buf.declaration, "LSP declaration")
          map("gd", vim.lsp.buf.definition, "LSP definition")
          map("K", vim.lsp.buf.hover, "LSP hover")
          map("gI", vim.lsp.buf.implementation, "LSP implementation")
          map("gr", vim.lsp.buf.references, "LSP references")
          map("gl", vim.diagnostic.open_float, "Line diagnostics")
          map("<leader>lf", function()
            require("conform").format({ bufnr = event.buf, lsp_format = "fallback" })
          end, "Format buffer")
          map("<leader>li", "<cmd>checkhealth vim.lsp<CR>", "LSP information")
          map("<leader>lI", "<cmd>Mason<CR>", "Mason")
          map("<leader>la", vim.lsp.buf.code_action, "Code action")
          map("<leader>lj", function()
            vim.diagnostic.jump({ count = 1 })
          end, "Next diagnostic")
          map("<leader>lk", function()
            vim.diagnostic.jump({ count = -1 })
          end, "Previous diagnostic")
          map("<leader>lr", vim.lsp.buf.rename, "Rename")
          map("<leader>ls", vim.lsp.buf.signature_help, "Signature help")
          map("<leader>lq", vim.diagnostic.setloclist, "Diagnostics location list")
        end,
      })
    end,
  },
}

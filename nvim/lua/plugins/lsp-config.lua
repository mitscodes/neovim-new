return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
    dependencies = { "Zeioth/mason-extra-cmds", opts = {} },
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
      "MasonUpdateAll",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ast_grep",
          "angularls",
          "ansiblels",
          "arduino_language_server",

          "astro",
          "asm_lsp",
          "harper_ls",
          "cmake",
          "css_variables",
          "cssmodules_ls",
          "cssls",
          "tailwindcss",

          "dockerls",
          "gopls",
          "html",
          "jdtls",
          "ts_ls",
          "jsonls",
          "kotlin_language_server",

          "ltex",
          "lua_ls",
          "phpactor",
          "powershell_es",
          "pyright",
          "solang",
          "sqlls",
          "vimls",

          "lemminx",
          "yamlls",
        },
        automatic_installation = true,
      })
    end,
  },
  {

    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- Custom on_attach for key mappings and autoformatting
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- LSP key mappings
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

        -- Autoformat on save
        if client.server_capabilities.documentFormattingProvider and vim.api.nvim_buf_is_valid(bufnr) then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", {}),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end

      -- Diagnostic settings
      vim.diagnostic.config({

        virtual_text = { prefix = "●" },

        signs = true,

        underline = true,
        update_in_insert = false,
      })

      -- Servers list
      local servers = {
        "gopls",
        "pyright",
        "harper_ls",
        "phpactor",
        "cssls",
        "tailwindcss",
        "sqlls",
        "ts_ls",
        "jsonls",
        "yamlls",
        "html",
        "lua_ls",
        "kotlin_language_server",
        "bashls",
        "angularls",
        "ansiblels",
        "arduino_language_server",
        "astro",
        "asm_lsp",
        "cmake",
        "css_variables",
        "cssmodules_ls",
        "dockerls",
        "jdtls",
        "ltex",
        "powershell_es",
        "solang",
        "vimls",
        "lemminx",
      }

      -- Loop to set up each server with common config
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end

      -- Organize imports for supported languages (Go, JS/TS, etc.)
      local organize_imports = function()
        if vim.api.nvim_buf_is_valid(0) then
          vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true,
          })
        end
      end

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = organize_imports,
      })
    end,
  },
}

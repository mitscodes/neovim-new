return {
  {
    "hrsh7th/nvim-cmp",

    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "rafamadriz/friendly-snippets",
      "zbirenbaum/copilot.lua",
    },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Setup completion menu
      cmp.setup({

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        window = {
          completion = {
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",

            max_height = 10, -- Limit height to fit 5-8 suggestions nicely
          },
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        formatting = {
          format = function(entry, item)
            item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              copilot = "[Copilot]",
            })[entry.source.name]
            return item
          end,
        },

        sources = cmp.config.sources({

          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "copilot" },
        }, {

          { name = "buffer", max_item_count = 5 }, -- Limit buffer suggestions
        }),
      })

      -- Command-line completion (trimmed down)
      cmp.setup.cmdline(":", {
        sources = {
          { name = "path" },
        },
      })

      cmp.setup.cmdline("/", {
        sources = {
          { name = "buffer" },
        },
      })

      -- Custom highlight tweaks for Kanagawa theme
      vim.cmd([[
        highlight! CmpItemAbbr guibg=NONE guifg=#C8C093

        highlight! CmpItemAbbrMatch guibg=NONE guifg=#957FB8
        highlight! CmpItemKindFunction guibg=NONE guifg=#DCA561
        highlight! CmpItemKindVariable guibg=NONE guifg=#DCD7BA
        highlight! CmpItemKindKeyword guibg=NONE guifg=#A3D4D5
      ]])
    end,
  },

  -- Snippet Integration
  {

    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- LSP Config for multiple languages
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      local servers = {
        "pyright",
        "gopls",
        "tsserver",
        "rust_analyzer",
        "html",
        "cssls",
        "tailwindcss",
        "sumneko_lua",
        "ansiblels",
        "sqls",
        "kotlin_language_server",
        "jdtls",
        "ccls",
        "csharp_ls",
        "phpactor",
        "solargraph",
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,

          on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          end,
        })
      end
    end,
  },
}

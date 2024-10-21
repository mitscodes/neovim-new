return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "html",
        "css",
        "javascript",
        "java",
        "kotlin",
        "c",
        "cpp",
        "c_sharp",
        "typescript",
        "sql",
        "cmake",
        "markdown",
        "php",
        "go",
        "python",
        "rust",
        "ruby",
        "vimdoc",
        "toml",
        "yaml",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    })
  end,
}


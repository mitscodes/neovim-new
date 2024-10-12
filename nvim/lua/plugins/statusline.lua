return {
  "nvim-lualine/lualine.nvim",

  event = "BufWinEnter",

  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "kanagawa", -- Sync with the Kanagawa colorscheme
        section_separators = { left = "", right = "" }, -- Elegant separators
        component_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { "NvimTree", "alpha" }, -- Hide in specific buffers
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },                            -- Show single-letter mode
        lualine_b = { "branch", "diff" }, -- Git branch and changes
        lualine_c = { "filename" },
        lualine_x = { { "diagnostics", sources = { "nvim_lsp" } }, "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_c = { "filename" },
        lualine_x = { "location" },
      },
    })
  end,
}

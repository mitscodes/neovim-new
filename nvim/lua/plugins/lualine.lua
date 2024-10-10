return {
  "nvim-lualine/lualine.nvim",
  event = "BufWinEnter", -- Lazy load on window enter
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",          -- Automatically set theme based on current colorscheme
        section_separators = "", -- Remove separators for a minimal look
        component_separators = "|",
      },
      sections = {
        lualine_b = { "branch" },                             -- Show Git branch
        lualine_c = { "filename" },                           -- Show current file name
        lualine_x = { "encoding", "fileformat", "filetype" }, -- File info
        lualine_y = { "progress" },                           -- Progress in the file
        lualine_z = { "location" },                           -- Cursor location
      },
    })
  end,
}


return {
  "nvim-lualine/lualine.nvim",
  event = "BufWinEnter", -- Lazy load on window enter
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",      -- Matches current colorscheme
        section_separators = "", -- Minimal separators

        component_separators = "",

        globalstatus = true, -- One status line for all windows
      },
      sections = {
        lualine_a = {}, -- Keep sections minimal
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
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

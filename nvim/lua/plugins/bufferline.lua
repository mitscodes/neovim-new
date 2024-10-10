return {
  {
    "akinsho/bufferline.nvim",
    event = { "BufWinEnter", "BufNewFile" }, -- Lazy load on buffer/window events
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          show_buffer_close_icons = true,
          show_close_icon = false,
          separator_style = "thin",
          always_show_bufferline = true,
          animation = true,       -- Enable animations
          animation_duration = 1, -- Animation duration
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
              separator = true,
            },
          },
        },
      })
      -- Key mappings with descriptions for WhichKey
      vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
      vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>",
        { noremap = true, silent = true, desc = "Previous Buffer" })
      vim.keymap.set("n", "<S-w>", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close Buffer" })
    end,
  },

}


return {
  {
    "akinsho/bufferline.nvim",
    event = { "BufWinEnter", "BufNewFile" },
    dependencies = "nvim-tree/nvim-web-devicons", -- For file icons
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- Use 'buffers' mode
          truncate_names = true, -- Truncate long buffer names
          max_name_length = 18, -- Max length before truncation
          show_buffer_close_icons = true,
          show_close_icon = false,
          separator_style = { "padded_slant", "padded_slant" }, -- Sleek separator style
          always_show_bufferline = true,
          persist_buffer_sort = true,                      -- Maintain buffer order across sessions
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
            },
          },
          custom_filter = function(buf_number)
            return vim.fn.getbufvar(buf_number, "&buftype") ~= "terminal"
                and vim.fn.bufname(buf_number) ~= ""
          end,
        },
        highlights = {
          fill = { bg = "#1E1E2E" },
          buffer_selected = {
            fg = "#A3D4D5",
            bold = true,
            italic = true,
          },
          buffer_visible = {
            fg = "#DCD7BA",
            bg = "#2E2E3E",
          },
          separator_selected = { fg = "#957FB8", bg = "#1E1E2E" },
          separator_visible = { fg = "#6E6A86", bg = "#2E2E3E" },
        },
      })

      -- Key mappings with descriptions for WhichKey
      vim.keymap.set(
        "n",
        "<Tab>",
        ":BufferLineCycleNext<CR>",
        { noremap = true, silent = true, desc = "Next Buffer" }
      )
      vim.keymap.set(
        "n",
        "<S-Tab>",
        ":BufferLineCyclePrev<CR>",
        { noremap = true, silent = true, desc = "Previous Buffer" }
      )
      vim.keymap.set("n", "<S-w>", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close Buffer" })
      vim.keymap.set(
        "n",
        "<leader>bp",
        ":BufferLinePick<CR>",
        { noremap = true, silent = true, desc = "Pick Buffer" }
      )
    end,
  },
}

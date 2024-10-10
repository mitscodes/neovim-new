return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]], -- Default terminal toggle keybinding
      direction = "float",      -- Default direction is float
      float_opts = {
        border = "rounded",     -- Rounded corners for floating terminal

      },
    })

    -- Keybindings with descriptions for WhichKey
    vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<CR>",
      { desc = "Horizontal Terminal", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=72 direction=vertical<CR>",
      { desc = "Vertical Terminal", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>",
      { desc = "Floating Terminal", noremap = true, silent = true })
  end,
}


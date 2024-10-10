return {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleToggle" }, -- Lazy load on these commands
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    icons = true,                  -- Use icons for diagnostics
    mode = "document_diagnostics", -- Default mode for showing document diagnostics
  },
  config = function()
    local trouble = require("trouble")

    -- Set up key mappings with descriptions for WhichKey
    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Toggle Diagnostics (Trouble)" })
    vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
    vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", { desc = "Document Diagnostics" })
    vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<CR>", { desc = "Location List" })
    vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", { desc = "Quickfix List" })
  end,
}


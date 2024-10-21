-- General
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 2      -- Number of spaces per tab
vim.opt.softtabstop = 2  -- Number of spaces per soft tab
vim.opt.shiftwidth = 2   -- Number of spaces for auto-indent

-- Line Numbers
vim.opt.number = true -- Show absolute line numbers

-- Color options
vim.opt.termguicolors = true -- Enable true colors

-- Navigation in Insert Mode

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })

-- Switch to Visual Mode (Ctrl + v)
vim.keymap.set("i", "<C-v>", "<Esc>v", { desc = "Switch to Visual Mode" })

-- Navigate and select text in Visual Mode (hjkl)
vim.keymap.set("v", "<C-h>", "h", { desc = "Select left" })
vim.keymap.set("v", "<C-j>", "j", { desc = "Select down" })
vim.keymap.set("v", "<C-k>", "k", { desc = "Select up" })
vim.keymap.set("v", "<C-l>", "l", { desc = "Select right" })

-- Jump to the next line in Insert Mode (Ctrl+Enter)
vim.keymap.set("i", "<C-CR>", "<Esc>o", { desc = "Insert new line below and jump to it" })

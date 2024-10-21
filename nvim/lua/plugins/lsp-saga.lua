return {
	"nvimdev/lspsaga.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Lazy load on buffer events
	config = function()
		require("lspsaga").setup({
			ui = {
				border = "rounded",
				colors = {
					normal_bg = "#1E1E2E",
				},
			},
			diagnostic = {
				on_insert = false,
				update_in_insert = true,
			},
			code_action = {
				enable = true,
				keys = {
					quit = "q",
					exec = "<CR>",
				},
			},
		})

		-- Key Mappings for LSP Features with descriptions for WhichKey
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename", noremap = true, silent = true })
		vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP Finder", noremap = true, silent = true })
		vim.keymap.set(
			"n",
			"<leader>ca",
			"<cmd>Lspsaga code_action<CR>",
			{ desc = "Code Action", noremap = true, silent = true }
		)
		vim.keymap.set(
			"v",
			"<leader>ca",
			"<cmd>Lspsaga range_code_action<CR>",
			{ desc = "Range Code Action", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>dl",
			"<cmd>Lspsaga show_line_diagnostics<CR>",
			{ desc = "Line Diagnostics", noremap = true, silent = true }
		)

		-- Telescope Integration for LSP
		vim.keymap.set(
			"n",
			"<leader>fr",
			"<cmd>Telescope lsp_references<CR>",
			{ desc = "LSP References", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>fd",
			"<cmd>Telescope lsp_definitions<CR>",
			{ desc = "LSP Definitions", noremap = true, silent = true }
		)
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}

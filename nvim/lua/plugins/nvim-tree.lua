return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" }, -- Lazy load on these commands
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false, -- Show hidden files
			},
			git = {
				enable = true, -- Enable Git integration
				ignore = false, -- Show .gitignore files
			},
			view = {
				width = 30, -- Adjust width
				side = "left", -- Open the tree on the left side
			},
		})

		-- Key mappings with descriptions for WhichKey
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree", silent = true })
		vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Focus Nvim Tree", silent = true })
	end,
}

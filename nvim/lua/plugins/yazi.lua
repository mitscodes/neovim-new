return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		{
			-- Open Yazi
			"<leader>yz",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>yw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
	},
	opts = {
		open_for_directories = false,
		yazi_floating_window_border = "rounded",
		keymaps = {
			show_help = "<f1>",
		},
	},
}

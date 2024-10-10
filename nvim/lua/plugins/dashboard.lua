return {
	"goolord/alpha-nvim",
	event = "VimEnter", -- Lazy load on Neovim start
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local dashboard = require("alpha.themes.dashboard")

		-- Customizing keybinds
		dashboard.section.buttons.val = {
			dashboard.button("ff", "󰈞  Find file", ":Telescope find_files<CR>"),
			dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
			dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
		}
		require("alpha").setup(dashboard.config)
	end,
}

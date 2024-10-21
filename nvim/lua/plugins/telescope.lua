return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope", -- Lazy load on command usage
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- FZF sorting
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")

			-- Key mappings with descriptions for WhichKey
			vim.keymap.set("n", "<C-f>", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
						},
					},
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						layout_config = {
							width = 0.6, -- Increased size of find_files by 10%
							height = 0.6,
						},
					},
					live_grep = {
						theme = nil, -- Default (horizontal) layout for live_grep
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
					},
				},
			})
			telescope.load_extension("fzf")
		end,
	},
	{ -- UI Select
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

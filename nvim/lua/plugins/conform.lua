return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		-- Formatter setup
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				java = { "google_java_format" },
				kotlin = { "ktlint" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				c_sharp = { "clang_format" },
				php = { "phpcsfixer" },
				go = { "gofmt" },
				python = { "black" },
				rust = { "rustfmt" },
				ruby = { "rubocop" },
				sql = { "sqlformat" },
				yaml = { "prettier" },
				toml = { "taplo" },
				markdown = { "prettier" },
			},
		})

		-- Autoformat on save for specific filetypes
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				conform.format({
					async = false,
					timeout_ms = 500,
				})
			end,
		})

		-- Keybinding for manual formatting
		vim.keymap.set("n", "<leader>fm", function()
			conform.format({
				async = true,
			})
		end, { desc = "Format manually" })
	end,
}

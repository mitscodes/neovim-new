return {
	"mfussenegger/nvim-lint",
	event = "BufWritePost",
	config = function()
		require("lint").linters_by_ft = {
			lua = { "luacheck" },
			html = { "tidy" },
			css = { "stylelint" },
			javascript = { "eslint" },
			typescript = { "eslint" },
			java = { "checkstyle" },
			kotlin = { "ktlint" },
			c = { "gcc" },
			cpp = { "clangtidy" },
			c_sharp = { "dotnet" },
			php = { "phpcs" },
			go = { "golangci-lint" },
			python = { "flake8" },
			rust = { "rust-clippy" },
			ruby = { "rubocop" },
			sql = { "sqlfluff" },
			yaml = { "yamllint" },
			toml = { "taplo" },
			markdown = { "markdownlint" },
		}

		-- Autocommand to automatically lint on file write
		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- Set PATH to include Mason's bin directory and prioritize Homebrew's Python
		-- This ensures formatters like black can be found and use the correct Python version
		local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
		local homebrew_bin = "/opt/homebrew/bin"
		local current_path = os.getenv("PATH") or ""
		vim.env.PATH = mason_bin .. ":" .. homebrew_bin .. ":" .. current_path

		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_after_save = {
				lsp_fallback = true,
				timeout_ms = 5000, -- Increased timeout for Python files (isort + black)
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 5000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

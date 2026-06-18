return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
		{ "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
		{ "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		-- Exclude heavy directories at the ripgrep level so they are never
		-- scanned, instead of letting them through and filtering in Lua after.
		local rg_excludes = {
			"--glob",
			"!**/.git/*",
			"--glob",
			"!**/node_modules/*",
			"--glob",
			"!**/.next/*",
			"--glob",
			"!**/dist/*",
			"--glob",
			"!**/build/*",
		}

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				file_ignore_patterns = { "%.git/", "node_modules/", "%.next/", "dist/", "build/" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
					},
				},
			},
			pickers = {
				find_files = {
					-- show hidden files (.env) and gitignored files, but skip the
					-- giant dirs so the picker opens instantly.
					hidden = true,
					no_ignore = true,
					find_command = vim.list_extend({ "rg", "--files", "--hidden", "--no-ignore" }, rg_excludes),
				},
				live_grep = {
					-- search hidden + gitignored files, minus the heavy dirs.
					additional_args = vim.list_extend({ "--hidden", "--no-ignore" }, rg_excludes),
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}

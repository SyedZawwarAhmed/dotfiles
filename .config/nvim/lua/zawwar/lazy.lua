local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "zawwar.plugins" },
	{ import = "zawwar.plugins.lsp" },
}, {
	checker = {
		enabled = false, -- don't poll git for plugin updates in the background
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		rtp = {
			-- disable unused built-in runtime plugins for faster startup
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

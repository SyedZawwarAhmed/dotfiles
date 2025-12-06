vim.opt.autoread = true

vim.api.nvim_create_autocmd({
	"FocusGained",
	"BufEnter",
	"CursorHold",
	"CursorHoldI",
	"TermClose",
	"TermLeave",
}, {
	command = "checktime",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
	callback = function()
		vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
	end,
})

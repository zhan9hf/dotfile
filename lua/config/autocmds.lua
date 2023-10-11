-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("some_indent", { clear = true }),
	pattern = {
		"cpp",
		"c",
		"lua",
		"ruby",
		"html",
		"javascript",
		"typescript",
		"css",
		"json",
		"vue",
		"vim",
		"yaml",
		"cmake",
	},
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

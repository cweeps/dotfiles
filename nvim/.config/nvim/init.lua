-- set colorscheme
vim.cmd.colorscheme("vim")
-- enable numbering
vim.opt.number = true
-- highlight current line
vim.opt.cursorline = true
-- set swapfile dir
vim.opt.directory = "./"
-- enable clipboard
vim.opt.clipboard = "unnamedplus"

-- custom statusline
vim.opt.statusline = "%n | %f %r    %m%=%{&filetype}  |  %l,%c    %P"

-- tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- open file on last position
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = {"*"},
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.api.nvim_exec("normal! g'\"",false)
		end
	end
})


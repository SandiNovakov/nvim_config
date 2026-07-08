vim.opt.clipboard = "unnamedplus"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--vim.opt.updatetime = 50 --taken from theprimagen's config, might be too fast.
--update: it was, in fact, too fast.

vim.opt.colorcolumn = "80"

vim.opt.list = true

vim.opt.listchars = { tab = "» ", trail = "·", space = "·" }

-- try utf-8 first, fall back to cp1250 so windows-1250 files (old
-- Central European sources) are detected correctly instead of being
-- misread as latin1/default (which "succeed" on any byte and would
-- otherwise shadow cp1250 if listed first).
vim.opt.fileencodings = { "ucs-bom", "utf-8", "cp1250", "default", "latin1" }

-- guard: remember the encoding a file was opened with, and refuse to
-- write it back under a different encoding unless explicitly confirmed,
-- so a cp1250 file never gets silently saved as utf-8 (or vice versa).
local encoding_guard = vim.api.nvim_create_augroup("EncodingGuard", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
	group = encoding_guard,
	callback = function(args)
		vim.b[args.buf].original_fileencoding = vim.bo[args.buf].fileencoding
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = encoding_guard,
	callback = function(args)
		local original = vim.b[args.buf].original_fileencoding
		local current = vim.bo[args.buf].fileencoding
		if original and current ~= "" and current ~= original and not vim.b[args.buf].allow_encoding_change then
			vim.notify(
				string.format(
					"Refusing to write: fileencoding changed from '%s' to '%s'. Run :AllowEncodingChange to confirm.",
					original,
					current
				),
				vim.log.levels.ERROR
			)
			error("encoding mismatch, write aborted")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = encoding_guard,
	callback = function(args)
		vim.b[args.buf].original_fileencoding = vim.bo[args.buf].fileencoding
		vim.b[args.buf].allow_encoding_change = nil
	end,
})

vim.api.nvim_create_user_command("AllowEncodingChange", function()
	vim.b.allow_encoding_change = true
	vim.notify("Next write will be allowed even if fileencoding changed.", vim.log.levels.WARN)
end, { desc = "Allow the next :w to change this buffer's fileencoding" })

vim.api.nvim_create_user_command("Cp1250", function()
	vim.cmd("edit ++enc=cp1250 " .. vim.fn.fnameescape(vim.fn.expand("%")))
end, { desc = "Reload the current file forcing windows-1250 encoding" })

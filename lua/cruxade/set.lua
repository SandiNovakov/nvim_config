vim.opt.clipboard = "unnamedplus"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.expandtab = true
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

--vim.opt.list = true

--vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", space = "·", }

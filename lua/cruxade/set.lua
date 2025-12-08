--config
local tab_width = 4 --num spaces for tabs, int.
--end config

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = tab_width
vim.opt.shiftwidth = tab_width

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50 --taken from theprimagen's config, might be too fast.

vim.opt.colorcolumn = "80"

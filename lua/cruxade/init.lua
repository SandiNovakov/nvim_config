print("hello from cruxade with love!")

vim.g.mapleader = " "

require("cruxade.set")
require("cruxade.lazy_init")

-- this should all go somewhere else tbh -- 
vim.cmd[[colorscheme tokyonight-night]]
require("ibl").setup({scope = {enabled = false}}) --setup for indent-blankline


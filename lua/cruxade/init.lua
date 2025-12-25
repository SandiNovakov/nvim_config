print("hello from cruxade with love!")

vim.g.mapleader = " "

require("cruxade.set")
require("cruxade.lazy_init")
require("cruxade.remap")

-- this should all go somewhere else tbh --
vim.cmd([[colorscheme tokyonight-night]])
--vim.cmd([[colorscheme gruber-darker]])

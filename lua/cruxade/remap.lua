-- moving stuff
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- deleting stuff without yank
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yank" })
vim.keymap.set("n", "x", '"_x', { desc = "Delete char (no yank)" })

-- saving
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- returning to normal mode
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- quick open terminal in vsp
vim.keymap.set("n", "<leader>t", ":vsp | term<CR><C-w><C-r>i", { desc = "Terminal in vertical split (right)" })

-- quick reload config
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- other useful stuff
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines while preserving cursor position" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

vim.keymap.set("n", "<leader>ls", ":Oil<CR>", { desc = "Open explorer" })

vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>fq", ":q!<CR>", { desc = "Fucking Quit" })
vim.keymap.set("n", "<leader>ffsq", ":qa!<CR>", { desc = "FOR FUCKS SAKE QUIT" })

vim.keymap.set("n", "<leader>nf", ":e %:h/", { desc = "New file in current directory" })

vim.keymap.set("n", "gg", "gg0", { desc = "gg" })
vim.keymap.set("n", "G", "G$", { desc = "A more sensible G" })

vim.keymap.set("n", "o", "o<esc>", { desc = "o but it doesn't enter insert mode" })
vim.keymap.set("n", "O", "O<esc>", { desc = "O but it doesn't enter insert mode" })

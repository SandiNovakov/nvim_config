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

-- allows inserting new lines without moving cursor
local function insert_line_below_stay()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_command("normal! o")
	vim.api.nvim_win_set_cursor(0, { line, col })
end

local function insert_line_above_stay()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_command("normal! O")
	vim.api.nvim_win_set_cursor(0, { line + 1, col }) -- Line increased because we inserted above
end

vim.keymap.set("n", "<A-o>", insert_line_below_stay, { desc = "Insert line below (stay)" })
vim.keymap.set("n", "<A-O>", insert_line_above_stay, { desc = "Insert line above (stay)" })

-- quick open terminal in vsp
vim.keymap.set("n", "<leader>t", ":vsp | term<CR><C-w><C-r>i", { desc = "Terminal in vertical split (right)" })

-- quick reload config
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- replace current word (NOT ciw!)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- other useful stuff
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines while preserving cursor position" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up with cursor centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

vim.keymap.set("n", "<leader>ls", ":Oil<CR>", { desc = "Open explorer" })

vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Exit" })
vim.keymap.set("n", "<leader>nf", ":e %:h/", { desc = "New file in current directory" })

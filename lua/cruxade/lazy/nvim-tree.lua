return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		-- must happen before nvim-tree (or netrw) loads
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 60,
			},
		})

		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
	end,
}

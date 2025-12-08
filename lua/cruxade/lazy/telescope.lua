return {
	'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
	dependencies = { 'nvim-lua/plenary.nvim' },

	config = function()
		require("telescope").setup({

			defaults = {
				mappings = {
					i = {
						["<C-j>"] = require('telescope.actions').move_selection_next,
						["<C-k>"] = require('telescope.actions').move_selection_previous,
						["<C-l>"] = require('telescope.actions').select_default,
					},
				},

			}})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	end
}

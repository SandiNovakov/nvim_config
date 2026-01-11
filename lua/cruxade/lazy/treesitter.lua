return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local lang = require("cruxade.lang")
		require("nvim-treesitter").setup({
			-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
			install_dir = vim.fn.stdpath("data") .. "/site",
			ensure_installed = lang.treesitter,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

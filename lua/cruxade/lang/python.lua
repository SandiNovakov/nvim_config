return {
	treesitter = { "python" },
	conform = {
		python = { "isort", "black" },
	},
	mason = {
		"isort", -- Python import sorter
		"black", -- Python formatter
		"pylint", -- Python linter
	},
	lsps = {
		"pyright", -- Python
	},
}

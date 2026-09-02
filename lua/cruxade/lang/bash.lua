return {
	treesitter = { "bash" },
	conform = {
		sh = { "shfmt" },
		bash = { "shfmt" },
	},
	mason = {
		"shfmt", -- Shell formatter
		"shellcheck", -- Shell script linter
	},
	lsps = {
		"bashls", -- Bash
	},
}

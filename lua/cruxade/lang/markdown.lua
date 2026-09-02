return {
	treesitter = { "markdown" },
	conform = {
		markdown = { "prettier" },
	},
	mason = {
		"prettier", -- JS/TS/HTML/CSS/JSON/Markdown/Vue
		"markdownlint", -- Markdown linter
	},
	lsps = {
		"marksman", -- Markdown
	},
}

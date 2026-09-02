return {
	treesitter = { "javascript", "jsdoc" },
	conform = {
		javascript = { "prettier" },
	},
	mason = {
		"prettier", -- JS/TS/HTML/CSS/JSON/Markdown/Vue
		"eslint_d", -- JavaScript/TypeScript linter
	},
	lsps = {
		"ts_ls", -- TypeScript/JavaScript
		"eslint", -- ESLint
	},
}

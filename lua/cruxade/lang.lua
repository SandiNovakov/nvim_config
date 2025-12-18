local treesitter = {
	"vimdoc",
	"lua",
	"bash",
	"python",
	"lua",
	"vim",
	"javascript",
	"typescript",
	"vue",
	"html",
	"css",
	"json",
	"yaml",
	"sql",
	"dockerfile",
	"gitignore",
}

local conform = {
	javascript = { "prettier" },
	typescript = { "prettier" },
	javascriptreact = { "prettier" },
	typescriptreact = { "prettier" },
	svelte = { "prettier" },
	css = { "prettier" },
	html = { "prettier" },
	json = { "prettier" },
	yaml = { "prettier" },
	markdown = { "prettier" },
	graphql = { "prettier" },
	lua = { "stylua" },
	python = { "isort", "black" },
}

local mason = {
	"prettier", -- prettier formatter
	"stylua", -- lua formatter
	"isort", -- python formatter
	"black", -- python formatter
	"pylint", -- python linter
	"eslint_d", -- js linter
}

local lsps = {
	"pyright",
	"ts_ls",        -- TypeScript / JavaScript
	"html",
	"cssls",
	"eslint",
	"jsonls",
	"yamlls",
	"dockerls",
	"bashls",
	"sqlls"
}

return {
	treesitter = treesitter,
	conform = conform,
	mason = mason,
	lsps = lsps
}

local treesitter = {
	-- Core languages
	"bash",
	"c",
	"cpp",
	"css",
	"dockerfile",
	"gitignore",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"python",
	"sql",
	"toml",
	"typescript",
	"vim",
	"vimdoc",
	"vue",
	"yaml",

	-- Vue/JS ecosystem
	"tsx",
	"jsdoc",
	"vue",

	-- Config files
	"yaml",
	"json",
	"toml",
	"dockerfile",
	"gitignore",
	"make",

	-- Shell/scripting
	"bash",
	"python",
	"lua",

	-- Markup
	"html",
	"css",
	"markdown",
}

local conform = {
	-- JavaScript/TypeScript
	javascript = { "prettier" },
	typescript = { "prettier" },

	-- Vue
	vue = { "prettier" },

	-- Web
	css = { "prettier" },
	html = { "prettier" },

	-- Data formats
	json = { "prettier" },
	yaml = { "prettier" },
	markdown = { "prettier" },

	-- Programming languages
	lua = { "stylua" },
	python = { "isort", "black" },
	c = { "clang-format" },
	cpp = { "clang-format" },

	-- Shell/scripting
	sh = { "shfmt" },
	bash = { "shfmt" },

	-- Config files
	--dockerfile = { "hadolint" },
	sql = { "sqlfluff" },
}

local mason = {
	-- Formatters
	"prettier", -- JS/TS/HTML/CSS/JSON/Markdown/Vue
	"stylua", -- Lua
	"isort", -- Python import sorter
	"black", -- Python formatter
	"clang-format", -- C/C++ formatter
	"shfmt", -- Shell formatter
	"sqlfluff", -- SQL formatter

	-- Linters
	"pylint", -- Python linter
	"eslint_d", -- JavaScript/TypeScript linter
	"shellcheck", -- Shell script linter
	--"hadolint", -- Dockerfile linter
	"cpplint", -- C++ linter
	"clangd", -- C/C++ language server (includes diagnostics)
	"markdownlint", -- Markdown linter

	-- Diagnostics/tools
	"codespell", -- Spell checker for code
}

local lsps = {
	-- Core programming languages
	"pyright", -- Python
	"ts_ls", -- TypeScript/JavaScript
	"clangd", -- C/C++
	"lua_ls", -- Lua
	"bashls", -- Bash
	"sqlls", -- SQL

	-- Web development
	"html", -- HTML
	"cssls", -- CSS
	"jsonls", -- JSON
	"yamlls", -- YAML
	"dockerls", -- Dockerfile
	"eslint", -- ESLint

	-- Markup/docs
	"marksman", -- Markdown
	"taplo", -- TOML

	-- Other
	"vimls", -- Vimscript
}

return {
	treesitter = treesitter,
	conform = conform,
	mason = mason,
	lsps = lsps,
}

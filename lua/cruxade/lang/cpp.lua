return {
	treesitter = { "cpp" },
	conform = {
		cpp = { "clang-format" },
	},
	mason = {
		"clang-format", -- C/C++ formatter
		"clangd", -- C/C++ language server (includes diagnostics)
		"cpplint", -- C++ linter
	},
	lsps = {
		"clangd", -- C/C++
	},
}

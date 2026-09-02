return {
	treesitter = { "c" },
	conform = {
		c = { "clang-format" },
	},
	mason = {
		"clang-format", -- C/C++ formatter
		"clangd", -- C/C++ language server (includes diagnostics)
	},
	lsps = {
		"clangd", -- C/C++
	},
}

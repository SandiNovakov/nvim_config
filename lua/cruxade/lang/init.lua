-- Aggregates per-language treesitter/conform/mason/lsp config from the
-- sibling files in this directory into the flat shape the lazy specs expect.
local languages = {
	"bash",
	"c",
	"cpp",
	"css",
	"dockerfile",
	"gdscript",
	"gitignore",
	"html",
	"javascript",
	"json",
	"lua",
	"make",
	"markdown",
	"pico8",
	"plsql",
	"python",
	"sql",
	"toml",
	"typescript",
	"vim",
	"vue",
	"yaml",
}

local treesitter = {}
local conform = {}
local mason = {
	"codespell", -- Spell checker for code
}
local lsps = {}

local function extend_unique(list, items)
	for _, item in ipairs(items) do
		if not vim.tbl_contains(list, item) then
			table.insert(list, item)
		end
	end
end

for _, name in ipairs(languages) do
	local lang = require("cruxade.lang." .. name)

	if lang.treesitter then
		extend_unique(treesitter, lang.treesitter)
	end

	if lang.conform then
		for ft, formatters in pairs(lang.conform) do
			conform[ft] = formatters
		end
	end

	if lang.mason then
		extend_unique(mason, lang.mason)
	end

	if lang.lsps then
		extend_unique(lsps, lang.lsps)
	end
end

return {
	treesitter = treesitter,
	conform = conform,
	mason = mason,
	lsps = lsps,
}

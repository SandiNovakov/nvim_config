print("hello from cruxade with love!")

vim.g.mapleader = " "

require("cruxade.set")
require("cruxade.lazy_init")
require("cruxade.remap")
require("cruxade.themes")

vim.api.nvim_create_user_command("GiveUsEyes", function()
	local groups = {
		"Normal",
		"NormalFloat",
		"SignColumn",
		"FoldColumn",
		"LineNr",
		"CursorLineNr",
		"EndOfBuffer",
	}

	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "NONE" })
	end
end, {})

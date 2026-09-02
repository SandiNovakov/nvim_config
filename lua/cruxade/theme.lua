-- ~/.config/nvim/after/plugin/theme.lua
local theme_file = vim.fn.stdpath("data") .. "/theme"

-- The name last passed to `:Theme`/set_theme, kept separately from
-- vim.g.colors_name since some colorschemes self-report the wrong name
-- (e.g. pico8-darker used to report itself as "pico8").
local current_theme = "habamax"

-- Helper function to change theme
local function set_theme(name)
	local ok = pcall(vim.cmd.colorscheme, name)
	if ok then
		current_theme = name
		print("Theme set to: " .. name)
	else
		print("Theme " .. name .. " not found!")
	end
end
_G.set_theme = set_theme

-- Load theme on startup
local file = io.open(theme_file, "r")
if file then
	local saved_theme = file:read("*line")
	file:close()

	if saved_theme then
		set_theme(saved_theme)
	end
else
	-- First run or no saved theme
	set_theme("habamax")
end

-- Save current theme on VimLeave
vim.api.nvim_create_autocmd("VimLeave", {
	callback = function()
		local out = io.open(theme_file, "w")
		if out then
			out:write(current_theme)
			out:close()
		end
	end,
})

vim.api.nvim_create_user_command("Theme", function(opts)
	set_theme(opts.args)
end, {
	nargs = 1,
	complete = function(arg_lead, cmd_line, cursor_pos)
		-- Get all runtime paths
		local runtime_paths = vim.api.nvim_get_runtime_file("colors/*.vim", true)
		local lua_themes = vim.api.nvim_get_runtime_file("lua/colors/*.lua", true)

		local themes = {}

		-- Extract theme names from .vim files
		for _, path in ipairs(runtime_paths) do
			local theme = path:match(".*/([^/]+)%.vim$")
			if theme and (arg_lead == "" or theme:lower():find(arg_lead:lower(), 1, true)) then
				table.insert(themes, theme)
			end
		end

		-- Extract theme names from .lua files
		for _, path in ipairs(lua_themes) do
			local theme = path:match(".*/([^/]+)%.lua$")
			if theme and (arg_lead == "" or theme:lower():find(arg_lead:lower(), 1, true)) then
				table.insert(themes, theme)
			end
		end

		-- Also include built-in themes
		local builtin = vim.fn.getcompletion(arg_lead .. "*", "color")
		for _, theme in ipairs(builtin) do
			if not vim.tbl_contains(themes, theme) then
				table.insert(themes, theme)
			end
		end

		-- Remove duplicates and sort
		themes = vim.fn.uniq(vim.fn.sort(themes))
		return themes
	end,
})

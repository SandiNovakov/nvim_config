-- ~/.config/nvim/after/plugin/theme.lua
local theme_file = vim.fn.stdpath("data") .. "/theme"

-- Save current theme on VimLeave
vim.api.nvim_create_autocmd("VimLeave", {
	callback = function()
		local current_theme = vim.g.colors_name or "default"
		local file = io.open(theme_file, "w")
		if file then
			file:write(current_theme)
			file:close()
		end
	end,
})

-- Load theme on startup
local file = io.open(theme_file, "r")
if file then
	local saved_theme = file:read("*line")
	file:close()

	if saved_theme then
		-- Try to load saved theme, fallback if it fails
		local ok, _ = pcall(vim.cmd.colorscheme, saved_theme)
		if not ok then
			vim.cmd.colorscheme("habamax") -- Your fallback theme
		end
	end
else
	-- First run or no saved theme
	vim.cmd.colorscheme("habamax")
end

-- Helper function to change theme
function _G.set_theme(name)
	local ok, _ = pcall(vim.cmd.colorscheme, name)
	if ok then
		print("Theme set to: " .. name)
	else
		print("Theme " .. name .. " not found!")
	end
end

-- Create a user command
vim.api.nvim_create_user_command("Theme", function(opts)
	set_theme(opts.args)
end, { nargs = 1 })

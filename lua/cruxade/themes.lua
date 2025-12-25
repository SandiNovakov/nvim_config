-- sets default theme
--vim.cmd([[colorscheme tokyonight-night]])

local function setup_auto_theme()
	-- Filetype to theme mapping
	local theme_map = {
		-- Add your specific filetype themes here
		c = "gruber-darker",
	}

	-- Fallback/default theme
	local default_theme = "tokyonight-night"

	-- Track current theme to avoid unnecessary changes
	local current_theme = nil

	-- Function to set theme based on filetype
	local function set_theme_by_filetype()
		-- Ignore special buffer types
		local buftype = vim.bo.buftype
		if buftype ~= "" then
			-- Skip terminal, netrw, oil, etc.
			return
		end

		-- Ignore netrw (file explorer) and other file explorers
		local filetype = vim.bo.filetype
		if filetype == "netrw" or filetype == "oil" or filetype == "" then
			return
		end

		-- Get theme from map, fallback to default
		local theme = theme_map[filetype] or default_theme

		-- Only change if theme is different
		if theme ~= current_theme then
			current_theme = theme

			-- Safely set the colorscheme
			local success, err = pcall(vim.cmd, "colorscheme " .. theme)
			if not success then
				vim.notify("Failed to load theme: " .. theme, vim.log.levels.WARN)
				-- Fallback to default
				pcall(vim.cmd, "colorscheme " .. default_theme)
				current_theme = default_theme
			end
		end
	end

	-- Set initial theme
	vim.schedule(function()
		vim.cmd("colorscheme " .. default_theme)
		current_theme = default_theme
	end)

	-- Set up autocmds to trigger when buffer is entered
	vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
		callback = set_theme_by_filetype,
		desc = "Set theme based on filetype (ignores special buffers)",
	})
end

-- Call the setup function
setup_auto_theme()

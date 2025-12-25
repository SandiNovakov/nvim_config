local function setup_auto_theme()
	-- Default filetype to theme mapping
	local default_theme_map = {}

	-- Default fallback theme
	local default_fallback_theme = "tokyonight-night"

	-- Track current theme to avoid unnecessary changes
	local current_theme = nil
	local current_config_source = nil -- Track if using project config

	-- Function to load project-specific theme config
	local function load_project_config()
		local cwd = vim.fn.getcwd()
		local config_file = cwd .. "/.nvim_theme"

		if vim.fn.filereadable(config_file) == 1 then
			-- Try to load the config file
			local success, config = pcall(dofile, config_file)

			if success and type(config) == "table" then
				-- Validate and use project config
				local theme_map = config.theme_map or config
				local fallback_theme = config.default_theme or config.fallback_theme or default_fallback_theme

				-- Ensure theme_map is a table
				if type(theme_map) ~= "table" then
					theme_map = default_theme_map
				end

				return {
					theme_map = theme_map,
					fallback_theme = fallback_theme,
					source = "project",
					path = config_file,
				}
			else
				vim.notify("Failed to parse .nvim_theme file", vim.log.levels.WARN)
			end
		end

		-- Return default config
		return {
			theme_map = default_theme_map,
			fallback_theme = default_fallback_theme,
			source = "default",
		}
	end

	-- Function to get appropriate config based on directory
	local function get_config()
		local config = load_project_config()

		-- Optional: Print notification when switching config sources
		if config.source ~= current_config_source then
			current_config_source = config.source
		end

		return config
	end

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

		-- Load appropriate config (project or default)
		local config = get_config()
		local theme_map = config.theme_map
		local fallback_theme = config.fallback_theme

		-- Get theme from map, fallback to default
		local theme = theme_map[filetype] or fallback_theme

		-- Only change if theme is different
		if theme ~= current_theme then
			current_theme = theme

			-- Safely set the colorscheme
			local success, err = pcall(vim.cmd, "colorscheme " .. theme)
			if not success then
				vim.notify("Failed to load theme: " .. theme, vim.log.levels.WARN)
				-- Fallback to hardcoded default
				pcall(vim.cmd, "colorscheme " .. default_fallback_theme)
				current_theme = default_fallback_theme
			end
		end
	end

	-- Set initial theme
	vim.schedule(function()
		local config = get_config()
		vim.cmd("colorscheme " .. config.fallback_theme)
		current_theme = config.fallback_theme
	end)

	-- Set up autocmds to trigger when buffer is entered or directory changes
	vim.api.nvim_create_autocmd({ "BufEnter", "FileType", "DirChanged" }, {
		callback = set_theme_by_filetype,
		desc = "Set theme based on filetype with project config support",
	})
end

-- Call the setup function
setup_auto_theme()

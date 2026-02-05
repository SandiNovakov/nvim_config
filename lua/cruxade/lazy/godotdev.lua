return {
	"dpowling/godot-lsp.nvim",
	ft = "gdscript",
	opts = {
		-- your configuration here (optional)
	},

	config = function()
		require("godot-lsp").setup({
			port = 6005, -- Primary port to connect to
			fallback_port = 6006, -- Fallback port if primary fails
			auto_start = true, -- Automatically start LSP when opening GDScript files
			debug = false, -- Enable debug output
			silent = true, -- Only show error messages (set to false for startup info)
		})
	end,
}

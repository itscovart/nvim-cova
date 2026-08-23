local colors = require("core.colors")

return {
	"nvim-tree/nvim-tree.lua",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("nvim-tree").setup({
			-------------------------------------------------
			-- View
			-------------------------------------------------

			view = {
				width = 34,
				relativenumber = true,
				signcolumn = "no",
			},

			-------------------------------------------------
			-- Renderer
			-------------------------------------------------

			renderer = {
				group_empty = true,

				root_folder_label = false,

				highlight_opened_files = "name",

				indent_markers = {
					enable = false,
				},

				icons = {
					show = {
						folder_arrow = false,
					},
				},
			},

			-------------------------------------------------
			-- Behavior
			-------------------------------------------------

			update_focused_file = {
				enable = true,
				update_root = false,
			},

			filters = {
				enable = false,
			},

			git = {
				ignore = false,
			},
		})

		-------------------------------------------------
		-- Highlights
		-------------------------------------------------
	end,
}

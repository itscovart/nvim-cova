local colors = require("core.colors")

return {
	"nvimdev/dashboard-nvim",

	event = "VimEnter",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local db = require("dashboard")

		db.setup({
			theme = "doom",

			config = {
				-------------------------------------------------
				-- HEADER
				-------------------------------------------------

				header = {
					"",
					"",
					"",
					"P R O J E C T   P A N T H E R",
					"",
					"Silent tools for focused work.",
					"",
					"",
				},

				-------------------------------------------------
				-- CENTER
				-------------------------------------------------

				center = {
					{
						icon = "  ",
						desc = "New File",
						action = "ene | startinsert",
						key = "n",
					},

					{
						icon = "  ",
						desc = "Find File",
						action = "Telescope find_files",
						key = "f",
					},

					{
						icon = "  ",
						desc = "Recent Files",
						action = "Telescope oldfiles",
						key = "r",
					},

					{
						icon = "  ",
						desc = "Projects",
						action = "Telescope find_files cwd=~/Documents/Coding",
						key = "p",
					},

					{
						icon = "󰗼  ",
						desc = "Quit",
						action = "qa",
						key = "q",
					},
				},

				-------------------------------------------------
				-- FOOTER
				-------------------------------------------------

				footer = {
					"",
					"",
					"Build quietly.",
				},
			},
		})
	end,
}

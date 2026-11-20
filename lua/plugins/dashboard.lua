return {
	"nvimdev/dashboard-nvim",

	event = "VimEnter",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local dashboard = require("dashboard")
		local version = vim.version()

		-------------------------------------------------
		-- HIGHLIGHTS
		-------------------------------------------------

		local highlights = {
			DashboardHeader = "Title",
			DashboardCenter = "Normal",
			DashboardShortCut = "Function",
			DashboardFooter = "Comment",
		}

		for group, link in pairs(highlights) do
			vim.api.nvim_set_hl(0, group, {
				link = link,
			})
		end

		-------------------------------------------------
		-- DASHBOARD
		-------------------------------------------------

		dashboard.setup({
			theme = "doom",

			config = {

				-------------------------------------------------
				-- HEADER
				-------------------------------------------------

				header = {
					"",
					"",
					"██████╗  █████╗ ███╗   ██╗████████╗██╗  ██╗███████╗██████╗",
					"██╔══██╗██╔══██╗████╗  ██║╚══██╔══╝██║  ██║██╔════╝██╔══██╗",
					"██████╔╝███████║██╔██╗ ██║   ██║   ███████║█████╗  ██████╔╝",
					"██╔═══╝ ██╔══██║██║╚██╗██║   ██║   ██╔══██║██╔══╝  ██╔══██╗",
					"██║     ██║  ██║██║ ╚████║   ██║   ██║  ██║███████╗██║  ██║",
					"╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝",
					"",
					"ENGINEERING  /  DEVELOPMENT  /  RESEARCH",
					"",
					"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
					"",
				},

				-------------------------------------------------
				-- CENTER
				-------------------------------------------------

				center = {
					{
						icon = "󰝒  ",
						desc = "New File",
						key = "n",
						action = "ene | startinsert",
					},
					{
						icon = "󰱼  ",
						desc = "Find File",
						key = "f",
						action = "Telescope find_files",
					},
					{
						icon = "󰈞  ",
						desc = "Live Grep",
						key = "g",
						action = "Telescope live_grep",
					},
					{
						icon = "󰋚  ",
						desc = "Recent Files",
						key = "r",
						action = "Telescope oldfiles",
					},
					{
						icon = "󰉋  ",
						desc = "Projects",
						key = "p",
						action = "Telescope find_files cwd=~/Documents/Coding",
					},
					{
						icon = "󰒲  ",
						desc = "Neovim Configuration",
						key = "c",
						action = "edit ~/.config/nvim/init.lua",
					},
					{
						icon = "󰏖  ",
						desc = "Plugin Manager",
						key = "l",
						action = "Lazy",
					},
					{
						icon = "󰗼  ",
						desc = "Quit",
						key = "q",
						action = "qa",
					},
				},

				-------------------------------------------------
				-- FOOTER
				-------------------------------------------------

				footer = function()
					return {
						"",
						"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
						"",
						"BUILD QUIETLY. THINK DEEPLY.",
						"",
						os.date("%A, %d %B %Y"),
						"",
						string.format(
							"NEOVIM %d.%d.%d  /  READY",
							version.major,
							version.minor,
							version.patch
						),
						"",
					}
				end,
			},
		})
	end,
}

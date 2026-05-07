local ok_sys, sys = pcall(require, "core.system")
if ok_sys and sys.setup then
	sys.setup({ interval_ms = 1500 })
end

return {
	"nvim-lualine/lualine.nvim",

	config = function()
		vim.opt.fillchars = { eob = " " }

		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
		}

		local filename = {
			"filename",
			file_status = true,
			path = 1, -- 0 = filename, 1 = relative, 2 = absolute
			symbols = {
				modified = "●",
				readonly = "",
				unnamed = "[No Name]",
			},
		}

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn", "info", "hint" },
			symbols = {
				error = " ",
				warn = " ",
				info = " ",
				hint = "󰌵 ",
			},
			colored = true,
			update_in_insert = false,
			always_visible = false,
			cond = hide_in_width,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = {
				added = " ",
				modified = " ",
				removed = " ",
			},
			cond = hide_in_width,
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,

				theme = {
					normal = {
						a = { fg = "#7aa2f7", bg = "NONE", gui = "bold" },
						b = { fg = "#c0caf5", bg = "NONE" },
						c = { fg = "#a9b1d6", bg = "NONE" },
					},

					insert = {
						a = { fg = "#9ece6a", bg = "NONE", gui = "bold" },
					},

					visual = {
						a = { fg = "#bb9af7", bg = "NONE", gui = "bold" },
					},

					replace = {
						a = { fg = "#f7768e", bg = "NONE", gui = "bold" },
					},

					command = {
						a = { fg = "#e0af68", bg = "NONE", gui = "bold" },
					},

					inactive = {
						a = { fg = "#565f89", bg = "NONE" },
						b = { fg = "#565f89", bg = "NONE" },
						c = { fg = "#565f89", bg = "NONE" },
					},
				},

				section_separators = {
					left = "",
					right = "",
				},

				component_separators = {
					left = "│",
					right = "│",
				},

				disabled_filetypes = {
					"alpha",
					"dashboard",
					"neo-tree",
				},

				always_divide_middle = true,
				globalstatus = true,
			},

			sections = {
				lualine_a = { mode },

				lualine_b = {
					{
						"branch",
						icon = "",
					},
				},

				lualine_c = { filename },

				lualine_x = {
					diagnostics,
					diff,

					{
						function()
							if ok_sys then
								return " " .. sys.cpu():gsub("%%", "%%%%")
							end
							return ""
						end,
					},

					{
						function()
							if ok_sys then
								return "󰍛 " .. sys.ram():gsub("%%", "%%%%")
							end
							return ""
						end,
					},
				},

				lualine_y = {
					{
						"location",
						icon = "󰍉",
					},

					{
						function()
							return " " .. os.date("%H:%M")
						end,
					},
				},

				lualine_z = {
					{
						"progress",
						icon = "󰦨",
					},
				},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = {
					{
						"location",
						padding = 0,
					},
				},
				lualine_y = {},
				lualine_z = {},
			},

			tabline = {},

			extensions = {
				"fugitive",
				"neo-tree",
				"lazy",
			},
		})
	end,
}

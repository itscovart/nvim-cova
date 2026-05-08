local ok_sys, sys = pcall(require, "core.system")

if ok_sys and sys.setup then
	sys.setup({ interval_ms = 1500 })
end

return {
	"nvim-lualine/lualine.nvim",

	config = function()

		-------------------------------------------------
		-- Cleaner end of buffer
		-------------------------------------------------

		vim.opt.fillchars = { eob = " " }

		-------------------------------------------------
		-- Components
		-------------------------------------------------

		local mode = {
			"mode",

			fmt = function(str)
				return " " .. str
			end,
		}

		local filename = {
			"filename",

			file_status = true,

			path = 1,

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

			sections = {
				"error",
				"warn",
				"info",
				"hint",
			},

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

		-------------------------------------------------
		-- Setup
		-------------------------------------------------

		require("lualine").setup({

			options = {

				icons_enabled = true,

				-------------------------------------------------
				-- 🌸 Sakura pastel transparent theme
				-------------------------------------------------

				theme = {

					normal = {
						a = {
							fg = "#f2b5d4",
							bg = "NONE",
							gui = "bold",
						},

						b = {
							fg = "#ddc7a1",
							bg = "NONE",
						},

						c = {
							fg = "#bdae93",
							bg = "NONE",
						},
					},

					insert = {
						a = {
							fg = "#a6d189",
							bg = "NONE",
							gui = "bold",
						},

						b = {
							fg = "#ddc7a1",
							bg = "NONE",
						},

						c = {
							fg = "#bdae93",
							bg = "NONE",
						},
					},

					visual = {
						a = {
							fg = "#cba6f7",
							bg = "NONE",
							gui = "bold",
						},

						b = {
							fg = "#ddc7a1",
							bg = "NONE",
						},

						c = {
							fg = "#bdae93",
							bg = "NONE",
						},
					},

					replace = {
						a = {
							fg = "#ea999c",
							bg = "NONE",
							gui = "bold",
						},

						b = {
							fg = "#ddc7a1",
							bg = "NONE",
						},

						c = {
							fg = "#bdae93",
							bg = "NONE",
						},
					},

					command = {
						a = {
							fg = "#f9e2af",
							bg = "NONE",
							gui = "bold",
						},

						b = {
							fg = "#ddc7a1",
							bg = "NONE",
						},

						c = {
							fg = "#bdae93",
							bg = "NONE",
						},
					},

					inactive = {
						a = {
							fg = "#7c6f64",
							bg = "NONE",
						},

						b = {
							fg = "#7c6f64",
							bg = "NONE",
						},

						c = {
							fg = "#7c6f64",
							bg = "NONE",
						},
					},
				},

				-------------------------------------------------
				-- Minimal separators
				-------------------------------------------------

				section_separators = {
					left = "",
					right = "",
				},

				component_separators = {
					left = "│",
					right = "│",
				},

				-------------------------------------------------
				-- Disable on these
				-------------------------------------------------

				disabled_filetypes = {
					"alpha",
					"dashboard",
					"neo-tree",
				},

				always_divide_middle = true,
				globalstatus = true,
			},

			-------------------------------------------------
			-- Active sections
			-------------------------------------------------

			sections = {

				lualine_a = {
					mode,
				},

				lualine_b = {
					{
						"branch",
						icon = "",
					},
				},

				lualine_c = {
					filename,
				},

				lualine_x = {

					diagnostics,
					diff,

					-------------------------------------------------
					-- CPU
					-------------------------------------------------

					{
						function()

							if ok_sys then
								return " " ..
									sys.cpu():gsub("%%", "%%%%")
							end

							return ""

						end,

						color = {
							fg = "#f2b5d4",
						},
					},

					-------------------------------------------------
					-- RAM
					-------------------------------------------------

					{
						function()

							if ok_sys then
								return "󰍛 " ..
									sys.ram():gsub("%%", "%%%%")
							end

							return ""

						end,

						color = {
							fg = "#ddb6f2",
						},
					},
				},

				lualine_y = {

					{
						"location",
						icon = "󰍉",
					},

					{
						function()
							return " " ..
								os.date("%H:%M")
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

			-------------------------------------------------
			-- Inactive sections
			-------------------------------------------------

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

			-------------------------------------------------
			-- Extensions
			-------------------------------------------------

			tabline = {},

			extensions = {
				"fugitive",
				"neo-tree",
				"lazy",
			},
		})
    -------------------------------------------------
    -- Transparent statusline
    -------------------------------------------------

    vim.cmd([[
      highlight StatusLine guibg=NONE
      highlight StatusLineNC guibg=NONE
    ]])
	end,
}

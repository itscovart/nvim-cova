local colors = require("core.colors")

return {
	{
		"danfry1/lume",

		lazy = false,
		priority = 1000,

		config = function()
			require("lume").setup({
				transparent = false,
				italics = true,

				palette_overrides = {
					backgrounds = {
						crust = colors.bg,
						mantle = colors.bg_alt,
						base = colors.bg,
						surface0 = colors.surface,
						surface1 = colors.surface_alt,
					},

					foregrounds = {
						text = colors.foreground,
						subtext = colors.foreground_soft,
						overlay = colors.foreground_dark,
						comment = colors.muted,
					},

					accents = {
						lavender = colors.primary,
						rose = colors.accent,
						peach = colors.info,
						sage = colors.secondary,
						sky = colors.info,
						teal = colors.secondary,
						ember = colors.danger,
						honey = colors.warning,
					},
				},

				custom_highlights = function(lume_colors)
					return {
						-- ============================================
						-- EDITOR
						-- ============================================

						Normal = {
							fg = colors.foreground,
							bg = colors.bg,
						},

						NormalNC = {
							fg = colors.foreground_soft,
							bg = colors.bg,
						},

						EndOfBuffer = {
							fg = colors.bg,
							bg = colors.bg,
						},

						CursorLine = {
							bg = colors.cursorline,
						},

						CursorColumn = {
							bg = colors.cursorline,
						},

						ColorColumn = {
							bg = colors.surface,
						},

						-- ============================================
						-- NUMERACIÓN
						-- ============================================

						LineNr = {
							fg = colors.muted,
						},

						CursorLineNr = {
							fg = colors.primary,
							bold = true,
						},

						-- ============================================
						-- SELECCIÓN / SEARCH
						-- ============================================

						Visual = {
							bg = colors.selection,
						},

						Search = {
							fg = colors.bg,
							bg = colors.secondary,
							bold = true,
						},

						IncSearch = {
							fg = colors.bg,
							bg = colors.primary,
							bold = true,
						},

						-- ============================================
						-- FLOATING WINDOWS
						-- ============================================

						NormalFloat = {
							fg = colors.foreground,
							bg = colors.surface,
						},

						FloatBorder = {
							fg = colors.border,
							bg = colors.surface,
						},

						FloatTitle = {
							fg = colors.primary,
							bg = colors.surface,
							bold = true,
						},

						-- ============================================
						-- POPUP MENU
						-- ============================================

						Pmenu = {
							fg = colors.foreground,
							bg = colors.surface,
						},

						PmenuSel = {
							fg = colors.foreground,
							bg = colors.selection,
							bold = true,
						},

						PmenuSbar = {
							bg = colors.surface_alt,
						},

						PmenuThumb = {
							bg = colors.muted,
						},

						-- ============================================
						-- SPLITS
						-- ============================================

						WinSeparator = {
							fg = colors.border,
							bg = "NONE",
						},

						-- ============================================
						-- STATUSLINE
						-- ============================================

						StatusLine = {
							fg = colors.foreground_soft,
							bg = "NONE",
						},

						StatusLineNC = {
							fg = colors.muted,
							bg = "NONE",
						},

						-- ============================================
						-- DIAGNÓSTICOS
						-- ============================================

						DiagnosticError = {
							fg = colors.danger,
						},

						DiagnosticWarn = {
							fg = colors.warning,
						},

						DiagnosticInfo = {
							fg = colors.info,
						},

						DiagnosticHint = {
							fg = colors.hint,
						},

						DiagnosticUnderlineError = {
							undercurl = true,
							sp = colors.danger,
						},

						DiagnosticUnderlineWarn = {
							undercurl = true,
							sp = colors.warning,
						},

						DiagnosticUnderlineInfo = {
							undercurl = true,
							sp = colors.info,
						},

						DiagnosticUnderlineHint = {
							undercurl = true,
							sp = colors.hint,
						},

						-- ============================================
						-- GIT
						-- ============================================

						GitSignsAdd = {
							fg = colors.git_add,
						},

						GitSignsChange = {
							fg = colors.git_change,
						},

						GitSignsDelete = {
							fg = colors.git_delete,
						},

						-- ============================================
						-- COMENTARIOS
						-- ============================================

						Comment = {
							fg = colors.foreground_dark,
							italic = true,
						},

						-- ============================================
						-- TREESITTER — PANTHER
						-- ============================================

						["@keyword"] = {
							fg = colors.primary,
							bold = true,
						},

						["@keyword.function"] = {
							fg = colors.primary,
							bold = true,
						},

						["@keyword.return"] = {
							fg = colors.primary,
							bold = true,
						},

						["@keyword.import"] = {
							fg = colors.primary,
							bold = true,
						},

						["@keyword.operator"] = {
							fg = colors.primary,
						},

						["@function"] = {
							fg = colors.accent,
						},

						["@function.call"] = {
							fg = colors.accent,
						},

						["@function.builtin"] = {
							fg = colors.accent,
						},

						["@method"] = {
							fg = colors.accent,
						},

						["@method.call"] = {
							fg = colors.accent,
						},

						["@string"] = {
							fg = colors.secondary,
						},

						["@string.escape"] = {
							fg = colors.accent,
						},

						["@type"] = {
							fg = colors.info,
						},

						["@type.builtin"] = {
							fg = colors.info,
						},

						["@constructor"] = {
							fg = colors.info,
							bold = true,
						},

						["@class"] = {
							fg = colors.info,
							bold = true,
						},

						["@number"] = {
							fg = colors.warning,
						},

						["@boolean"] = {
							fg = colors.primary,
							bold = true,
						},

						["@constant"] = {
							fg = colors.hint,
						},

						["@constant.builtin"] = {
							fg = colors.hint,
						},

						["@variable"] = {
							fg = colors.foreground,
						},

						["@variable.builtin"] = {
							fg = colors.primary,
						},

						["@parameter"] = {
							fg = colors.foreground_soft,
						},

						["@operator"] = {
							fg = colors.accent,
						},

						["@property"] = {
							fg = colors.secondary,
						},

						["@field"] = {
							fg = colors.secondary,
						},

						["@module"] = {
							fg = colors.info,
						},

						["@namespace"] = {
							fg = colors.info,
						},

						["@punctuation.bracket"] = {
							fg = colors.foreground_soft,
						},

						["@punctuation.delimiter"] = {
							fg = colors.foreground_dark,
						},

						-- ============================================
						-- LSP REFERENCES
						-- ============================================

						LspReferenceText = {
							bg = colors.selection,
						},

						LspReferenceRead = {
							bg = colors.selection,
						},

						LspReferenceWrite = {
							bg = colors.selection,
						},

						-- ============================================
						-- FOLDING
						-- ============================================

						Folded = {
							fg = colors.foreground_dark,
							bg = colors.surface,
						},

						FoldColumn = {
							fg = colors.muted,
							bg = colors.bg,
						},
					}
				end,
			})

			vim.cmd.colorscheme("lume")
		end,
	},
}

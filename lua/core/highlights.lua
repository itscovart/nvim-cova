local colors = require("core.colors")

local M = {}

local function set(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
	-- ============================================
	-- EDITOR
	-- ============================================

	set("Normal", { fg = colors.foreground, bg = colors.bg })
	set("NormalNC", { fg = colors.foreground_soft, bg = colors.bg })
	set("CursorLine", { bg = colors.cursorline })
	set("CursorColumn", { bg = colors.cursorline })
	set("LineNr", { fg = colors.muted })
	set("CursorLineNr", { fg = colors.primary, bold = true })
	set("SignColumn", { bg = colors.bg })
	set("ColorColumn", { bg = colors.bg_alt })
	set("Visual", { bg = colors.selection })

	set("Search", {
		fg = colors.bg,
		bg = colors.warning,
		bold = true,
	})

	set("IncSearch", {
		fg = colors.bg,
		bg = colors.primary,
		bold = true,
	})

	set("MatchParen", {
		fg = colors.accent,
		bg = colors.surface_alt,
		bold = true,
	})

	set("Cursor", {
		fg = colors.bg,
		bg = colors.primary,
	})

	-- ============================================
	-- TRADITIONAL SYNTAX
	-- ============================================

	local syntax = {
		Comment = { fg = colors.comment, italic = true },
		Constant = { fg = colors.constant },
		String = { fg = colors.string },
		Character = { fg = colors.string },
		Number = { fg = colors.number },
		Boolean = { fg = colors.constant, bold = true },
		Float = { fg = colors.number },

		Identifier = { fg = colors.variable },
		Function = { fg = colors.function_color, bold = true },

		Statement = { fg = colors.keyword },
		Conditional = { fg = colors.keyword, bold = true },
		Repeat = { fg = colors.keyword, bold = true },
		Label = { fg = colors.keyword },
		Operator = { fg = colors.operator },
		Keyword = { fg = colors.keyword, bold = true },
		Exception = { fg = colors.keyword },

		PreProc = { fg = colors.accent },
		Include = { fg = colors.accent },
		Define = { fg = colors.accent },
		Macro = { fg = colors.accent },
		PreCondit = { fg = colors.accent },

		Type = { fg = colors.type },
		StorageClass = { fg = colors.keyword },
		Structure = { fg = colors.type },
		Typedef = { fg = colors.type },

		Special = { fg = colors.accent },
		SpecialChar = { fg = colors.constant },
		Tag = { fg = colors.keyword },
		Delimiter = { fg = colors.foreground_soft },
		SpecialComment = { fg = colors.comment, italic = true },

		Underlined = { underline = true },
		Error = { fg = colors.danger, bold = true },
		Todo = { fg = colors.bg, bg = colors.warning, bold = true },
	}

	for group, opts in pairs(syntax) do
		set(group, opts)
	end

	-- ============================================
	-- TREESITTER
	-- ============================================

	local treesitter = {
		-- Variables
		["@variable"] = { fg = colors.variable },
		["@variable.builtin"] = { fg = colors.accent, italic = true },
		["@variable.parameter"] = { fg = colors.parameter },
		["@variable.member"] = { fg = colors.property },
		["@parameter"] = { fg = colors.parameter },
		["@field"] = { fg = colors.property },
		["@property"] = { fg = colors.property },

		-- Functions
		["@function"] = { fg = colors.function_color, bold = true },
		["@function.definition"] = { fg = colors.function_color, bold = true },
		["@function.call"] = { fg = colors.function_color },
		["@function.builtin"] = { fg = colors.accent, italic = true },
		["@function.method"] = { fg = colors.function_color, bold = true },
		["@function.method.call"] = { fg = colors.function_color },
		["@method"] = { fg = colors.function_color },

		-- Keywords
		["@keyword"] = { fg = colors.keyword, bold = true },
		["@keyword.function"] = { fg = colors.keyword, bold = true },
		["@keyword.return"] = { fg = colors.keyword, bold = true },
		["@keyword.operator"] = { fg = colors.operator },
		["@keyword.import"] = { fg = colors.keyword },
		["@keyword.conditional"] = { fg = colors.keyword, bold = true },
		["@keyword.repeat"] = { fg = colors.keyword, bold = true },
		["@keyword.exception"] = { fg = colors.keyword },
		["@conditional"] = { fg = colors.keyword },
		["@repeat"] = { fg = colors.keyword },
		["@exception"] = { fg = colors.keyword },

		-- Strings
		["@string"] = { fg = colors.string },
		["@string.documentation"] = { fg = colors.comment, italic = true },
		["@string.escape"] = { fg = colors.accent, bold = true },
		["@string.special"] = { fg = colors.accent },
		["@character"] = { fg = colors.string },

		-- Numbers and constants
		["@number"] = { fg = colors.number },
		["@number.float"] = { fg = colors.number },
		["@boolean"] = { fg = colors.constant, bold = true },
		["@constant"] = { fg = colors.constant },
		["@constant.builtin"] = { fg = colors.constant, italic = true },

		-- Types
		["@type"] = { fg = colors.type },
		["@type.builtin"] = { fg = colors.type, italic = true },
		["@type.definition"] = { fg = colors.type, bold = true },
		["@constructor"] = { fg = colors.type, bold = true },
		["@module"] = { fg = colors.accent },
		["@namespace"] = { fg = colors.accent },
		["@attribute"] = { fg = colors.accent },

		-- Operators and punctuation
		["@operator"] = { fg = colors.operator },
		["@punctuation.delimiter"] = { fg = colors.foreground_soft },
		["@punctuation.bracket"] = { fg = colors.foreground_soft },
		["@punctuation.special"] = { fg = colors.accent },

		-- Comments
		["@comment"] = { fg = colors.comment, italic = true },
		["@comment.todo"] = { fg = colors.bg, bg = colors.warning, bold = true },

		-- Preprocessor
		["@preproc"] = { fg = colors.accent },
		["@define"] = { fg = colors.accent },

		-- HTML / JSX
		["@tag"] = { fg = colors.keyword },
		["@tag.attribute"] = { fg = colors.property },
		["@tag.delimiter"] = { fg = colors.foreground_soft },

		-- Markdown
		["@markup.heading"] = { fg = colors.primary, bold = true },
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.link"] = { fg = colors.info, underline = true },
		["@markup.raw"] = { fg = colors.string },
		["@markup.list"] = { fg = colors.accent },
	}

	for group, opts in pairs(treesitter) do
		set(group, opts)
	end

	-- ============================================
	-- LSP SEMANTIC TOKENS
	-- ============================================

	local semantic = {
		["@lsp.type.variable"] = colors.variable,
		["@lsp.type.parameter"] = colors.parameter,
		["@lsp.type.property"] = colors.property,
		["@lsp.type.function"] = colors.function_color,
		["@lsp.type.method"] = colors.function_color,
		["@lsp.type.class"] = colors.type,
		["@lsp.type.struct"] = colors.type,
		["@lsp.type.interface"] = colors.type,
		["@lsp.type.enum"] = colors.type,
		["@lsp.type.enumMember"] = colors.constant,
		["@lsp.type.type"] = colors.type,
		["@lsp.type.typeParameter"] = colors.parameter,
		["@lsp.type.namespace"] = colors.accent,
		["@lsp.type.macro"] = colors.accent,
		["@lsp.type.keyword"] = colors.keyword,
		["@lsp.type.comment"] = colors.comment,
	}

	for group, color in pairs(semantic) do
		set(group, { fg = color })
	end

	-- ============================================
	-- WINDOWS
	-- ============================================

	set("WinSeparator", { fg = colors.border, bg = colors.bg })
	set("VertSplit", { fg = colors.border, bg = colors.bg })
	set("EndOfBuffer", { fg = colors.bg })
	set("NonText", { fg = colors.muted })
	set("Whitespace", { fg = colors.border })

	-- ============================================
	-- FLOATING WINDOWS
	-- ============================================

	set("NormalFloat", { fg = colors.foreground, bg = colors.surface })
	set("FloatBorder", { fg = colors.border_active, bg = colors.surface })
	set("FloatTitle", { fg = colors.primary, bg = colors.surface, bold = true })

	-- ============================================
	-- DASHBOARD
	-- ============================================

	set("DashboardHeader", { fg = colors.primary, bold = true })
	set("DashboardCenter", { fg = colors.foreground })
	set("DashboardFooter", { fg = colors.foreground_dark, italic = true })
	set("DashboardShortCut", { fg = colors.secondary, bold = true })
	set("DashboardDesc", { fg = colors.foreground_soft })
	set("DashboardIcon", { fg = colors.function_color })

	-- ============================================
	-- TELESCOPE
	-- ============================================

	local telescope = {
		TelescopeNormal = { fg = colors.foreground, bg = colors.surface },
		TelescopeBorder = { fg = colors.border, bg = colors.surface },
		TelescopePromptNormal = { fg = colors.foreground, bg = colors.surface_alt },
		TelescopePromptBorder = { fg = colors.border_active, bg = colors.surface_alt },
		TelescopePromptPrefix = { fg = colors.primary, bg = colors.surface_alt, bold = true },
		TelescopeResultsNormal = { fg = colors.foreground_soft, bg = colors.surface },
		TelescopeResultsBorder = { fg = colors.border, bg = colors.surface },
		TelescopePreviewNormal = { fg = colors.foreground, bg = colors.surface },
		TelescopePreviewBorder = { fg = colors.border, bg = colors.surface },
		TelescopeSelection = { fg = colors.primary, bg = colors.selection, bold = true },
		TelescopeSelectionCaret = { fg = colors.primary, bg = colors.selection, bold = true },
		TelescopeMatching = { fg = colors.accent, bold = true },
		TelescopeTitle = { fg = colors.primary, bg = colors.surface, bold = true },
	}

	for group, opts in pairs(telescope) do
		set(group, opts)
	end

	-- ============================================
	-- NVIMTREE
	-- ============================================

	local nvimtree = {
		NvimTreeNormal = { fg = colors.foreground, bg = colors.bg },
		NvimTreeNormalNC = { fg = colors.foreground_soft, bg = colors.bg },
		NvimTreeFolderName = { fg = colors.secondary },
		NvimTreeOpenedFolderName = { fg = colors.primary, bold = true },
		NvimTreeOpenedFile = { fg = colors.function_color, bold = true },
		NvimTreeCursorLine = { bg = colors.selection },
		NvimTreeWinSeparator = { fg = colors.border },
		NvimTreeRootFolder = { fg = colors.primary, bold = true },
		NvimTreeGitNew = { fg = colors.git_add },
		NvimTreeGitDirty = { fg = colors.git_change },
		NvimTreeGitDeleted = { fg = colors.git_delete },
	}

	for group, opts in pairs(nvimtree) do
		set(group, opts)
	end

	-- ============================================
	-- DIAGNOSTICS
	-- ============================================

	local diagnostics = {
		DiagnosticError = colors.danger,
		DiagnosticWarn = colors.warning,
		DiagnosticInfo = colors.info,
		DiagnosticHint = colors.hint,
		DiagnosticSignError = colors.danger,
		DiagnosticSignWarn = colors.warning,
		DiagnosticSignInfo = colors.info,
		DiagnosticSignHint = colors.hint,
		DiagnosticVirtualTextError = colors.danger,
		DiagnosticVirtualTextWarn = colors.warning,
		DiagnosticVirtualTextInfo = colors.info,
		DiagnosticVirtualTextHint = colors.hint,
		DiagnosticFloatingError = colors.danger,
		DiagnosticFloatingWarn = colors.warning,
		DiagnosticFloatingInfo = colors.info,
		DiagnosticFloatingHint = colors.hint,
	}

	for group, color in pairs(diagnostics) do
		local opts = { fg = color }

		if group:match("^DiagnosticFloating") then
			opts.bg = colors.surface
		elseif group:match("^DiagnosticSign") then
			opts.bg = colors.bg
		elseif group:match("^DiagnosticVirtualText") then
			opts.bg = colors.bg_alt
		end

		set(group, opts)
	end

	set("DiagnosticUnderlineError", { undercurl = true, sp = colors.danger })
	set("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warning })
	set("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info })
	set("DiagnosticUnderlineHint", { undercurl = true, sp = colors.hint })

	-- ============================================
	-- BLINK COMPLETION
	-- ============================================

	local blink = {
		BlinkCmpMenu = { fg = colors.foreground, bg = colors.surface },
		BlinkCmpMenuBorder = { fg = colors.border_active, bg = colors.surface },
		BlinkCmpMenuSelection = { fg = colors.primary, bg = colors.selection, bold = true },
		BlinkCmpLabel = { fg = colors.foreground, bg = colors.surface },
		BlinkCmpLabelMatch = { fg = colors.function_color, bg = colors.surface, bold = true },
		BlinkCmpLabelDetail = { fg = colors.foreground_dark, bg = colors.surface },
		BlinkCmpLabelDescription = { fg = colors.foreground_dark, bg = colors.surface },
		BlinkCmpLabelDeprecated = { fg = colors.muted, bg = colors.surface, strikethrough = true },
		BlinkCmpKind = { fg = colors.secondary, bg = colors.surface },
		BlinkCmpSource = { fg = colors.muted, bg = colors.surface },
		BlinkCmpDoc = { fg = colors.foreground, bg = colors.surface },
		BlinkCmpDocBorder = { fg = colors.border_active, bg = colors.surface },
		BlinkCmpDocSeparator = { fg = colors.border, bg = colors.surface },
		BlinkCmpDocCursorLine = { bg = colors.selection },
		BlinkCmpSignatureHelp = { fg = colors.foreground, bg = colors.surface },
		BlinkCmpSignatureHelpBorder = { fg = colors.border_active, bg = colors.surface },
		BlinkCmpSignatureHelpActiveParameter = { fg = colors.primary, bold = true },
		BlinkCmpGhostText = { fg = colors.muted, italic = true },
	}

	for group, opts in pairs(blink) do
		set(group, opts)
	end

	-- ============================================
	-- LSP INTERFACE
	-- ============================================

	set("LspInfoBorder", { fg = colors.border_active, bg = colors.surface })
	set("LspSignatureActiveParameter", { fg = colors.primary, bold = true })
	set("LspReferenceText", { bg = colors.selection })
	set("LspReferenceRead", { bg = colors.selection })
	set("LspReferenceWrite", { bg = colors.selection, bold = true })

	-- ============================================
	-- TOGGLETERM
	-- ============================================

	set("ToggleTermNormal", { fg = colors.foreground, bg = colors.bg })
	set("ToggleTermNormalFloat", { fg = colors.foreground, bg = colors.surface })
	set("ToggleTermFloatBorder", { fg = colors.border_active, bg = colors.surface })
	set("ToggleTermCursorLine", { bg = colors.selection })

	-- ============================================
	-- TROUBLE
	-- ============================================

	local trouble = {
		TroubleNormal = { fg = colors.foreground, bg = colors.surface },
		TroubleNormalNC = { fg = colors.foreground_soft, bg = colors.surface },
		TroubleText = { fg = colors.foreground, bg = colors.surface },
		TroubleCount = { fg = colors.primary, bg = colors.selection, bold = true },
		TroubleIndent = { fg = colors.border },
		TroublePos = { fg = colors.muted },
		TroubleSource = { fg = colors.muted },
		TroubleDirectory = { fg = colors.secondary },
		TroubleFilename = { fg = colors.foreground, bold = true },
		TroubleIconDirectory = { fg = colors.secondary },
		TroubleIconFolder = { fg = colors.secondary },
	}

	for group, opts in pairs(trouble) do
		set(group, opts)
	end

	-- ============================================
	-- GITSIGNS
	-- ============================================

	set("GitSignsAdd", { fg = colors.git_add })
	set("GitSignsChange", { fg = colors.git_change })
	set("GitSignsDelete", { fg = colors.git_delete })

	set("GitSignsAddLn", { bg = "#102018" })
	set("GitSignsChangeLn", { bg = "#101A24" })
	set("GitSignsDeleteLn", { bg = "#241014" })

	-- Python LSP semantic tokens
	local python_lsp = {
		["@lsp.type.variable"] = colors.variable,
		["@lsp.type.parameter"] = colors.parameter,
		["@lsp.type.function"] = colors.function_color,
		["@lsp.type.method"] = colors.function_color,
		["@lsp.type.class"] = colors.type,
		["@lsp.type.property"] = colors.property,
		["@lsp.type.keyword"] = colors.keyword,
		["@lsp.type.namespace"] = colors.accent,
		["@lsp.type.decorator"] = colors.accent,
		["@lsp.type.operator"] = colors.operator,
	}

	for group, color in pairs(python_lsp) do
		set(group, { fg = color })
	end

	-- ============================================
	-- PYTHON SYNTAX OVERRIDES
	-- ============================================

	local function apply_python_highlights()
		local python_groups = {
			pythonStatement = { fg = colors.keyword, bold = true },
			pythonConditional = { fg = colors.keyword, bold = true },
			pythonRepeat = { fg = colors.keyword, bold = true },
			pythonOperator = { fg = colors.operator },
			pythonException = { fg = colors.keyword },
			pythonInclude = { fg = colors.accent },
			pythonFunction = { fg = colors.function_color, bold = true },
			pythonBuiltin = { fg = colors.accent, italic = true },
			pythonDecorator = { fg = colors.accent },
			pythonString = { fg = colors.string },
			pythonNumber = { fg = colors.number },
			pythonBoolean = { fg = colors.constant },
			pythonComment = { fg = colors.comment, italic = true },
			pythonClass = { fg = colors.type, bold = true },
		}

		for group, opts in pairs(python_groups) do
			vim.api.nvim_set_hl(0, group, opts)
		end
	end

	vim.api.nvim_create_autocmd("Syntax", {
		pattern = "python",
		callback = apply_python_highlights,
	})

	if vim.bo.filetype == "python" then
		apply_python_highlights()
	end
end

return M

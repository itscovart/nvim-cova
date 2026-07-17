local colors = require("core.colors")

local M = {}

function M.setup()

    -------------------------------------------------
    -- Editor
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "Normal", {
        fg = colors.foreground,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "NormalNC", {
        fg = colors.foreground_soft,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "CursorLine", {
        bg = colors.cursorline,
    })

    vim.api.nvim_set_hl(0, "CursorColumn", {
        bg = colors.cursorline,
    })

    vim.api.nvim_set_hl(0, "LineNr", {
        fg = colors.muted,
    })

    vim.api.nvim_set_hl(0, "CursorLineNr", {
        fg = colors.primary,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "SignColumn", {
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "ColorColumn", {
        bg = colors.bg_alt,
    })

    vim.api.nvim_set_hl(0, "Visual", {
        bg = colors.selection,
    })

    vim.api.nvim_set_hl(0, "Search", {
        fg = colors.bg,
        bg = colors.accent,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "IncSearch", {
        fg = colors.bg,
        bg = colors.primary,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "CurSearch", {
        fg = colors.bg,
        bg = colors.primary,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "MatchParen", {
        fg = colors.accent,
        bg = colors.surface_alt,
        bold = true,
    })

    -------------------------------------------------
    -- Windows
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "WinSeparator", {
        fg = colors.border,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "VertSplit", {
        fg = colors.border,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "EndOfBuffer", {
        fg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "NonText", {
        fg = colors.muted,
    })

    vim.api.nvim_set_hl(0, "Whitespace", {
        fg = colors.surface_alt,
    })

    -------------------------------------------------
    -- Floating windows
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "NormalFloat", {
        fg = colors.foreground,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "FloatBorder", {
        fg = colors.border,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "FloatTitle", {
        fg = colors.primary,
        bg = colors.surface,
        bold = true,
    })

    -------------------------------------------------
    -- Dashboard
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "DashboardHeader", {
        fg = colors.foreground_soft,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "DashboardCenter", {
        fg = colors.foreground,
    })

    vim.api.nvim_set_hl(0, "DashboardFooter", {
        fg = colors.foreground_dark,
        italic = true,
    })

    vim.api.nvim_set_hl(0, "DashboardShortCut", {
        fg = colors.primary,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "DashboardDesc", {
        fg = colors.foreground_soft,
    })

    vim.api.nvim_set_hl(0, "DashboardIcon", {
        fg = colors.secondary,
    })

    -------------------------------------------------
    -- Telescope
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "TelescopeNormal", {
        fg = colors.foreground,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "TelescopeBorder", {
        fg = colors.border,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "TelescopePromptNormal", {
        fg = colors.foreground,
        bg = colors.surface_alt,
    })

    vim.api.nvim_set_hl(0, "TelescopePromptBorder", {
        fg = colors.border,
        bg = colors.surface_alt,
    })

    vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {
        fg = colors.primary,
        bg = colors.surface_alt,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", {
        fg = colors.foreground_soft,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {
        fg = colors.border,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", {
        fg = colors.foreground,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", {
        fg = colors.border,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "TelescopeSelection", {
        fg = colors.foreground,
        bg = colors.selection,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", {
        fg = colors.primary,
        bg = colors.selection,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "TelescopeMatching", {
        fg = colors.accent,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "TelescopeTitle", {
        fg = colors.foreground,
        bg = colors.surface,
        bold = false,
    })

    -------------------------------------------------
    -- NvimTree
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "NvimTreeNormal", {
        fg = colors.foreground,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", {
        fg = colors.foreground,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "NvimTreeFolderName", {
        fg = colors.secondary,
    })

    vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", {
        fg = colors.primary,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", {
        fg = colors.primary,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "NvimTreeCursorLine", {
        bg = colors.selection,
    })

    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", {
        fg = colors.border,
    })

    -------------------------------------------------
    -- Diagnostics
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "DiagnosticError", {
        fg = colors.danger,
    })

    vim.api.nvim_set_hl(0, "DiagnosticWarn", {
        fg = colors.warning,
    })

    vim.api.nvim_set_hl(0, "DiagnosticInfo", {
        fg = colors.info,
    })

    vim.api.nvim_set_hl(0, "DiagnosticHint", {
        fg = colors.hint,
    })

    vim.api.nvim_set_hl(0, "DiagnosticSignError", {
        fg = colors.danger,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticSignWarn", {
        fg = colors.warning,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticSignInfo", {
        fg = colors.info,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticSignHint", {
        fg = colors.hint,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {
        fg = colors.danger,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {
        fg = colors.warning,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", {
        fg = colors.info,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", {
        fg = colors.hint,
        bg = colors.bg,
    })

    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
        undercurl = true,
        sp = colors.danger,
    })

    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
        undercurl = true,
        sp = colors.warning,
    })

    vim.api.nvim_set_hl(0, "DiagnosticFloatingError", {
        fg = colors.danger,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", {
        fg = colors.warning,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", {
        fg = colors.info,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", {
        fg = colors.hint,
        bg = colors.surface,
    })

        -------------------------------------------------
    -- Blink completion
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "BlinkCmpMenu", {
        fg = colors.foreground,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", {
        fg = colors.border,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", {
        fg = colors.foreground,
        bg = colors.selection,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpLabel", {
        fg = colors.foreground,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", {
        fg = colors.primary,
        bg = colors.surface,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", {
        fg = colors.foreground_dark,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", {
        fg = colors.foreground_dark,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpLabelDeprecated", {
        fg = colors.muted,
        bg = colors.surface,
        strikethrough = true,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpKind", {
        fg = colors.secondary,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpSource", {
        fg = colors.muted,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpDoc", {
        fg = colors.foreground,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", {
        fg = colors.border,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", {
        fg = colors.border,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpDocCursorLine", {
        bg = colors.selection,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", {
        fg = colors.foreground,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", {
        fg = colors.border,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpActiveParameter", {
        fg = colors.primary,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpGhostText", {
        fg = colors.muted,
        italic = true,
    })

    -------------------------------------------------
    -- LSP interfaces
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "LspInfoBorder", {
        fg = colors.border,
        bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", {
        fg = colors.primary,
        bold = true,
    })

    vim.api.nvim_set_hl(0, "LspReferenceText", {
        bg = colors.selection,
    })

    vim.api.nvim_set_hl(0, "LspReferenceRead", {
        bg = colors.selection,
    })

    vim.api.nvim_set_hl(0, "LspReferenceWrite", {
        bg = colors.selection,
        bold = true,
    })

    -------------------------------------------------
    -- ToggleTerm
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "ToggleTermNormal", {
      fg = colors.foreground,
      bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "ToggleTermNormalFloat", {
      fg = colors.foreground,
      bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "ToggleTermFloatBorder", {
      fg = colors.border,
      bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "ToggleTermCursorLine", {
      bg = colors.selection,
    })

    -------------------------------------------------
    -- Trouble
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "TroubleNormal", {
      fg = colors.foreground,
      bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "TroubleNormalNC", {
      fg = colors.muted,
      bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "TroubleText", {
      fg = colors.foreground,
      bg = colors.surface,
    })

    vim.api.nvim_set_hl(0, "TroubleCount", {
      fg = colors.primary,
      bg = colors.selection,
      bold = true,
    })

    vim.api.nvim_set_hl(0, "TroubleIndent", {
      fg = colors.border,
    })

    vim.api.nvim_set_hl(0, "TroublePos", {
      fg = colors.muted,
    })

    vim.api.nvim_set_hl(0, "TroubleSource", {
      fg = colors.comment,
    })

    vim.api.nvim_set_hl(0, "TroubleDirectory", {
      fg = colors.secondary,
    })

    vim.api.nvim_set_hl(0, "TroubleFilename", {
      fg = colors.foreground,
      bold = true,
    })

    vim.api.nvim_set_hl(0, "TroubleIconDirectory", {
      fg = colors.secondary,
    })

    vim.api.nvim_set_hl(0, "TroubleIconFolder", {
      fg = colors.secondary,
    })

end

return M

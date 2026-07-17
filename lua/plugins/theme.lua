local colors = require("core.colors")

return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,

    config = function()
      require("kanagawa").setup({
        theme = "dragon",
        transparent = false,
        dimInactive = false,
        terminalColors = true,

        colors = {
          theme = {
            all = {
              ui = {
                bg = colors.bg,
                bg_gutter = "none",
                float = colors.surface,
              },
            },
          },
        },

        overrides = function()
          return {
            -- Main editor
            Normal = {
              fg = colors.foreground,
              bg = "NONE",
            },

            NormalNC = {
              fg = colors.foreground_soft,
              bg = "NONE",
            },

            EndOfBuffer = {
              fg = colors.bg,
              bg = "NONE",
            },

            -- Cursor
            CursorLine = {
              bg = colors.cursorline,
            },

            CursorColumn = {
              bg = colors.cursorline,
            },

            ColorColumn = {
              bg = colors.surface,
            },

            -- Numbers
            LineNr = {
              fg = colors.muted,
            },

            CursorLineNr = {
              fg = colors.primary,
              bold = true,
            },

            -- Selection
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

            -- Floating windows
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

            -- Popup menu
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

            -- Splits
            WinSeparator = {
              fg = colors.border,
              bg = "NONE",
            },

            -- Statusline
            StatusLine = {
              fg = colors.foreground_soft,
              bg = "NONE",
            },

            StatusLineNC = {
              fg = colors.muted,
              bg = "NONE",
            },

            -- Diagnostics
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

            -- Git
            GitSignsAdd = {
              fg = colors.git_add,
            },

            GitSignsChange = {
              fg = colors.git_change,
            },

            GitSignsDelete = {
              fg = colors.git_delete,
            },

            -- Comments
            Comment = {
              fg = colors.foreground_dark,
              italic = true,
            },
          }
        end,
      })

      vim.cmd.colorscheme("kanagawa-dragon")
    end,
  },
}

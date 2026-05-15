local colors = require("core.colors")

return {
  "nvimdev/dashboard-nvim",

  event = "VimEnter",

  dependencies = {
    "nvim-tree/nvim-web-devicons"
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

          "╔══════════════════════════════════════╗",
          "║           C O V A   O S              ║",
          "╚══════════════════════════════════════╝",

          "",

          "   > Initializing system...",
          "   > Loading modules...",
          "   > Checking memory...",
          "   > Access granted.",

          "",

          " ██████╗  ██████╗ ██╗   ██╗ █████╗ ",
          "██╔════╝ ██╔═══██╗██║   ██║██╔══██╗",
          "██║      ██║   ██║██║   ██║███████║",
          "██║      ██║   ██║╚██╗ ██╔╝██╔══██║",
          "╚██████╗ ╚██████╔╝ ╚████╔╝ ██║  ██║",
          " ╚═════╝  ╚═════╝   ╚═══╝  ╚═╝  ╚═╝",

          "",

          "      >>> SYSTEM READY <<<",

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

          "✦ COVA SYSTEM v1.0.0 ✦",
          "◈ 2026 COVA Industries ◈",

        },

      },
    })

    -------------------------------------------------
    -- Dashboard highlights
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "DashboardHeader", {
      fg = colors.foreground_dark,
      bold = true,
    })

    vim.api.nvim_set_hl(0, "DashboardCenter", {
      fg = colors.primary,
    })

    vim.api.nvim_set_hl(0, "DashboardFooter", {
      fg = colors.secondary,
      italic = true,
    })

    vim.api.nvim_set_hl(0, "DashboardShortCut", {
      fg = colors.accent,
      bold = true,
    })

  end,
}

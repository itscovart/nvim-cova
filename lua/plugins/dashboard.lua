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
    -- 🌸 SAKURA CYBERPUNK PALETTE
    -------------------------------------------------

    vim.cmd([[
      highlight DashboardHeader guifg=#f2b5d4 gui=bold
      highlight DashboardCenter guifg=#ddb6f2
      highlight DashboardFooter guifg=#cba6f7 gui=italic
      highlight DashboardShortCut guifg=#f5c2e7 gui=bold
    ]])

  end,
}

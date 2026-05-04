return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local db = require("dashboard")

    db.setup({
      theme = "doom",
      config = {

        header = {
          "╔══════════════════════════════════════╗",
          "║           C O V A   O S              ║",
          "╚══════════════════════════════════════╝",
          "",
          "> Initializing system...",
          "> Loading modules...",
          "> Checking memory...",
          "> Access granted.",
          "",
          " ██████╗  ██████╗ ██╗   ██╗ █████╗ ",
          "██╔════╝ ██╔═══██╗██║   ██║██╔══██╗",
          "██║      ██║   ██║██║   ██║███████║",
          "██║      ██║   ██║╚██╗ ██╔╝██╔══██║",
          "╚██████╗ ╚██████╔╝ ╚████╔╝ ██║  ██║",
          " ╚═════╝  ╚═════╝   ╚═══╝  ╚═╝  ╚═╝",
          "",
          ">>> SYSTEM READY",
          "",
        },

        center = {
          { desc = "[N] New File", action = "ene | startinsert", key = "n" },
          { desc = "[F] Find File", action = "Telescope find_files", key = "f" },
          { desc = "[R] Recent Files", action = "Telescope oldfiles", key = "r" },
          { desc = "[Q] Quit", action = "qa", key = "q" },
        },

        footer = {
          "",
          "COVA SYSTEM v1.0.0",
          "© 2026 COVA Industries",
        },
      },
    })

    -- 🎨 Colores retro
    vim.cmd([[
      highlight DashboardHeader guifg=#00ff00
      highlight DashboardCenter guifg=#00ff00
      highlight DashboardFooter guifg=#008800
    ]])
  end,
}

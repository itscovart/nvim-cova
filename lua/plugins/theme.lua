return {

  -------------------------------------------------
  -- TOKYONIGHT
  -------------------------------------------------
  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },

  -------------------------------------------------
  -- ONEDARK
  -------------------------------------------------
  {
    "navarasu/onedark.nvim",
    priority = 1000,
  },

  -------------------------------------------------
  -- CATPPUCCIN
  -------------------------------------------------
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -------------------------------------------------
  -- GRUVBOX MATERIAL
  -------------------------------------------------
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
  },

  -------------------------------------------------
  -- CONFIG PRINCIPAL
  -------------------------------------------------
  {
    "folke/tokyonight.nvim", -- usamos este para ejecutar config
    config = function()

      -------------------------------------------------
      -- TOKYONIGHT SETUP
      -------------------------------------------------
      require("tokyonight").setup({
        style = "night",
        transparent = false,

        on_colors = function(colors)
          colors.bg = "#000000"
        end,

        on_highlights = function(hl, colors)

          hl.Normal = { bg = "#000000" }
          hl.NormalNC = { bg = "#000000" }
          hl.EndOfBuffer = { bg = "#000000" }
          hl.SignColumn = { bg = "#000000" }
          hl.LineNr = { bg = "#000000" }

          hl.CursorLine = { bg = "#111111" }

          hl.CursorLineNr = {
            fg = "#7aa2f7",
            bold = true
          }

        end,
      })

      -------------------------------------------------
      -- DEFAULT THEME
      -------------------------------------------------
      vim.cmd.colorscheme("tokyonight")

      -------------------------------------------------
      -- THEME SWITCHER
      -------------------------------------------------
      vim.keymap.set("n", "<leader>tt", function()
        local themes = {
          "tokyonight",
          "onedark",
          "catppuccin-mocha",
          "gruvbox-material",
        }

        -- guarda índice global
        vim.g.theme_index = (vim.g.theme_index or 0) + 1

        if vim.g.theme_index > #themes then
          vim.g.theme_index = 1
        end

        local theme = themes[vim.g.theme_index]

        vim.cmd.colorscheme(theme)
        print("Theme → " .. theme)
      end)

    end,
  },

}

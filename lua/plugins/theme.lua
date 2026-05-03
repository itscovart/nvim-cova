return {
  "folke/tokyonight.nvim",

  priority = 1000,

  config = function()

    require("tokyonight").setup({
      style = "night",

      transparent = false,

      on_colors = function(colors)
        colors.bg = "#000000" -- fondo negro puro
      end,

      on_highlights = function(hl, colors)

        hl.Normal = { bg = "#000000" }
        hl.NormalNC = { bg = "#000000" }
        hl.EndOfBuffer = { bg = "#000000" }
        hl.SignColumn = { bg = "#000000" }
        hl.LineNr = { bg = "#000000" }

        -- ⭐ Cursor line
        hl.CursorLine = {
          bg = "#111111" -- gris oscuro elegante

        }

        hl.CursorLineNr = {
          fg = "#7aa2f7", -- azul bonito estilo Tokyonight
          bold = true

        }

      end,
    })

    vim.cmd.colorscheme("tokyonight")

  end,
}

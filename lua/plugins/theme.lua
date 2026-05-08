return {

  -------------------------------------------------
  -- GRUVBOX MATERIAL
  -------------------------------------------------
  {
    "sainnhe/gruvbox-material",
    priority = 1000,

    config = function()

      -------------------------------------------------
      -- GRUVBOX SETTINGS
      -------------------------------------------------

      -- estilo del tema
      vim.g.gruvbox_material_background = "medium"

      -- transparencia
      vim.g.gruvbox_material_transparent_background = 1

      -- mejor contraste
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1

      -------------------------------------------------
      -- LOAD THEME
      -------------------------------------------------

      vim.cmd.colorscheme("gruvbox-material")

    end,
  },

}

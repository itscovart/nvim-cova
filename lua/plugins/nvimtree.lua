return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require("nvim-tree").setup({
      view = {
        width = 35,
        relativenumber = true,
      },

      renderer = {
        group_empty = true,
        highlight_opened_files = "name",
      },

      filters = {
        enable = false,
      },

      update_focused_file = {
        enable = true,
      },
    })
  end,
}

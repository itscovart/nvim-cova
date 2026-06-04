return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    view = {
      width = 35,
    },

    renderer = {
      group_empty = true,
    },

    filters = {
      dotfiles = false,
    },
  },
}

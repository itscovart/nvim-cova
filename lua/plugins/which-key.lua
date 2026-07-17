return {
  "folke/which-key.nvim",

  event = "VeryLazy",

  opts = {
    preset = "modern",

    delay = 300,

    icons = {
      mappings = true,
    },

    win = {
      border = "rounded",
      padding = { 1, 2 },
    },

    layout = {
      spacing = 6,
    },

    sort = {
      "local",
      "order",
      "group",
      "alphanum",
    },
  },
}

return {
  "folke/todo-comments.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    signs = true,

    highlight = {
      before = "",
      keyword = "wide",
      after = "",
    },

    keywords = {
      TODO = {
        icon = "",
        color = "info",
      },

      FIXME = {
        icon = "",
        color = "error",
      },

      HACK = {
        icon = "",
        color = "warning",
      },

      WARN = {
        icon = "",
        color = "warning",
      },

      NOTE = {
        icon = "",
        color = "hint",
      },

      PERF = {
        icon = "",
        color = "default",
      },
    },
  },

  keys = {
    {
      "<leader>st",
      "<cmd>TodoTelescope<cr>",
      desc = "Search TODOs",
    },

    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next TODO",
    },

    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous TODO",
    },
  },
}

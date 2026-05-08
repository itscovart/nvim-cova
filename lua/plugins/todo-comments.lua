return {
  "folke/todo-comments.nvim",

  event = "VeryLazy",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    signs = true,

    sign_priority = 8,

    keywords = {
      TODO = {
        icon = " ",
        color = "info",
        alt = { "TODO" },
      },

      FIXME = {
        icon = " ",
        color = "error",
        alt = { "FIX", "BUG", "FIXIT", "ISSUE" },
      },

      HACK = {
        icon = " ",
        color = "warning",
      },

      WARN = {
        icon = " ",
        color = "warning",
        alt = { "WARNING", "XXX" },
      },

      PERF = {
        icon = " ",
        color = "default",
        alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
      },

      NOTE = {
        icon = " ",
        color = "hint",
        alt = { "INFO" },
      },
    },

    gui_style = {
      fg = "NONE",
      bg = "BOLD",
    },

    highlight = {
      multiline = true,
      multiline_pattern = "^.",
      multiline_context = 10,

      before = "",

      keyword = "bg",

      after = "fg",
      pattern = [[.*<(KEYWORDS)\s*:]],

      comments_only = true,

      max_line_len = 400,
      exclude = {},
    },

    colors = {
      error = { "#f7768e" },
      warning = { "#e0af68" },
      info = { "#7aa2f7" },
      hint = { "#7dcfff" },
      default = { "#9ece6a" },
    },

    search = {
      command = "rg",

      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },

      pattern = [[\b(KEYWORDS):]],
    },
  },

  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next todo comment",
    },

    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous todo comment",
    },

    {
      "<leader>st",
      "<cmd>TodoTelescope<cr>",
      desc = "Todo Telescope",
    },

    {
      "<leader>sq",
      "<cmd>TodoQuickFix<cr>",
      desc = "Todo QuickFix",
    },
  },
}

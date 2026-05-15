local colors = require("core.colors")

return {
  "folke/todo-comments.nvim",

  event = "VeryLazy",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {

    -------------------------------------------------
    -- Signs
    -------------------------------------------------

    signs = true,

    sign_priority = 8,

    -------------------------------------------------
    -- Keywords
    -------------------------------------------------

    keywords = {

      TODO = {
        icon = " ",
        color = "info",
        alt = { "TODO" },
      },

      FIXME = {
        icon = " ",
        color = "error",
        alt = {
          "FIX",
          "BUG",
          "FIXIT",
          "ISSUE",
        },
      },

      HACK = {
        icon = " ",
        color = "warning",
      },

      WARN = {
        icon = " ",
        color = "warning",

        alt = {
          "WARNING",
          "XXX",
        },
      },

      PERF = {
        icon = " ",
        color = "default",

        alt = {
          "OPTIM",
          "PERFORMANCE",
          "OPTIMIZE",
        },
      },

      NOTE = {
        icon = " ",
        color = "hint",

        alt = {
          "INFO",
        },
      },
    },

    -------------------------------------------------
    -- Style
    -------------------------------------------------

    gui_style = {
      fg = "NONE",
      bg = "BOLD",
    },

    -------------------------------------------------
    -- Highlight
    -------------------------------------------------

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

    -------------------------------------------------
    -- Colors
    -------------------------------------------------

    colors = {

      error = {
        colors.danger,
      },

      warning = {
        colors.warning,
      },

      info = {
        colors.primary,
      },

      hint = {
        colors.accent,
      },

      default = {
        colors.success,
      },
    },

    -------------------------------------------------
    -- Search
    -------------------------------------------------

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

  -------------------------------------------------
  -- Keymaps
  -------------------------------------------------

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

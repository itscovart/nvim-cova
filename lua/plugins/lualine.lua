local colors = require("core.colors")

return {
  "nvim-lualine/lualine.nvim",

  config = function()
    vim.opt.fillchars = {
      eob = " ",
    }

    local mode = {
      "mode",

      fmt = function(str)
          local labels = {
            NORMAL = "▍ NORMAL",
            INSERT = "▍ INSERT",
            VISUAL = "▍ VISUAL",
            ["V-LINE"] = "▍ V-LINE",
            ["V-BLOCK"] = "▍ V-BLOCK",
            REPLACE = "▍ REPLACE",
            COMMAND = "▍ COMMAND",
            TERMINAL = "▍ TERMINAL",
          }

          return labels[str] or ("▍ " .. str)
        end,

      padding = {
        left = 1,
        right = 1,
      },
    }

    local branch = {
      "branch",
      icon = "",

      color = {
        fg = colors.foreground_soft,
      },

      padding = {
        left = 1,
        right = 1,
      },
    }

    local filename = {
      "filename",

      path = 1,
      file_status = true,

      symbols = {
        modified = " ●",
        readonly = " ",
        unnamed = "Untitled",
        newfile = "New",
      },

      color = {
        fg = colors.foreground,
      },

      padding = {
        left = 1,
        right = 1,
      },
    }

    local filetype = {
      "filetype",

      icon_only = false,
      fmt = function(name)

          if name == "" then
            return ""
          end

          return name:sub(1, 1):upper() .. name:sub(2)
        end,

      color = {
        fg = colors.secondary,
      },

      padding = {
        left = 2,
        right = 2,
      },
    }

    local diagnostics = {
      "diagnostics",

      sources = {
        "nvim_diagnostic",
      },

      sections = {
        "error",
        "warn",
      },

      symbols = {
        error = "● ",
        warn = "● ",
      },

      colored = true,
      update_in_insert = false,
      always_visible = false,

      cond = function()
        return vim.fn.winwidth(0) > 110
      end,

      padding = {
        left = 1,
        right = 1,
      },
    }

    local location = {
      "location",

      fmt = function(value)
        local line, column = value:match("(%d+):(%d+)")

        if not line or not column then
          return value
        end

        return string.format("Ln %s  Col %s", line, column)
      end,

      color = {
        fg = colors.foreground_soft,
      },

      padding = {
        left = 1,
        right = 1,
      },
    }

    require("lualine").setup({
      options = {
        icons_enabled = true,

        theme = {
          normal = {
            a = {
              fg = colors.primary,
              bg = "NONE",
              gui = "bold",
            },

            b = {
              fg = colors.foreground_soft,
              bg = "NONE",
            },

            c = {
              fg = colors.foreground,
              bg = "NONE",
            },
          },

          insert = {
            a = {
              fg = colors.success,
              bg = "NONE",
              gui = "bold",
            },

            b = {
              fg = colors.foreground_soft,
              bg = "NONE",
            },

            c = {
              fg = colors.foreground,
              bg = "NONE",
            },
          },

          visual = {
            a = {
              fg = colors.secondary,
              bg = "NONE",
              gui = "bold",
            },

            b = {
              fg = colors.foreground_soft,
              bg = "NONE",
            },

            c = {
              fg = colors.foreground,
              bg = "NONE",
            },
          },

          replace = {
            a = {
              fg = colors.danger,
              bg = "NONE",
              gui = "bold",
            },

            b = {
              fg = colors.foreground_soft,
              bg = "NONE",
            },

            c = {
              fg = colors.foreground,
              bg = "NONE",
            },
          },

          command = {
            a = {
              fg = colors.warning,
              bg = "NONE",
              gui = "bold",
            },

            b = {
              fg = colors.foreground_soft,
              bg = "NONE",
            },

            c = {
              fg = colors.foreground,
              bg = "NONE",
            },
          },

          inactive = {
            a = {
              fg = colors.muted,
              bg = "NONE",
            },

            b = {
              fg = colors.muted,
              bg = "NONE",
            },

            c = {
              fg = colors.muted,
              bg = "NONE",
            },
          },
        },

        section_separators = {
          left = "",
          right = "",
        },

        component_separators = {
          left = "",
          right = "",
        },

        disabled_filetypes = {
          statusline = {
            "dashboard",
            "alpha",
            "lazy",
          },
        },

        always_divide_middle = true,
        globalstatus = true,

        refresh = {
          statusline = 500,
          tabline = 1000,
          winbar = 1000,
        },
      },

      sections = {
        lualine_a = {
          mode,
        },

        lualine_b = {
          branch,
        },

        lualine_c = {
          filename,
        },

        lualine_x = {
          diagnostics,
          filetype,
        },

        lualine_y = {},

        lualine_z = {
          location,
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",

            path = 1,

            color = {
              fg = colors.muted,
            },
          },
        },

        lualine_x = {
          {
            "location",

            color = {
              fg = colors.muted,
            },
          },
        },

        lualine_y = {},
        lualine_z = {},
      },

      tabline = {},

      extensions = {
        "fugitive",
        "lazy",
        "nvim-tree",
      },
    })

  end,
}

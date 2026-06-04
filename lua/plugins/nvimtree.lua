return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    view = {
      width = 35,
      relativenumber = true,
    },

    renderer = {
      group_empty = true,
      highlight_opened_files = "name",
    },

    filters = {
      dotfiles = false,
    },

    update_focused_file = {
      enable = true,
    },
  },

  config = function(_, opts)
    require("nvim-tree").setup(opts)

    -------------------------------------------------
    -- Transparent NvimTree
    -------------------------------------------------

    vim.api.nvim_set_hl(0, "NvimTreeNormal", {
      bg = "NONE",
    })

    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", {
      bg = "NONE",
    })

    vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", {
      bg = "NONE",
    })

    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", {
      fg = "#313244",
      bg = "NONE",
    })

    vim.api.nvim_set_hl(0, "WinSeparator", {
      fg = "#313244",
      bg = "NONE",
    })
  end,
}

return {
  "lewis6991/gitsigns.nvim",

  config = function()

    require("gitsigns").setup({

      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
      },

      current_line_blame = true,

      on_attach = function(bufnr)

        local gs = require("gitsigns")
        local keymap = vim.keymap
        local opts = { buffer = bufnr }

        -------------------------------------------------
        -- Navegar cambios
        -------------------------------------------------

        keymap.set("n", "]h",
          gs.next_hunk, opts)

        keymap.set("n", "[h",
          gs.prev_hunk, opts)

        -------------------------------------------------
        -- Acciones por hunk
        -------------------------------------------------

        keymap.set("n", "<leader>hs",
          gs.stage_hunk, opts)

        keymap.set("n", "<leader>hr",
          gs.reset_hunk, opts)

        keymap.set("n", "<leader>hp",
          gs.preview_hunk, opts)

        keymap.set("n", "<leader>hb",
          gs.blame_line, opts)

        -------------------------------------------------
        -- Acciones por archivo
        -------------------------------------------------

        keymap.set("n", "<leader>hS",
          gs.stage_buffer, opts)

        keymap.set("n", "<leader>hR",
          gs.reset_buffer, opts)

      end,

    })

  end,
}

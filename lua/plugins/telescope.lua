return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },

  config = function()

    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {

        -------------------------------------------------
        -- Layout
        -------------------------------------------------

        layout_strategy = "horizontal",

        layout_config = {
          prompt_position = "top",

          horizontal = {
            preview_width = 0.6,
          },
        },

        sorting_strategy = "ascending",

        -------------------------------------------------
        -- Preview
        -------------------------------------------------

        preview = {
          treesitter = true,
        },

        -------------------------------------------------
        -- Keymaps dentro de Telescope
        -------------------------------------------------

        mappings = {

          -------------------------------------------------
          -- Insert mode (cuando escribes)
          -------------------------------------------------

          i = {

            -- mover selección
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            -- scroll del preview
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<C-u>"] = actions.preview_scrolling_up,

          },

          -------------------------------------------------
          -- Normal mode
          -------------------------------------------------

          n = {

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

          },

        },

      },
    })

    -------------------------------------------------
    -- Cargar extensión FZF
    -------------------------------------------------

    telescope.load_extension("fzf")

    local builtin = require("telescope.builtin")

    -------------------------------------------------
    -- Keymaps principales
    -------------------------------------------------

    vim.keymap.set("n", "<leader>ff", function()
      builtin.find_files({
        hidden = true,
        previewer = true,
      })
    end, { desc = "Find files" })

    vim.keymap.set("n", "<leader>fg",
      builtin.live_grep,
      { desc = "Live grep" })

    vim.keymap.set("n", "<leader>fb",
      builtin.buffers,
      { desc = "Buffers" })

    vim.keymap.set("n", "<leader>fh",
      builtin.help_tags,
      { desc = "Help tags" })

    vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

  end,
}

return {
  "akinsho/toggleterm.nvim",

  version = "*",

  config = function()
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal

    -------------------------------------------------
    -- Setup
    -------------------------------------------------

    toggleterm.setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        end

        if term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.35)
        end

        return 20
      end,

      open_mapping = [[<C-\>]],

      direction = "horizontal",

      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,

      persist_size = true,
      persist_mode = true,

      close_on_exit = true,

      shade_terminals = false,

      auto_scroll = true,

      float_opts = {
        border = "rounded",
        winblend = 0,
      },

      highlights = {
        Normal = {
          link = "ToggleTermNormal",
        },

        NormalFloat = {
          link = "ToggleTermNormalFloat",
        },

        FloatBorder = {
          link = "ToggleTermFloatBorder",
        },
      },

      on_open = function(term)
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"

        -------------------------------------------------
        -- Terminal keymaps
        -------------------------------------------------

        local opts = {
          buffer = term.bufnr,
          silent = true,
        }

        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

        vim.keymap.set("t", "<C-\\>", [[<Cmd>ToggleTerm<CR>]], opts)
      end,
    })

    -------------------------------------------------
    -- Terminal in current file directory
    -------------------------------------------------

    local file_terminal = Terminal:new({
      direction = "horizontal",
      hidden = true,

      display_name = "File Terminal",
    })

    vim.keymap.set("n", "<leader>tn", function()
      local file_path = vim.api.nvim_buf_get_name(0)

      local directory

      if file_path == "" then
        directory = vim.fn.getcwd()
      else
        directory = vim.fs.dirname(file_path)
      end

      file_terminal.dir = directory
      file_terminal:toggle()
    end, {
      desc = "Terminal in file directory",
    })

    -------------------------------------------------
    -- Floating terminal
    -------------------------------------------------

    local floating_terminal = Terminal:new({
      direction = "float",
      hidden = true,

      display_name = "Floating Terminal",
    })

    vim.keymap.set("n", "<leader>tf", function()
      floating_terminal:toggle()
    end, {
      desc = "Floating terminal",
    })
  end,
}

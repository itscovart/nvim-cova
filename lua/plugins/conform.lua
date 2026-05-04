return {
  "stevearc/conform.nvim",

  config = function()

    local conform = require("conform")

    conform.setup({

      formatters_by_ft = {

        cpp = { "clang-format" },
        c = { "clang-format" },
        python = { "black" },
        rust = { "rustfmt" },

      },

    })

    -------------------------------------------------
    -- Keymap manual
    -------------------------------------------------

    vim.keymap.set("n", "<leader>f",
      function()
        conform.format({
          lsp_fallback = true,
        })
      end,
      { desc = "Format file" })

  end,
}

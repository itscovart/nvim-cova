return {
  "akinsho/toggleterm.nvim",

  version = "*",

  config = function()

    require("toggleterm").setup({

      size = 15,

      direction = "horizontal",

      shade_terminals = true,

      start_in_insert = true,

      persist_size = true,

    })

    -------------------------------------------------
    -- Toggle terminal en directorio del archivo
    -------------------------------------------------

    vim.keymap.set("n", "<leader>tn", function()

      local file_dir = vim.fn.expand("%:p:h")

      require("toggleterm.terminal")
        .Terminal:new({
          dir = file_dir,
          direction = "horizontal",
        })
        :toggle()

    end, { desc = "Terminal in file directory" })

  end,
}

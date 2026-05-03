return {
  "tpope/vim-fugitive",

  config = function()

    local keymap = vim.keymap

    -- Git status
    keymap.set("n", "<leader>gs",
      ":Git<CR>",
      { desc = "Git status" })
    keymap.set("n", "<leader>gc",
      ":Git commit<CR>",
      { desc = "Git commit" })

    keymap.set("n", "<leader>gp",
      ":Git push<CR>",
      { desc = "Git push" })

    keymap.set("n", "<leader>gl",
      ":Git pull<CR>",
      { desc = "Git pull" })

  end,
}

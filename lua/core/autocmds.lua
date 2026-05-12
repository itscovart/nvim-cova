-------------------------------------------------
-- Highlight yanked text
-------------------------------------------------

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",

  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})

-------------------------------------------------
-- Auto-save Markdown
-------------------------------------------------

vim.api.nvim_create_autocmd(
  "InsertLeave",
  {
    pattern = "*.md",
    command = "write",
  }
)

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
-- Markdown Template
-------------------------------------------------

local function setup_markdown_template()

  local template =
    vim.fn.expand("~/.config/nvim/templates/md.md")

  if vim.fn.line("$") == 1
    and vim.fn.getline(1) == ""
    and vim.fn.filereadable(template) == 1 then

    vim.fn.setline(
      1,
      vim.fn.readfile(template)
    )

  end

end

vim.api.nvim_create_autocmd(
  "BufNewFile",
  {
    pattern = "*.md",
    callback = setup_markdown_template,
  }
)

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

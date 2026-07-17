local keymap = vim.keymap.set

local opts = {
  silent = true,
  noremap = true,
}

-------------------------------------------------
-- Better window navigation
-------------------------------------------------

keymap("n", "<C-h>", "<C-w>h", {
  desc = "Move to left window",
})

keymap("n", "<C-j>", "<C-w>j", {
  desc = "Move to lower window",
})

keymap("n", "<C-k>", "<C-w>k", {
  desc = "Move to upper window",
})

keymap("n", "<C-l>", "<C-w>l", {
  desc = "Move to right window",
})

-------------------------------------------------
-- Save / Quit
-------------------------------------------------

keymap("n", "<leader>w", "<cmd>write<cr>", {
  desc = "Save file",
})

keymap("n", "<leader>q", "<cmd>quit<cr>", {
  desc = "Quit window",
})

-------------------------------------------------
-- Copy to system clipboard
-------------------------------------------------

keymap("n", "<leader>y", '"+yy', {
  desc = "Copy line to clipboard",
})

keymap("v", "<leader>y", '"+y', {
  desc = "Copy selection to clipboard",
})

-------------------------------------------------
-- Clear search highlight
-------------------------------------------------

keymap("n", "<leader>nh", "<cmd>nohlsearch<cr>", {
  desc = "Clear search highlight",
})

-------------------------------------------------
-- Resize windows
-------------------------------------------------

keymap("n", "<C-Up>", "<cmd>resize -2<cr>", {
  desc = "Decrease window height",
})

keymap("n", "<C-Down>", "<cmd>resize +2<cr>", {
  desc = "Increase window height",
})

keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", {
  desc = "Decrease window width",
})

keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", {
  desc = "Increase window width",
})

-------------------------------------------------
-- C++ compile
-------------------------------------------------

keymap("n", "<leader>cc", function()
  if vim.bo.filetype ~= "cpp" then
    vim.notify("This command is only available for C++ files", vim.log.levels.WARN)
    return
  end

  vim.cmd("write")

  local file = vim.fn.shellescape(vim.fn.expand("%:p"))
  local output = vim.fn.shellescape(vim.fn.expand("%:p:r"))

  local command = table.concat({
    "g++-15",
    "-std=c++20",
    "-Wall",
    "-Wextra",
    file,
    "-o",
    output,
  }, " ")

  vim.cmd("!" .. command)
end, {
  desc = "Compile C++",
})

-------------------------------------------------
-- Smart Run
-------------------------------------------------

keymap("n", "<leader>r", function()
  require("core.runner").run()
end, {
  desc = "Run current file or project",
})

-------------------------------------------------
-- Markdown Preview
-------------------------------------------------

vim.api.nvim_create_user_command("MdPreview", function()
  if vim.bo.filetype ~= "markdown" then
    vim.notify("This command is only available for Markdown", vim.log.levels.WARN)
    return
  end

  local file = vim.fn.shellescape(vim.fn.expand("%:p"))
  vim.fn.system('open -a "Markdowny" ' .. file)
end, {
  desc = "Open Markdown preview",
})

keymap("n", "<leader>mp", "<cmd>MdPreview<cr>", {
  desc = "Preview Markdown",
})

-------------------------------------------------
-- Template helper
-------------------------------------------------

local function insert_template(path, message)
  local template = vim.fn.expand(path)

  if vim.fn.filereadable(template) ~= 1 then
    vim.notify("Template not found: " .. template, vim.log.levels.ERROR)
    return
  end

  local lines = vim.fn.readfile(template)

  vim.api.nvim_buf_set_lines(
    0,
    0,
    -1,
    false,
    lines
  )

  vim.notify(message, vim.log.levels.INFO)
end

-------------------------------------------------
-- Markdown template
-------------------------------------------------

keymap("n", "<leader>tmd", function()
  insert_template(
    "~/.config/nvim/templates/md.md",
    "Markdown template inserted"
  )
end, {
  desc = "Insert Markdown template",
})

-------------------------------------------------
-- Markdown + LaTeX template → PDF
-------------------------------------------------

keymap("n", "<leader>tarpdf", function()
  if vim.bo.filetype ~= "markdown" then
    vim.notify("This command is only available for Markdown", vim.log.levels.WARN)
    return
  end

  vim.cmd("write")

  local template = vim.fn.shellescape(
    vim.fn.expand("~/.config/nvim/templates/escom-template.tex")
  )

  local input_file = vim.fn.shellescape(vim.fn.expand("%:t"))
  local file_dir = vim.fn.shellescape(vim.fn.expand("%:p:h"))
  local output_pdf = vim.fn.shellescape(vim.fn.expand("%:t:r") .. ".pdf")

  local command = table.concat({
    "cd",
    file_dir,
    "&&",
    "pandoc",
    input_file,
    "-o",
    output_pdf,
    "--template=" .. template,
    "--pdf-engine=xelatex",
    "--resource-path=.",
  }, " ")

  vim.cmd("!" .. command)
end, {
  desc = "Export Markdown to PDF with ESCOM template",
})

-------------------------------------------------
-- Markdown → PDF
-------------------------------------------------

keymap("n", "<leader>npdf", function()
  if vim.bo.filetype ~= "markdown" then
    vim.notify("This command is only available for Markdown", vim.log.levels.WARN)
    return
  end

  vim.cmd("write")

  local input_file = vim.fn.shellescape(vim.fn.expand("%:t"))
  local file_dir = vim.fn.shellescape(vim.fn.expand("%:p:h"))
  local output_pdf = vim.fn.shellescape(vim.fn.expand("%:t:r") .. ".pdf")

  local command = table.concat({
    "cd",
    file_dir,
    "&&",
    "pandoc",
    input_file,
    "-o",
    output_pdf,
    "--pdf-engine=xelatex",
    "--resource-path=.",
  }, " ")

  vim.cmd("!" .. command)
end, {
  desc = "Export Markdown to PDF",
})

-------------------------------------------------
-- Templates
-------------------------------------------------

keymap("n", "<leader>tc", function()
  insert_template(
    "~/.config/nvim/templates/cpp.cpp",
    "C++ template inserted"
  )
end, {
  desc = "Insert C++ template",
})

keymap("n", "<leader>tl", function()
  local template = {
    "\\begin{center}",
    "\\includegraphics[width=0.9\\textwidth]{image.png}",
    "\\end{center}",
  }

  vim.api.nvim_put(template, "l", true, true)
end, {
  desc = "Insert LaTeX image block",
})

-------------------------------------------------
-- Move lines
-------------------------------------------------

keymap("n", "<A-Up>", "<cmd>move .-2<cr>==", {
  desc = "Move line up",
})

keymap("n", "<A-Down>", "<cmd>move .+1<cr>==", {
  desc = "Move line down",
})

keymap("v", "<A-Up>", ":move '<-2<cr>gv=gv", {
  desc = "Move selection up",
})

keymap("v", "<A-Down>", ":move '>+1<cr>gv=gv", {
  desc = "Move selection down",
})

keymap("i", "<A-Up>", "<Esc><cmd>move .-2<cr>==gi", {
  desc = "Move line up",
})

keymap("i", "<A-Down>", "<Esc><cmd>move .+1<cr>==gi", {
  desc = "Move line down",
})

-------------------------------------------------
-- Dashboard
-------------------------------------------------

keymap("n", "<leader>v", function()
  vim.cmd("enew")
  vim.cmd("Dashboard")
end, {
  desc = "Open dashboard",
})

-------------------------------------------------
-- NvimTree
-------------------------------------------------

keymap("n", "<leader>e", function()
  local api = require("nvim-tree.api")

  if api.tree.is_visible() then
    api.tree.close()
  else
    api.tree.open()
  end
end, {
  desc = "Toggle explorer",
})

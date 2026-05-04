local keymap = vim.keymap

-------------------------------------------------
-- Better window navigation
-------------------------------------------------

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-------------------------------------------------
-- Save / Quit
-------------------------------------------------

keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

-------------------------------------------------
-- Copy
-------------------------------------------------

keymap.set("n", "<leader>y", '"+yy')
keymap.set("v", "<leader>y", '"+y')

-------------------------------------------------
-- Clear search highlight
-------------------------------------------------

keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-------------------------------------------------
-- Resize windows
-------------------------------------------------

keymap.set("n", "<C-Up>", ":resize -2<CR>")
keymap.set("n", "<C-Down>", ":resize +2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-------------------------------------------------
-- C++ (compile only)
-------------------------------------------------

keymap.set("n", "<leader>cc", function()
  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r")

  vim.cmd("w")

  vim.cmd("!" ..
    "g++-15 -std=c++20 -Wall -Wextra " ..
    file .. " -o " .. output
  )
end, { desc = "Compile C++" })

-------------------------------------------------
-- Smart Run (C++ / Rust)
-------------------------------------------------

keymap.set("n", "<leader>r", function()
  vim.cmd("w")

  local file = vim.fn.expand("%:t")
  local ext = vim.fn.expand("%:e")

  -------------------------------------------------
  -- 🦀 RUST
  -------------------------------------------------
  if ext == "rs" then
    local Terminal = require("toggleterm.terminal").Terminal

    local function get_cargo_root()
      local current_dir = vim.fn.expand("%:p:h")
      local cargo_root = vim.fn.findfile("Cargo.toml", current_dir .. ";")

      if cargo_root == "" then
        return nil
      end

      return vim.fn.fnamemodify(cargo_root, ":h")
    end

    local root = get_cargo_root()

    if not root then
      print("No se encontró Cargo.toml")
      return
    end

    Terminal:new({
      cmd = "cargo run; read",
      dir = root,
      hidden = true,
    }):toggle()

    return
  end

  -------------------------------------------------
  -- ⚙️ C++
  -------------------------------------------------
  if ext == "cpp" or ext == "cc" or ext == "cxx" then
    local output = vim.fn.expand("%:r")

    local compile_cmd =
      "g++-15 -std=c++20 -O2 "
      .. file
      .. " -o "
      .. output

    local result = vim.fn.system(compile_cmd)

    if vim.v.shell_error ~= 0 then
      print("Compilation failed")

      vim.cmd("ToggleTerm")

      vim.defer_fn(function()
        vim.fn.chansend(
          vim.b.terminal_job_id,
          compile_cmd .. "\n"
        )
      end, 200)

      return
    end

    vim.cmd("ToggleTerm")

    vim.defer_fn(function()
      vim.fn.chansend(
        vim.b.terminal_job_id,
        "./" .. output .. "\n"
      )
    end, 200)

    return
  end

  -------------------------------------------------
  -- ❌ Otros lenguajes
  -------------------------------------------------
  print("No run command for this file type")

end, { desc = "Run current file/project" })

-------------------------------------------------
-- Markdown Preview
-------------------------------------------------

vim.api.nvim_create_user_command("MdPreview", function()
  vim.fn.system('open -a "Markdowny" "' .. vim.fn.expand("%:p") .. '"')
end, {})

keymap.set("n", "<leader>mp", ":MdPreview<CR>", { desc = "Markdown Preview" })

-------------------------------------------------
-- Markdown → PDF
-------------------------------------------------

keymap.set("n", "<leader>pdfmd", function()

  vim.cmd("write")

  local template =
    os.getenv("HOME") ..
    "/.config/nvim/templates/escom-template.tex"

  local input_file = vim.fn.expand("%:t")
  local file_dir = vim.fn.expand("%:p:h")
  local output_pdf = vim.fn.expand("%:t:r") .. ".pdf"

  local cmd =
    "cd " .. file_dir .. " && " ..
    "pandoc "
    .. input_file .. " "
    .. "-o " .. output_pdf .. " "
    .. "--template=" .. template .. " "
    .. "--pdf-engine=xelatex "
    .. "--syntax-highlighting=idiomatic "
    .. "--resource-path=."

  vim.cmd("!" .. cmd)

end, { desc = "Markdown to PDF" })

-------------------------------------------------
-- Templates
-------------------------------------------------

keymap.set("n", "<leader>tc", function()
  local template = vim.fn.expand("~/.config/nvim/templates/cpp.cpp")

  if vim.fn.filereadable(template) == 1 then
    local lines = vim.fn.readfile(template)

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    print("C++ template inserted")
  else
    print("Template not found")
  end
end, { desc = "Insert C++ template" })

keymap.set("n", "<leader>tl", function()
  local template = {
    "\\begin{center}",
    "\\includegraphics[width=0.9\\textwidth]{image.png}",
    "\\end{center}",
  }

  vim.api.nvim_put(template, "l", true, true)
end, { desc = "Insert LaTeX image block" })

-------------------------------------------------
-- Move lines
-------------------------------------------------

keymap.set("n", "<A-Up>", ":m .-2<CR>==")
keymap.set("n", "<A-Down>", ":m .+1<CR>==")

keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")
keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")

keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")

-------------------------------------------------
-- Dashboard
-------------------------------------------------

keymap.set("n", "<leader>v", function()
  vim.cmd("enew")
  vim.cmd("Dashboard")
end, { desc = "Go to dashboard" })

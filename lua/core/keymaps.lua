local keymap = vim.keymap

-------------------------------------------------
-- Better window navigation
-------------------------------------------------

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-------------------------------------------------
-- Save
-------------------------------------------------

keymap.set("n", "<leader>w", ":w<CR>")

-------------------------------------------------
-- Quit
-------------------------------------------------

keymap.set("n", "<leader>q", ":q<CR>")

-------------------------------------------------
-- Copy
-------------------------------------------------

vim.keymap.set("n", "<leader>y", '"+yy')
vim.keymap.set("v", "<leader>y", '"+y')

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
-- Compile C++
-------------------------------------------------

vim.keymap.set("n", "<leader>c", function()
  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r")

  vim.cmd("w") -- guarda archivo

  vim.cmd("!" ..
    "g++-15 -std=c++17 -Wall -Wextra " ..
    file .. " -o " .. output
  )
end, { desc = "Compile C++" })

-------------------------------------------------
-- Compile + Run C++ (con quickfix)
-------------------------------------------------

vim.keymap.set("n", "<leader>r", function()

  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r")

  local compile_cmd =
    "g++-15 -std=c++20 -O2 "
    .. file
    .. " -o "
    .. output

  -- Ejecutar compilación
  local result = vim.fn.system(compile_cmd)

  -- Si hay error
  if vim.v.shell_error ~= 0 then

    print("Compilation failed")

    -- Mostrar errores en terminal
    vim.cmd("ToggleTerm")

    vim.defer_fn(function()

      vim.fn.chansend(
        vim.b.terminal_job_id,
        compile_cmd .. "\n"
      )

    end, 200)

    return

  end

  -- Si compila bien
  vim.cmd("ToggleTerm")

  vim.defer_fn(function()

    vim.fn.chansend(
      vim.b.terminal_job_id,
      "./" .. output .. "\n"
    )

  end, 200)

end, { desc = "Compile and run C++" })

-------------------------------------------------
-- Markdown Preview
-------------------------------------------------

-- Markdown preview command
vim.api.nvim_create_user_command("MdPreview", function()
  vim.fn.system('open -a "Markdowny" "' .. vim.fn.expand("%:p") .. '"')
end, {})

vim.keymap.set(
  "n",
  "<leader>mp",
  ":MdPreview<CR>",
  { desc = "Markdown Preview" }
)

-------------------------------------------------
-- Markdown → PDF (Pandoc + LaTeX template)
-------------------------------------------------

vim.keymap.set(
  "n",
  "<leader>pdfmd",
  function()

    vim.cmd("write")

    local template =
      os.getenv("HOME") ..
      "/.config/nvim/templates/escom-template.tex"

    local input_file =
      vim.fn.expand("%:t")

    local file_dir =
      vim.fn.expand("%:p:h")

    local output_pdf =
      vim.fn.expand("%:t:r") .. ".pdf"

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

  end,
  { desc = "Markdown to PDF" }
)

-------------------------------------------------
-- Insert C++ ICPC Template
-------------------------------------------------

vim.keymap.set(
  "n",
  "<leader>tc",
  function()

    local template =
      vim.fn.expand(
        "~/.config/nvim/templates/cpp.cpp"
      )

    if vim.fn.filereadable(template) == 1 then

      local lines =
        vim.fn.readfile(template)

      vim.api.nvim_buf_set_lines(
        0,
        0,
        -1,
        false,
        lines
      )

      print("C++ template inserted")

    else

      print("Template not found")

    end

  end,
  { desc = "Insert C++ template" }
)

--------------------------------------------------
-- Insert Latex Image Template
--------------------------------------------------

vim.keymap.set("n", "<leader>tl", function()
  local template = {
    "\\begin{center}",
    "\\includegraphics[width=0.9\\textwidth]{image.png}",
    "\\end{center}",
  }

  vim.api.nvim_put(template, "l", true, true)
end, { desc = "Insertar bloque LaTeX de imagen" })

-- NORMAL

vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==")

-- VISUAL

vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")

-- INSERT

vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")

local M = {}

local Terminal = require("toggleterm.terminal").Terminal

local runner = Terminal:new({
  direction = "horizontal",
  hidden = true,
  close_on_exit = false,
  display_name = "Runner",
})

local function get_file_data()
  return {
    path = vim.fn.expand("%:p"),
    dir = vim.fn.expand("%:p:h"),
    name = vim.fn.expand("%:t"),
    stem = vim.fn.expand("%:t:r"),
    ext = vim.fn.expand("%:e"),
  }
end

local function run_command(command, directory)
  runner.dir = directory
  runner.cmd = command
  runner:toggle()
end

function M.run()
  vim.cmd("write")

  local file = get_file_data()

  if file.path == "" then
    vim.notify("No active file", vim.log.levels.WARN)
    return
  end

  -------------------------------------------------
  -- Rust
  -------------------------------------------------

  if file.ext == "rs" then
    local cargo_file = vim.fs.find("Cargo.toml", {
      path = file.dir,
      upward = true,
    })[1]

    if not cargo_file then
      vim.notify("Cargo.toml not found", vim.log.levels.ERROR)
      return
    end

    local cargo_root = vim.fs.dirname(cargo_file)

    run_command("cargo run", cargo_root)
    return
  end

  -------------------------------------------------
  -- C++
  -------------------------------------------------

  if vim.tbl_contains({ "cpp", "cc", "cxx" }, file.ext) then
    local executable = file.dir .. "/" .. file.stem

    local command = table.concat({
      "g++-15",
      "-std=c++20",
      "-O2",
      "-Wall",
      "-Wextra",
      vim.fn.shellescape(file.path),
      "-o",
      vim.fn.shellescape(executable),
      "&&",
      vim.fn.shellescape(executable),
    }, " ")

    run_command(command, file.dir)
    return
  end

  -------------------------------------------------
  -- Python
  -------------------------------------------------

  if file.ext == "py" then
    run_command(
      "python3 " .. vim.fn.shellescape(file.path),
      file.dir
    )
    return
  end

  vim.notify(
    "No run command for ." .. file.ext,
    vim.log.levels.WARN
  )
end

return M

local jdtls = require("jdtls")

local root_markers = {
  ".git",
  "mvnw",
  "gradlew",
  "pom.xml",
  "build.gradle",
}

local root_dir = require("jdtls.setup").find_root(root_markers)

if root_dir == "" then
  return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")

local workspace_dir =
  vim.fn.stdpath("data")
  .. "/jdtls-workspaces/"
  .. project_name

jdtls.start_or_attach({
  cmd = {
    "jdtls",
    "-data",
    workspace_dir,
  },

  root_dir = root_dir,
})

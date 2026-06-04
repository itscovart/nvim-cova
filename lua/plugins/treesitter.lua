return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  event = { "BufReadPost", "BufNewFile" },

  config = function()

    local ok, configs = pcall(require, "nvim-treesitter.configs")

    if not ok then
      return
    end

    configs.setup({

      ensure_installed = {
        "cpp",
        "c",
        "python",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "sql",
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },

    })

  end,
}

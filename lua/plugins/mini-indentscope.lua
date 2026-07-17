return {
  "echasnovski/mini.indentscope",
  version = false,

  opts = {
    symbol = "▏",

    options = {
      try_as_border = true,
    },

    draw = {
      delay = 0,
    },

    mappings = {
      object_scope = "ii",
      object_scope_with_border = "ai",
    },

    symbol = "▏",
  },

  config = function(_, opts)
    require("mini.indentscope").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "dashboard",
        "alpha",
        "starter",
        "lazy",
        "mason",
        "help",
        "notify",
      },

      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}

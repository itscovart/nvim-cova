require("core.options")
require("core.keymaps")
require("core.autocmds")

return require("lazy").setup({
    require("plugins.theme"),
    require("plugins.telescope"),
    require("plugins.harpoon"),
    require("plugins.treesitter"),
    require("plugins.lsp"),
    require("plugins.conform"),
    require("plugins.toggleterm"),
    require("plugins.flash"),
    require("plugins.lualine"),
    require("plugins.multicursor"),
    require("plugins.dashboard"),
    require("plugins.oil"),
    require("plugins.todo-comments"),
    require("plugins.mini-indentscope"),
    require("plugins.nvimtree"),
    require("plugins.jdtls"),
    require("plugins.blink"),
    require("plugins.trouble"),
    require("plugins.which-key"),
})

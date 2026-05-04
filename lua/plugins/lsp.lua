return {
  "neovim/nvim-lspconfig",

  config = function()

    -------------------------------------------------
    -- Keymaps cuando LSP se conecta
    -------------------------------------------------

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)

        local opts = { buffer = event.buf }

        -- Go to definition
        vim.keymap.set("n", "gd",
          vim.lsp.buf.definition, opts)

        -- Hover
        vim.keymap.set("n", "K",
          vim.lsp.buf.hover, opts)

        -- References
        vim.keymap.set("n", "gr",
          vim.lsp.buf.references, opts)

        -- Rename
        vim.keymap.set("n", "<leader>rn",
          vim.lsp.buf.rename, opts)

        -- Diagnostics navigation
        vim.keymap.set("n", "[d",
          vim.diagnostic.goto_prev, opts)

        vim.keymap.set("n", "]d",
          vim.diagnostic.goto_next, opts)

        -- 🔥 VER ERROR EN LÍNEA (muy importante)
        vim.keymap.set("n", "gl",
          vim.diagnostic.open_float, opts)

        -- 🔥 Lista de errores
        vim.keymap.set("n", "<leader>e",
          vim.diagnostic.setloclist, opts)

      end,
    })

    -------------------------------------------------
    -- C / C++
    -------------------------------------------------

    vim.lsp.config("clangd", {
      cmd = { "clangd" },
    })

    vim.lsp.enable("clangd")

    -------------------------------------------------
    -- Python
    -------------------------------------------------

    vim.lsp.config("pyright", {})

    vim.lsp.enable("pyright")

    -------------------------------------------------
    -- Rust
    -------------------------------------------------

    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = true,
        },
      },
    })
    vim.lsp.enable("rust_analyzer")

  end,
}



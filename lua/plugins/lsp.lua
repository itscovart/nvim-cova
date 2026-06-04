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

    -------------------------------------------------
    -- HTML
    -------------------------------------------------

    vim.lsp.config("html", {})
    vim.lsp.enable("html")

    -------------------------------------------------
    -- CSS
    -------------------------------------------------

    vim.lsp.config("cssls", {})
    vim.lsp.enable("cssls")

    -------------------------------------------------
    -- JSON
    -------------------------------------------------

    vim.lsp.config("jsonls", {})
    vim.lsp.enable("jsonls")

    -------------------------------------------------
    -- JavaScript / TypeScript
    -------------------------------------------------

    vim.lsp.config("ts_ls", {
      cmd = {
        "typescript-language-server",
        "--stdio",
      },

      init_options = {
        hostInfo = "neovim",
        tsserver = {
          path = "/Users/itscovart/Library/pnpm/store/v11/links/@/typescript/5.9.3/86852851065618a77b8365a4daeb70e416bfcdbbe1c91f862babcda952119f61/node_modules/typescript/lib/tsserver.js",
        },
      },
    })

    vim.lsp.enable("ts_ls")
    
    -------------------------------------------------
    -- SQL
    -------------------------------------------------

    vim.lsp.config("sqlls", {})
    vim.lsp.enable("sqlls")

    -------------------------------------------------
    -- Emmet
    -------------------------------------------------

    vim.lsp.config("emmet_ls", {
      cmd = {
        "emmet-language-server",
        "--stdio",
      },
      filetypes = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "typescriptreact",
      },
    })

    vim.lsp.enable("emmet_ls")

  end,
}



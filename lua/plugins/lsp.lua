return {
  "neovim/nvim-lspconfig",

  config = function()

          -------------------------------------------------
    -- Diagnostics
    -------------------------------------------------

    local severity = vim.diagnostic.severity

    vim.diagnostic.config({
        severity_sort = true,

        update_in_insert = false,

        underline = {
            severity = {
                min = severity.WARN,
            },
        },

        signs = {
            text = {
                [severity.ERROR] = "●",
                [severity.WARN] = "●",
                [severity.INFO] = "●",
                [severity.HINT] = "●",
            },
        },

        virtual_text = {
            spacing = 3,
            source = "if_many",
            prefix = "●",
            severity = {
                min = severity.WARN,
            },
        },

        virtual_lines = false,

        float = {
            border = "rounded",
            source = "if_many",
            header = "",
            prefix = "",
            focusable = true,
        },
    })

    -------------------------------------------------
    -- Keymaps cuando LSP se conecta
    -------------------------------------------------

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local opts = {
                buffer = event.buf,
                silent = true,
            }

            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(
                    mode,
                    lhs,
                    rhs,
                    vim.tbl_extend("force", opts, {
                        desc = desc,
                    })
                )
            end

            -------------------------------------------------
            -- Navigation
            -------------------------------------------------

            map(
                "n",
                "gd",
                vim.lsp.buf.definition,
                "Go to definition"
            )

            map(
                "n",
                "gr",
                vim.lsp.buf.references,
                "Show references"
            )

            map(
                "n",
                "gD",
                vim.lsp.buf.declaration,
                "Go to declaration"
            )

            map(
                "n",
                "gi",
                vim.lsp.buf.implementation,
                "Go to implementation"
            )

            -------------------------------------------------
            -- Information
            -------------------------------------------------

            map("n", "K", function()
                vim.lsp.buf.hover({
                    border = "rounded",
                    max_width = 80,
                    max_height = 20,
                })
            end, "LSP hover")

            map("i", "<C-k>", function()
                vim.lsp.buf.signature_help({
                    border = "rounded",
                    max_width = 80,
                    max_height = 15,
                })
            end, "Signature help")

            -------------------------------------------------
            -- Code actions
            -------------------------------------------------

            map(
                { "n", "v" },
                "<leader>ca",
                vim.lsp.buf.code_action,
                "Code actions"
            )

            map(
                "n",
                "<leader>rn",
                vim.lsp.buf.rename,
                "Rename symbol"
            )

            -------------------------------------------------
            -- Diagnostics
            -------------------------------------------------

            map("n", "[d", function()
                vim.diagnostic.jump({
                    count = -1,
                    float = true,
                })
            end, "Previous diagnostic")

            map("n", "]d", function()
                vim.diagnostic.jump({
                    count = 1,
                    float = true,
                })
            end, "Next diagnostic")

            map("n", "gl", function()
                vim.diagnostic.open_float({
                    scope = "cursor",
                    border = "rounded",
                    source = "if_many",
                })
            end, "Show line diagnostic")

            map("n", "<leader>dl", function()
                vim.diagnostic.setloclist({
                    open = true,
                })
            end, "Diagnostic list")
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



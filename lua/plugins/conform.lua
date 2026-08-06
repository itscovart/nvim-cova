return {
	"stevearc/conform.nvim",

	config = function()
		local conform = require("conform")

		conform.setup({

			formatters_by_ft = {

				cpp = { "clang-format" },
				c = { "clang-format" },

				python = { "black" },

				rust = { "rustfmt" },

				lua = { "stylua" },

				sql = { "sqlfluff" },

				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
			},
		})

		-------------------------------------------------
		-- Keymap manual
		-------------------------------------------------

		vim.keymap.set("n", "<leader>f", function()
			conform.format({
				lsp_fallback = true,
			})
		end, { desc = "Format file" })
	end,
}

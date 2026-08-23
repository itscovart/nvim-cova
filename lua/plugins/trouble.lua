return {
	"folke/trouble.nvim",

	cmd = "Trouble",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		focus = true,
		auto_close = false,
		auto_open = false,
		auto_preview = true,

		win = {
			type = "split",
			position = "bottom",
			size = 12,
		},

		preview = {
			type = "main",
			scratch = false,
		},

		icons = {
			indent = {
				top = "│ ",
				middle = "├╴",
				last = "└╴",
				fold_open = " ",
				fold_closed = " ",
				ws = "  ",
			},

			folder_closed = " ",
			folder_open = " ",
			kinds = {},
		},
	},

	keys = {
		{
			"<leader>dd",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Workspace diagnostics",
		},

		{
			"<leader>db",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer diagnostics",
		},

		{
			"<leader>ds",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Document symbols",
		},

		{
			"<leader>dr",
			"<cmd>Trouble lsp_references toggle<cr>",
			desc = "LSP references",
		},

		{
			"<leader>dq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix list",
		},

		{
			"<leader>dl",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location list",
		},
	},
}

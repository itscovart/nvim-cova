return {
	"lervag/vimtex",

	tag = "v2.17",

	lazy = false,

	init = function()
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1

		-------------------------------------------------
		-- Viewer
		-------------------------------------------------

		vim.g.vimtex_view_method = "skim"

		-------------------------------------------------
		-- Compiler
		-------------------------------------------------

		vim.g.vimtex_compiler_method = "latexmk"

		vim.g.vimtex_compiler_latexmk = {
			out_dir = "build",
			callback = 1,
			continuous = 1,
			executable = "latexmk",

			options = {
				"-pdf",
				"-interaction=nonstopmode",
				"-synctex=1",
			},
		}

		-------------------------------------------------
		-- VimTeX mappings
		-------------------------------------------------

        vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_mappings_enabled = 0
	end,
}

return {
	"ThePrimeagen/harpoon",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		-------------------------------------------------
		-- Keymaps
		-------------------------------------------------

		-- Add file
		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })

		-- Remove file (🔥 NUEVO)
		vim.keymap.set("n", "<leader>d", mark.rm_file, { desc = "Harpoon remove file" })

		-- Show menu
		vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Harpoon menu" })

		-- Jump to files
		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end)

		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end)

		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end)

		vim.keymap.set("n", "<leader>4", function()
			ui.nav_file(4)
		end)

		vim.keymap.set("n", "<leader>5", function()
			ui.nav_file(5)
		end)

		vim.keymap.set("n", "<leader>6", function()
			ui.nav_file(6)
		end)

		vim.keymap.set("n", "<leader>7", function()
			ui.nav_file(7)
		end)

		vim.keymap.set("n", "<leader>8", function()
			ui.nav_file(8)
		end)
	end,
}

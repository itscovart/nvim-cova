-------------------------------------------------
-- Highlight yanked text
-------------------------------------------------

local yank_group = vim.api.nvim_create_augroup("PantherYankHighlight", {
	clear = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	desc = "Highlight yanked text",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-------------------------------------------------
-- Auto-save
-------------------------------------------------

local autosave_group = vim.api.nvim_create_augroup("PantherAutoSave", {
	clear = true,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "FocusLost" }, {
	group = autosave_group,
	desc = "Auto-save modified files",
	callback = function(args)
		local buffer = args.buf

		if not vim.api.nvim_buf_is_valid(buffer) then
			return
		end

		if not vim.bo[buffer].modifiable then
			return
		end

		if vim.bo[buffer].readonly then
			return
		end

		if vim.bo[buffer].buftype ~= "" then
			return
		end

		if vim.api.nvim_buf_get_name(buffer) == "" then
			return
		end

		if not vim.bo[buffer].modified then
			return
		end

		vim.api.nvim_buf_call(buffer, function()
			vim.cmd("silent! write")
		end)
	end,
})

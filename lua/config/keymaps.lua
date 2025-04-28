-- buffers
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bD", ":bdelete!<CR>", { desc = "Force Delete Buffer" })
vim.keymap.set("n", "<leader>bo", function()
	local current = vim.api.nvim_get_current_buf()
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	for _, buf in ipairs(buffers) do
		if buf.bufnr ~= current then
			vim.cmd("bdelete " .. buf.bufnr)
		end
	end
end, { desc = "Delete Other Buffers" })

vim.keymap.set("n", "<leader>sa", function()
	vim.cmd("normal! gg")
	vim.cmd("normal! ^")
	vim.cmd("normal! v")
	vim.cmd("normal! G")
	vim.cmd("normal! $")
end, { desc = "Select All" })

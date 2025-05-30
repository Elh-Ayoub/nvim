vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Clear Highlight Search" })
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
end, { desc = "Select all file content" })

-- Moving lines
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- Window jump with keeping cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- paste with losing yanked text
vim.keymap.set("x", "<leader>p", '"_dp')

-- replace word in all file
vim.keymap.set(
	"n",
	"<leader>frw",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word in all the file" }
)

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- references navigation
vim.keymap.set("n", "<leader>ck", "<cmd>cnext<CR>zz", { desc = "Go to next reference" })
vim.keymap.set("n", "<leader>cj", "<cmd>cprev<CR>zz", { desc = "Go to prev reference" })

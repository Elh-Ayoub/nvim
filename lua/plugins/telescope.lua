return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Telescope find buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope go to references" })
			--git
			vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git files " })
			vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "Telescope git commits" })
			vim.keymap.set("n", "<leader>bc", builtin.git_bcommits, { desc = "Telescope Buffer git commits" })
			vim.keymap.set("n", "<leader>fb", builtin.git_branches, { desc = "Telescope git branches" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("harpoon").setup({
			vim.keymap.set(
				"n",
				"<leader>ha",
				':lua require("harpoon.mark").add_file()<CR>',
				{ desc = "Mark File - Harpoon" }
			),
			vim.keymap.set(
				"n",
				"<leader>hl",
				':lua require("harpoon.ui").toggle_quick_menu()<CR>',
				{ desc = "Mark File - Harpoon" }
			),
			vim.keymap.set(
				"n",
				"<leader>1",
				':lua require("harpoon.ui").nav_file(1)<CR>',
				{ desc = "Mark File - Harpoon" }
			),
			vim.keymap.set(
				"n",
				"<leader>2",
				':lua require("harpoon.ui").nav_file(2)<CR>',
				{ desc = "Mark File - Harpoon" }
			),
			vim.keymap.set(
				"n",
				"<leader>3",
				':lua require("harpoon.ui").nav_file(3)<CR>',
				{ desc = "Mark File - Harpoon" }
			),
			vim.keymap.set(
				"n",
				"<leader>4",
				':lua require("harpoon.ui").nav_file(4)<CR>',
				{ desc = "Mark File - Harpoon" }
			),
		})
	end,
}

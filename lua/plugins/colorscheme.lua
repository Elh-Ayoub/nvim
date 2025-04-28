return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
			highlight_groups = {
				NormalFloat = { bg = "none" },
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
}

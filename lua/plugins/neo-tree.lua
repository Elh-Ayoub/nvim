return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				hijack_netrw_behavior = "disabled", -- or "open_default" or "open_current"
			},
			source_selector = {
				winbar = false,
				statusline = false,
				show_scrolled_off_parent_node = false,
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Open File Explore" })
	end,
}

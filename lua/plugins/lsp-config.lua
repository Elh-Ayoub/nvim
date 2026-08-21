return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
			vim.keymap.set("n", "<leader>cm", ":Mason<CR>", { desc = "Open Mason" })
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup({
				handlers = {
					function(server)
						vim.lsp.config(server, {
							capabilities = capabilities,
						})
					end,
				},
			})

			-- ignore css unknown tailwind rules
			vim.lsp.config("cssls", {
				settings = {
					css = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
			})

			-- lsp keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Definition" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "Show Code References" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
			vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "LSP Diagnostics" })
			vim.keymap.set("n", "<leader>dn", function()
				vim.diagnostic.jump({ count = 1 })
			end, { desc = "Jump to next diagnostics" })
			vim.keymap.set("n", "<leader>dp", function()
				vim.diagnostic.jump({ count = -1 })
			end, { desc = "Jump to previous diagnostics" })
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, { desc = "Show Signature Help " })
		end,
	},
}

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
			vim.keymap.set("n", "<leader>cm", ":Mason<CR>", { desc = "Open Mason" })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- lspconfig.lua_ls.setup({ capabilities = capabilities })
			-- lspconfig.ts_ls.setup({ capabilities = capabilities })
			-- lspconfig.angularls.setup({ capabilities = capabilities })
			local lspconfig_defaults = lspconfig.util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)
			--
			require("mason-lspconfig").setup_handlers({
				function(server)
					lspconfig[server].setup({ capabilities = capabilities })
				end,
			})

			---
			lspconfig.cssls.setup({
				settings = {
					css = {
						validate = true,
						lint = {
							unknownAtRules = "igonre",
						},
					},
				},
			})
			---
			-- require("mason-lspconfig").setup_handlers({
			-- require("mason-lspconfig").setup_handlers({
			-- 	function(server)
			-- 		lspconfig[server].setup({})
			-- 	end,
			-- })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Definition" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Format" })
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "Show References" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
			vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "LSP Diagnostics" })
		end,
	},
}

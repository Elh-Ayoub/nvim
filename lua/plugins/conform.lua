return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback", lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = {}
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 3000,
					lsp_format = "fallback",
				}
			end
		end,
		formatters = {
			prettier = {
				prepend_args = {
					"--tab-width",
					"4",
					"--print-width",
					"9999",
					"--prose-wrap",
					"never",
					"--html-whitespace-sensitivity",
					"strict",
					"--bracket-same-line",
					"true",
				},
			},
		},
		default_format_opts = {
			timeout_ms = 3000,
			async = false, -- not recommended to change
			quiet = false, -- not recommended to change
			lsp_format = "fallback", -- not recommended to change
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use 'stop_after_first' to run the first available formatter from the list
			javascript = { "prettier" },
			html = { "prettier" },
			typescript = { "prettier" },
			css = { "prettier" },
			json = { "prettier" },
			c = { "clang-format" },
		},
	},
}
-- return {
-- 	"nvimtools/none-ls.nvim",
-- 	dependencies = {
-- 		"nvimtools/none-ls-extras.nvim",
-- 	},
-- 	config = function()
-- 		local null_ls = require("null-ls")
-- 		null_ls.setup({
-- 			sources = {
-- 				-- null_ls.builtins.formatting.stylua,
-- 				-- null_ls.builtins.formatting.prettier,
-- 				-- require("none-ls.diagnostics.eslint_d"),
-- 			},
-- 		})
-- 	end,
-- }

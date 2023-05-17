return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		config = function()
 			local null_ls = require("null-ls")
			null_ls.setup({
 				sources = {
					-- lua代码格式化
-- 					null_ls.builtins.formatting.stylua,
 				},
			})
		end,
	},
	{ "williamboman/mason.nvim", event = "VeryLazy" },
	{ "williamboman/mason-lspconfig.nvim", event = "VeryLazy" },
	{
		"neovim/nvim-lspconfig",
		event = "BufRead",
		-- use commit
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("lsp-setup")
		end,
	},
}

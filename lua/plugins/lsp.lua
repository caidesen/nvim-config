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
	{ "williamboman/mason.nvim",           event = "VeryLazy" },
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
	{
		"L3MON4D3/LuaSnip", event = "VeryLazy",
	},
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/nvim-cmp',
		}
	},
	{
		"folke/neodev.nvim",
		event = "VeryLazy",
		config = function ()
		end
	},
}

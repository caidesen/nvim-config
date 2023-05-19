return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
		--	{ "<C-e>", ":lua project_picker(require('telescope.themes').get_dropdown{})<CR>", desc = "smart location" },
			{ "<Leader>p", ":Telescope find_files<CR>", desc = "find files", {} },
			{ "<Leader>P", ":Telescope live_grep<CR>",desc = "grep file", {} },
			{ "<Leader>o", ":Telescope lsp_document_symbols<CR>", desc = "", {} },
			{ "<Leader>rs", ":Telescope resume<CR>", desc = "telescope resume", {} },
			{ "<Leader>q", ":Telescope oldfiles<CR>", desc = "oldfiles", {} },
		},
	},
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
}

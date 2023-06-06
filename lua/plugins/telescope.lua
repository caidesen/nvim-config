return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			{ "<Leader>p", ":Telescope find_files<CR>", desc = "find files", {} },
			{ "<Leader>P", ":Telescope live_grep<CR>", desc = "grep file", {} },
			{ "<Leader>rs", ":Telescope resume<CR>", desc = "telescope resume", {} },
			{ "<Leader>o", ":Telescope oldfiles<CR>", desc = "oldfiles", {} },
		},
	},
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
}

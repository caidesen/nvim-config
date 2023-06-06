-- colors
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			local catppuccin = require("catppuccin")
			catppuccin.setup({
				integrations = {
					cmp = true,
					nvimtree = true,
					telescope = true,
					gitsigns = true,
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				extensions = { "fugitive" },
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				options = {
					theme = "catppuccin",
					disabled_filetypes = {
						statusline = {'NvimTree'},
						winbar = {'NvimTree'},
					},
				},
			})
		end,
	},
}

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
			local function diff_source()
				local gitsigns = vim.b.gitsigns_status_dict
				if gitsigns then
					return {
						added = gitsigns.added,
						modified = gitsigns.changed,
						removed = gitsigns.removed,
					}
				end
			end
			require("lualine").setup({
				extensions = { "fugitive" },
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", { "diff", source = diff_source }, "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				options = {
					theme = "catppuccin",
					disabled_filetypes = {
						statusline = { "NvimTree" },
						winbar = { "NvimTree" },
					},
				},
			})
		end,
	},
}

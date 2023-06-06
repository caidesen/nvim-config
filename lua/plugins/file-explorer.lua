-- file-explorer
return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeFindFile", "NvimTreeToggle" },
		keys = {
			{ "<leader>l", ":NvimTreeFindFile<CR>", desc = "current location" },
			{ "<leader>t", ":NvimTreeToggle<CR>", desc = "tree toggle" },
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true
			require("nvim-tree").setup({
				view = {
					width = { max = 40 },
					number = true, -- show line number
					statusBar = false,
				},
				filters = {
					custom = { "^\\.git$" }, -- hidden .git directory
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		after = "catppuccin",
		config = function()
			vim.opt.termguicolors = true
			local mocha = require("catppuccin.palettes").get_palette("mocha")
			vim.keymap.set("n", "<Leader>b", ":BufferLinePick<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<Leader>B", ":BufferLinePickClose<CR>", { noremap = true, silent = true })
			require("bufferline").setup({
				highlights = require("catppuccin.groups.integrations.bufferline").get({
					styles = { "italic", "bold" },
					custom = {
						mocha = {
							background = { fg = mocha.text },
						},
					},
				}),
				options = {
					numbers = "ordinal",
					diagnostics = "nvim_lsp",
					-- diagnostics_indicator = function(count)
					-- 	return "(" .. count .. ")"
					-- end,
					offsets = {
						{
							filetype = "NvimTree",
							text = "🥷 File Explorer",
						},
					},
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = true,
					show_tab_indicators = true,
					persist_buffer_sort = true,
					separator_style = "slant",
					enforce_regular_tabs = false,
					sort_by = "directory",
				},
			})
		end,
	},
}

-- 文件浏览器
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
				filters = {
					custom = { "^\\.git$" },
				},
			})
		end,
	},
}

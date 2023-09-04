return {
	-- {
	-- 	"github/copilot.vim",
	-- 	event = "VeryLazy",
	-- },
	{
		"Exafunction/codeium.vim",
		event = "VeryLazy",
		config = function()
			vim.g.codeium_idle_delay = 75
			vim.g.codeium_disable_bindings = 1
			vim.keymap.set("i", "<Tab>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
		end,
	},
}

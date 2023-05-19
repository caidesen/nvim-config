local nvim_lsp = require("lspconfig")
local configs = require("lspconfig.configs")

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"jsonls",
	},
})
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- change hold time
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "single",
		focusable = false,
		max_width = 80,
		max_height = 20,
	})
	-- cousor hold for 3 seconds, show signature helper
	-- silent
	-- vim.api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.hover() ]]
	-- Mappings.
	local opts = { noremap = true, silent = true }
	-- gh 显示提示
	buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	-- 重命名
	buf_set_keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>", opts)
end
-- 需要通用配置的server
local common_servers = {
	"jsonls",
	"lua_ls",
	"tsserver",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local clangdCap = vim.lsp.protocol.make_client_capabilities()
clangdCap.offsetEncoding = { "utf-16" }
-- require("lspconfig").clangd.setup({ capabilities = clangdCap, on_attach = on_attach })
for _, server in pairs(common_servers) do
	-- https://www.reddit.com/r/neovim/comments/mm1h0t/lsp_diagnostics_remain_stuck_can_someone_please/
	nvim_lsp[server].setup({
		flags = {
			allow_incremental_sync = false,
			debounce_text_changes = 500,
		},
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

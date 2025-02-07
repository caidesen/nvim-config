local util = require("lspconfig.util")
local nvim_lsp = require("lspconfig")
local configs = require("lspconfig.configs")
local tele_builtin = require("telescope.builtin")

-- disable diagnostic in insert mode,
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	update_in_insert = false,
})

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
		"ts_ls", -- typescript
		"volar", -- vue3
		"cssls",
		"tailwindcss",
		"html",
		"gopls", -- golang lsp
	},
})

-- 需要通用配置的server
local common_servers = {
	"jsonls",
	"lua_ls",
	-- "ts_ls",
	"volar",
	"html",
	"gopls",
	"tailwindcss",
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
for _, server in pairs(common_servers) do
	-- https://www.reddit.com/r/neovim/comments/mm1h0t/lsp_diagnostics_remain_stuck_can_someone_please/
	nvim_lsp[server].setup({
		flags = {
			allow_incremental_sync = false,
			debounce_text_changes = 500,
		},
		capabilities = capabilities,
	})
end
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", function()
			tele_builtin.lsp_definitions()
		end, opts)
		vim.keymap.set("n", "gr", function()
			tele_builtin.lsp_references()
		end, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<Leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<Leader>D", function()
			tele_builtin.type_definition()
		end, opts)
		vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<Leader>f", function()
			vim.lsp.buf.format({
				async = true,
				filter = function(client)
					-- apply whatever logic you want (in this example, we'll only use null-ls)
					return client.name == "null-ls"
				end,
			})
		end, opts)
	end,
})

-- custom vue lsp server
nvim_lsp.ts_ls.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/usr/local/lib/node_modules/@vue/language-server",
				languages = { "vue" },
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	flags = {
		allow_incremental_sync = false,
		debounce_text_changes = 500,
	},
	capabilities = capabilities,
})
nvim_lsp.cssls.setup({
	settings = {
		css = {
			validate = false,
		},
		less = {
			validate = false,
		},
		scss = {
			validate = false,
		},
	},
})

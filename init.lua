vim.g.mapleader = " "
vim.g.maplocalleader = " "
local set = vim.o
set.number = true -- show line number
set.relativenumber = true
set.clipboard = "unnamed" -- use system clipboard
set.encoding = "utf8"
set.termguicolors = true
set.ts = 2
set.sts = 2
set.sw = 2
set.hlsearch = true
set.autoindent = true
set.smartindent = true
set.mouse = "a"
set.clipboard = "unnamed"
set.modifiable = true
set.smartcase = true
set.scrolloff = 4

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd.colorscheme("catppuccin")

-- load nvim session
require("start")

-- load keymap
require("keymap")

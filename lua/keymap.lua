local opt = { noremap = true, silent = true }

local set = vim.keymap.set
set("n", "<Leader>Q", ':lua require("start").Stop()<CR>', opt)
set("n", "<Leader>v", "<C-w>v", opt)
set("n", "<Leader>s", "<C-w>s", opt)

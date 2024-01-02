-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("i", "<S-Insert>", "<C-R>+", { noremap = true })
vim.api.nvim_set_keymap("c", "<S-Insert>", "<C-R>+", { noremap = true })
vim.api.nvim_set_keymap("v", "<S-Insert>", '"0p', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ww", ":w!<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>i", ":e $MYVIMRC<cr>", { noremap = true })

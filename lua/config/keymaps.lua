-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<S-Insert>", "<C-R>+", { desc = "Paste" })
vim.keymap.set("n", "<S-Insert>", "<C-R>+", { desc = "Paste" })
